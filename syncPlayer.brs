LIBRARY "time.brs"

function createSyncPlayer(_config as Object) as Object
  player = createObject("roAssociativeArray")
  player.config = _config

  player.cmsState = "idle"
  
  if player.config.syncMode = "leader" or player.config.syncMode = "solo" then
    player.transportState = "starting"
  else
    player.transportState = "idle"
  end if

  ' Set up the http request and response handlers
  player.apiRequest= createObject("roUrlTransfer")
  player.apiResponsePort = createObject("roMessagePort")
  player.apiRequest.setPort(player.apiResponsePort )

  player.downloadRequest = createObject("roUrlTransfer")
  player.downloadResponsePort = createObject("roMessagePort")
  player.downloadRequest.setPort(player.downloadResponsePort)

  ' Give the player methods
  player.run = runMachines
  player.sync = syncMachine
  player.cms = cmsMachine
  player.transport = transportMachine
  player.submitTimestamp = submitTimestamp
  player.markLocalStart = markLocalStart
  player.setupUDP = setupUDP
  player.setupVideoWindow = setupVideoWindow
  player.handleUDP = handleUDP
  player.dlContentToFile = dlContentToFile
  player.changeVideopath = changeVideopath
  player.loadVideoFile = loadVideoFile

  ' Video timing fields
  player.lastCycleStartedAt = 0
  player.duration = 0

  ' Screen resolution settings
  player.videoMode = CreateObject("roVideoMode")
  player.videoMode.setMode("auto")

  ' Create a clock and sync it
  player.clock = createClock(player.config.syncURL,player.config.password)


  ' Video port for events
  player.videoPort = createObject("roMessagePort")

  ' Init the video playback object
  player.video = createObject("roVideoPlayer")
  player.video.setPort(player.videoPort)
  player.video.setViewMode(0) 
  player.video.setVolume(15) ' see config stuff in master from zachpoff

  ' Load the currently selected video and report its duration
  player.loadVideoFile()

  ' UDP Setup
  player.setupUDP()

  ' Window setup
  print "Sleeping so that video dimensions can be parsed..."
  sleep(1000)
  player.setupVideoWindow()
  
  return player
end function

function loadVideoFile()
  print "Preloading video..."
  print "Preload status:", m.video.preloadFile(m.config.videopath)
  m.duration = m.video.getDuration()-20

  ' Update the server with the newly determined timestamp
  print "Updating duration on server..."
  m.apiRequest.setUrl(m.config.syncURL+"/api/work/"+m.config.id+"/duration")
  updateDurationData = "password="+m.config.password+"&"
  updateDurationData = updateDurationData+"duration="+m.duration.toStr()
  m.apiRequest.asyncPostFromString(updateDurationData)
end function

function setupUDP()
  print "Setting up udp port", m.config.commandPort.toInt()
  m.udpSocket = createObject("roDatagramSocket")
  m.udpSocket.bindToLocalPort(m.config.commandPort.toInt())
  m.udpPort = createObject("roMessagePort")
  m.udpSocket.setPort(m.udpPort)
  m.udpSocket.joinMulticastGroup("239.192.0.0")
  m.udpSocket.joinMulticastGroup("239.192.0."+m.config.syncGroup)
  if m.config.syncMode = "leader" then
    m.udpSocket.joinMulticastGroup("239.192.1.0")
    m.udpSocket.joinMulticastGroup("239.192.1."+m.config.syncGroup)
  else if m.config.syncMode = "follower" then
    m.udpSocket.joinMulticastGroup("239.192.2.0")
    m.udpSocket.joinMulticastGroup("239.192.2."+m.config.syncGroup)
  end if
end function

function setupVideoWindow()
  m.width = m.video.getStreamInfo().videoWidth
  m.height = m.video.getStreamInfo().videoHeight
  m.aspectRatio = m.width / m.height
  _window = ParseJSON(ReadAsciiFile("window.json"))
  if not _window = invalid then
    print "Loading window mapping from disk..."
    print(_window)
    m.window = createObject("roRectangle", _window.x,_window.y,_window.w,_window.h)
  else 
    print "Using default window mapping..."
    print "Width: ", m.width
    print "Height: ", m.height
    wFactor = 1920/m.width
    hFactor = 1080/m.height
    factor = hFactor
    hOffset = 0
    wOffset = ( 1920-factor*m.width )/2
    if wFactor < hFactor then 
      factor = wFactor
      wOffset = 0
      hOffset = ( 1080-factor*m.height )/2
    end if
    m.window = createObject("roRectangle",wOffset,hOffset, m.width * factor , m.height* factor )
  end if
  m.video.setRectangle(m.window)
