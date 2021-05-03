LIBRARY "time.brs"

function createSyncPlayer(_config as Object) as Object
  player = createObject("roAssociativeArray")
  player.config = _config

  player.cmsState = "idle"
  player.transportState = "idle"

  ' Set up the http request and response handlers
  player.request = createObject("roUrlTransfer")
  player.responsePort = createObject("roMessagePort")
  player.request.setPort(player.responsePort)

  ' Give the player methods
  player.run = run
  player.sync = sync
  player.cms = cms
  player.transport = transport
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
  m.updateDurationRequest = createObject("roUrlTransfer")
  m.updateDurationRequest.setUrl(m.config.syncURL+"/api/work/"+m.config.id+"/duration")
  updateDurationData = "password="+m.config.password+"&"
  updateDurationData = updateDurationData+"duration="+m.duration.toStr()
  m.updateDurationRequest.asyncPostFromString(updateDurationData)
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
    m.window = createObject("roRectangle", _window.x,_window.y,_window.w,_window.h)
  else 
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

function submitTimestamp() as String
  m.request.setUrl(m.config.syncURL+"/api/work/"+m.config.id+"/timestamp")
  postString = "password="+m.request.escape(m.config.password)+"&"
  postString = postString+"lastTimestamp="+m.request.escape(m.clock.synchronizeTimestamp(m.lastCycleStartedAt))
  m.request.asyncPostFromString(postString)
  ' response = m.responsePort.waitMessage(1000)
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
    print "Received new UDP message: ", msg
    if msg="pause" then
        m.video.pause()
    else if msg="start" then
      ' if not m.video.getPlaybackPosition() = 0 then
      '   m.video.stop()
      '   m.video.seek(0)
      ' end if
      m.video.seek(0)
      m.transportState = "starting"
    else if msg="play" then
      m.video.resume()
    else if msg = "stop" then 
      m.video.stop()
      m.video.seek(0)
      m.transportState = "idle"
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
      m.changeVideopath(msg.getString().tokenize(" ")[1])
    else if msg.getString().tokenize(" ")[0]="replaceContent" then 
      m.dlContentToFile(msg.getString().tokenize(" ")[1], m.config.videopath)
    else if msg.getString().tokenize(" ")[0]="downloadContent" then
      m.dlContentToFile(msg.getString().tokenize(" ")[1], msg.getString().tokenize(" ")[2])
    else if msg="debug" then
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
  m.request.setUrl(url)
  resCode = m.request.getToFile(filepath)
  m.downloadAlert.cls()
  if resCode = 200 then
    print "success!"
    print #m.downloadAlert, "Successfully downloaded new content."
  else
    print "request failed, response code: ", resCode
    print #m.downloadAlert, "Download attempt failed, response code: ", resCode
  end if
end function

function sync()
  if m.clock.state = "idle" then
    if m.video.getPlaybackPosition() > m.duration - 25000 then
      m.clock.state = "starting"
    end if
  else if m.clock.state = "finished" then
    if m.video.getPlaybackPosition() < 5000 then
      m.clock.state = "idle"
    end if
  end if
  m.clock.run()
end function

function transport()
  if m.transportState = "idle" then
  else if m.transportState = "starting" then
    if m.syncMode = "leader" then 
      m.udpSocket.sendTo("239.192.2."+m.config.syncGroup, 9500, "start")
    end if
    m.video.play()
    sleep(35)
    m.markLocalStart()
    m.submitTimestamp()
    m.transportState = "waiting to finish"
  else if m.transportState = "waiting to finish" then
    if m.video.getPlaybackPosition.getPlaybackPosition() >= m.duration then 
      m.video.seek(0)
      if m.config.syncMode = "leader" or m.config.syncMode = "solo" then
        m.transportState = "starting"
      else
        m.transportState = "idle"
      end if
    end if
  end if
end function

function cms()
  if m.cmsState = "idle"
  else if m.cmsState = "start downloading content" then
  else if m.cmsState = "downloading content" then
  else if m.cmsState = "start downloading scripts" then
  else if m.cmsState = "downloading scripts" then
  end if
end function

function run()
  while True: 
    m.handleUDP()
    m.transport()
    m.sync()
    m.cms()
  end while
end function