LIBRARY "time.brs"

function createSyncPlayer(_config as Object) as Object
  player = createObject("roAssociativeArray")
  player.config = _config



  ' Set up the sync API communications
  player.request = createObject("roUrlTransfer")
  player.request.setUrl(player.config.syncURL+"/api/work/"+player.config.id+"/timestamp")
  player.responsePort = createObject("roMessagePort")
  player.request.setPort(player.responsePort)

  ' Give the player methods
  player.submitTimestamp = submitTimestamp
  player.markLocalStart = markLocalStart
  player.oneshot = oneshot
  player.solo = solo
  player.lead = lead
  player.follow = follow
  player.loop = loop
  player.handleUDP = handleUDP

  ' Video timing fields
  player.lastCycleStartedAt = 0
  player.duration = 0

  ' Screen resolution settings
  player.mode = CreateObject("roVideoMode")
  player.mode.setMode("auto")

  ' Create a clock and sync it
  player.clock = createClock(player.config.syncURL,player.config.password)


  ' Video port for events
  player.videoPort = createObject("roMessagePort")

  ' Init the first copy of video
  player.video = createObject("roVideoPlayer")
  player.video.setPort(player.videoPort)
  player.video.setViewMode(0) 
  player.video.setVolume(15) ' see config stuff in master from zachpoff
  Print "Preloading video..."
  print "Preload status:", player.video.preloadFile(player.config.videopath)
  ok = player.video.addEvent(1, player.video.getDuration() - 20000) ' Throw an event for resynchronization 20s before film end
  player.duration = player.video.getDuration()-20

  ' Update the server with the newly determined timestamp
  print "Updating duration on server..."
  player.updateDurationRequest = createObject("roUrlTransfer")
  player.updateDurationRequest.setUrl(player.config.syncURL+"/api/work/"+player.config.id+"/duration")
  updateDurationData = "password="+player.config.password+"&"
  updateDurationData = updateDurationData+"duration="+player.duration.toStr()
  player.updateDurationRequest.asyncPostFromString(updateDurationData)

  ' UDP Setup
  print "Setting up udp port", player.config.commandPort.toInt()
  player.udpSocket = createObject("roDatagramSocket")
  player.udpSocket.bindToLocalPort(player.config.commandPort.toInt())
  player.udpPort = createObject("roMessagePort")
  player.udpSocket.setPort(player.udpPort)
  player.udpSocket.joinMulticastGroup("239.192.0.0")
  player.udpSocket.joinMulticastGroup("239.192.0."+player.config.syncGroup)
  if player.config.syncMode = "leader" then
    player.udpSocket.joinMulticastGroup("239.192.1.0")
    player.udpSocket.joinMulticastGroup("239.192.1."+player.config.syncGroup)
  else if player.config.syncMode = "follower" then
    player.udpSocket.joinMulticastGroup("239.192.2.0")
    player.udpSocket.joinMulticastGroup("239.192.2."+player.config.syncGroup)
  end if

  ' Window setup
  print "Sleeping so that video dimensions can be parsed..."
  sleep(1000)
  player.width = player.video.getStreamInfo().videoWidth
  player.height = player.video.getStreamInfo().videoHeight
  player.aspectRatio = player.width / player.height
  _window = ParseJSON(ReadAsciiFile("window.json"))
  if not _window = invalid then
    player.window = createObject("roRectangle", _window.x,_window.y,_window.w,_window.h)
  else 
    wFactor = 1920/player.width
    hFactor = 1080/player.height
    factor = hFactor
    hOffset = 0
    wOffset = ( 1920-factor*player.width )/2
    if wFactor < hFactor then 
      factor = wFactor
      wOffset = 0
      hOffset = ( 1080-factor*player.height )/2
    end if
    player.window = createObject("roRectangle",wOffset,hOffset, player.width * factor , player.height* factor )
  end if
  player.video.setRectangle(player.window)
  
  return player
end function

function markLocalStart()
  m.lastCycleStartedAt = m.clock.getEpochAsMSString()
end function

function submitTimestamp() as String
  postString = "password="+m.request.escape(m.config.password)+"&"
  postString = postString+"lastTimestamp="+m.request.escape(m.clock.synchronizeTimestamp(m.lastCycleStartedAt))
  m.request.asyncPostFromString(postString)
  response = m.responsePort.waitMessage(1000)
  if not response = invalid then
    response = response.getString()
    return response
  else 
    return "invalid"
  end if
end function

function loop()
  if m.config.syncMode = "leader"
    m.lead()
  else if m.config.syncMode = "follower"
    m.follow()
  else if m.config.syncMode = "solo"
    m.solo()
  end if
end function 

function oneshot()
  m.video.play()
  sleep(35) ' TODO: DEAL WITH THIS MAGIC NUMBER!! 1 frame delay?
  m.markLocalStart()
  m.submitTimestamp()
  print "New loop just started."

  ' wait until 20s before the end, then resynchronize to the server
  while (m.video.getPlaybackPosition() < m.video.getDuration()-25000):
    m.handleUDP() 
  end while
  print "NTP sync beginning..."
  m.clock.ntpSync()

  ' Wait until the end of the file, then seek to the beginning.
  ' This seems much more reliable than auto-looping.
  ' Potentially not seamless though?
  print "NTP sync completed."
  
  while (m.video.getPlaybackPosition() < m.duration-1000):
    m.handleUDP()
  end while
  
  while (m.video.getPlaybackPosition() < m.duration):
    sleep(1) 'wait 
  end while
  
  m.video.seek(0)
end function

function lead() 
  while True:
    m.udpSocket.sendTo("239.192.3."+m.config.syncGroup, 9500,"start")
    m.oneshot()
  end while
end function

function follow() 
  while True:
    m.handleUDP()
  end while
end function

function solo()
  print "Beginning seamless looping as solo player"
  while True:
    m.oneshot()
  end while
end function

function handleUDP()
  msg = m.udpPort.getMessage() 
  if not msg = invalid
    print "Received new UDP message: ", msg
    if msg="pause" then
        m.video.pause()
    else if msg="start" then
      m.oneshot()
    else if msg="play" then
      m.video.resume()
    else if msg="restart" then
      m.video.seek(0)
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
      print json
      WriteAsciiFile("window.json", json)
    else if msg="restoreWindow" then 
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
      m.video.setRectangle(m.window)
      _window = createObject("roAssociativeArray")
      _window.x = m.window.getX()
      _window.y = m.window.getY()
      _window.w = m.window.getWidth()
      _window.h = m.window.getHeight()
      json = FormatJSON(_window)
      print json
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
  m.downloadAlert = createObject("roTextField", 100,100,100,3)
  print #m.downloadAlert, "Attempting to download new content from ", url
  print "Command to get new content issued.  Stopping video and attempting to download new content from ", url
  request = createObject("roUrlTransfer")
  request.setUrl(url)
  resCode = request.getToFile(filepath)
  m.downloadAlert.cls()
  if resCode = 200 then
    print "success!"
    print #m.downloadAlert, "Successfully downloaded new content."
  else
    print "request failed, response code: ", resCode
    print #m.downloadAlert, "Download attempt failed, response code: ", resCode
  end if
end function