end function

function markLocalStart()
  m.lastCycleStartedAt = m.clock.getEpochAsMSString()
end function

function submitTimestamp() ' as String
  m.apiRequest.setUrl(m.config.syncURL+"/api/work/"+m.config.id+"/timestamp")
  postString = "password="+m.apiRequest.escape(m.config.password)+"&"
  postString = postString+"lastTimestamp="+m.apiRequest.escape(m.clock.synchronizeTimestamp(m.lastCycleStartedAt))
  m.apiRequest.asyncPostFromString(postString)
  ' response = m.apiResponsePort .waitMessage(1000)
  ' if not response = invalid then
  '   response = response.getString()
  '   return response
  ' else 
  '   return "invalid"
  ' end if
end function

function handleUDP()
  msg = m.udpPort.getMessage() 
  if not msg = invalid
    sourceIP = msg.getSourceHost()
    if msg="pause" then
        m.video.pause()
    else if msg="start" then
      m.transportState = "starting"
    else if msg="play" then
      m.video.resume()
    else if msg = "playReset" then 
      m.clock.markStart()
      m.video.seek(0)
      seekTime = m.clock.markElapsed()
      m.video.play()
      x = m.clock.markElapsed()
      print "New playback position: (ms)", m.video.getPlaybackPosition()
      print "seeking to beginning (ms):", seekTime
      print "seeking to beginning then playing took (ms):", x-seekTime
      m.transportState = "idle"
    else if msg = "printLoc" then 
      print "Playback Position: (ms)", m.video.getPlaybackPosition()
    else if msg="seek+" then
      m.video.seek(m.video.getPlaybackPosition()+100)
    else if msg="seek-" then
      m.video.seek(m.video.getPlaybackPosition()-100)
    else if msg="seek++" then
      m.video.seek(m.video.getPlaybackPosition()+1000)
    else if msg="seek--" then
      m.video.seek(m.video.getPlaybackPosition()-1000)
    else if msg="seek+++" then
      m.video.seek(m.video.getPlaybackPosition()+10000)
    else if msg="seek---" then
      m.video.seek(m.video.getPlaybackPosition()-10000)
    else if msg="ff" then
      m.video.setPlaybackSpeed(2)
    else if msg="fff" then
      m.video.setPlaybackSpeed(8)
    else if msg="rr" then
      m.video.setPlaybackSpeed(-2)
    else if msg="rrr" then
      m.video.setPlaybackSpeed(-8)
    else if msg="defaultspeed" then
      m.video.setPlaybackSpeed(1)
    else if msg="stretchX" then 
      m.window.setWidth(m.window.getWidth() + 6)
      m.window.setX(m.window.getX()-3)
      m.video.setRectangle(m.window)
    else if msg="compressX" then 
      m.window.setWidth(m.window.getWidth() - 6)
      m.window.setX(m.window.getX()+3)
      m.video.setRectangle(m.window)
    else if msg="stretchY" then 
      m.window.setHeight(m.window.getHeight() + 6)
      m.window.setY(m.window.getY()-3)
      m.video.setRectangle(m.window)
    else if msg="compressY" then 
      m.window.setHeight(m.window.getHeight() - 6)
      m.window.setY(m.window.getY()+3)
      m.video.setRectangle(m.window)
    else if msg="enlarge" then 
      m.window.setHeight(m.window.getHeight() + 6)
      m.window.setY(m.window.getY()-3)
      m.window.setWidth(m.window.getWidth() + 6*m.aspectRatio)
      m.window.setX(m.window.getX()-3*m.aspectRatio)
      m.video.setRectangle(m.window)
    else if msg="shrink" then 
      m.window.setHeight(m.window.getHeight() - 6)
      m.window.setY(m.window.getY()+3)
      m.window.setWidth(m.window.getWidth() - 6*m.aspectRatio)
      m.window.setX(m.window.getX()+3*m.aspectRatio)
      m.video.setRectangle(m.window)
    else if msg="nudgeUp" then 
      m.window.setY(m.window.getY() - 5)
      m.video.setRectangle(m.window)
    else if msg="nudgeDown" then 
      m.window.setY(m.window.getY() + 5)
      m.video.setRectangle(m.window)
    else if msg="nudgeLeft" then 
      m.window.setX(m.window.getX() - 5)
      m.video.setRectangle(m.window)
    else if msg="nudgeRight" then 
      m.window.setX(m.window.getX() + 5)
      m.video.setRectangle(m.window)
    else if msg="saveWindow" then 
      _window = createObject("roAssociativeArray")
      _window.x = m.window.getX()
      _window.y = m.window.getY()
      _window.w = m.window.getWidth()
      _window.h = m.window.getHeight()
      json = FormatJSON(_window)
      print "Writing new window configuration to disk: ", json
      WriteAsciiFile("window.json", json)
    else if msg="restoreWindow" then 
      DeleteFile("window.json")
      m.setupVideoWindow()
      _window = createObject("roAssociativeArray")
      _window.x = m.window.getX()
      _window.y = m.window.getY()
      _window.w = m.window.getWidth()
      _window.h = m.window.getHeight()
      json = FormatJSON(_window)
      print "Writing new window configuration to disk: ", json
      WriteAsciiFile("window.json", json)
    else if msg.getString().tokenize(" ")[0]="changeVideopath" then
      ' m.changeVideopath(msg.getString().tokenize(" ")[1])
    else if msg.getString().tokenize(" ")[0]="replaceContent" then 
      ' m.dlContentToFile(msg.getString().tokenize(" ")[1], m.config.videopath)
    else if msg.getString().tokenize(" ")[0]="downloadContent" then
      ' m.dlContentToFile(msg.getString().tokenize(" ")[1], msg.getString().tokenize(" ")[2])
    else if msg="debug" then
      STOP
    else if msg="exit" then
      END
    end if
  end if
end function

function changeVideopath(newpath)
  print "Received a new videopath"
  m.config.videopath = newpath
  json = FormatJSON(m.config)
  print "Saving new configuration..."
  print json
  WriteAsciiFile("config.json", json)
end function

function dlContentToFile(url, filepath)
  m.video.stop()
  m.downloadAlert = createObject("roTextField", 100,100,100,3,0)
  print #m.downloadAlert, "Attempting to download new content from ", url
  print "Command to get new content issued.  Stopping video and attempting to download new content from ", url
  m.downloadRequest.setUrl(url)
  resCode = m.downloadRequest.getToFile(filepath)
  m.downloadAlert.cls()
  if resCode = 200 then
    print "success!"
    print #m.downloadAlert, "Successfully downloaded new content."
  else
    print "request failed, response code: ", resCode
    print #m.downloadAlert, "Download attempt failed, response code: ", resCode
  end if
end function

function syncMachine()
  if m.clock.state = "idle" then
    if m.video.getPlaybackPosition() > m.duration - 25000 then
      m.clock.state = "starting"
    end if
  else if m.clock.state = "finished" then
    if m.video.getPlaybackPosition() < 5000 then
      m.clock.state = "idle"
    end if
  end if
  m.clock.step()
end function

function transportMachine()
  if m.transportState = "idle" then
  else if m.transportState = "starting" then
    if m.config.syncMode = "leader" then 
      m.udpSocket.sendTo("239.192.2."+m.config.syncGroup, 9500, "start")
      m.udpSocket.sendTo("192.168.0.202",9500,"start")
    end if
    m.video.seek(0)
    m.video.play()
    sleep(35)
    m.markLocalStart()
    m.submitTimestamp()
    print "Just started a loop.  Now waiting to finish."
    m.transportState = "waiting to finish"
  else if m.transportState = "waiting to finish" then
    if m.video.getPlaybackPosition() >= m.duration then 
      if m.config.syncMode = "leader" or m.config.syncMode = "solo" then
        m.transportState = "starting"
      else
        m.transportState = "idle"
      end if
    end if
  end if
end function

function cmsMachine()
  if m.cmsState = "idle"
  else if m.cmsState = "start downloading content" then
  else if m.cmsState = "downloading content" then
  else if m.cmsState = "start downloading scripts" then
  else if m.cmsState = "downloading scripts" then
  end if
end function

function runMachines()
  while True: 
    m.handleUDP()
    m.transport()
    m.sync()
    m.cms()
  end while
end function