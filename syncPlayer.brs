LIBRARY "time.brs"
LIBRARY "oscBuilder.brs"
LIBRARY "oscParser.brs"

function createSyncPlayer(_config as Object) as Object
  player = createObject("roAssociativeArray")
  player.config = _config

  if player.config.volume = invalid then
    player.config.volume = "15"
    WriteAsciiFile("config.json", FormatJSON(player.config))
  end if

  if player.config.startupleaderdelay = invalid then
    player.config.startupleaderdelay = "45000"
    WriteAsciiFile("config.json", FormatJSON(player.config))
  end if 

  if player.config.looppointleaderdelay = invalid then
    player.config.looppointleaderdelay = "100"
    WriteAsciiFile("config.json", FormatJSON(player.config))
  end if 
  
  
  player.nc = createObject("roNetworkConfiguration", 0)
  if player.nc.getHostName() <> player.config.organization+"-brightsign-"+player.config.playerID then
    player.nc.setHostName(player.config.organization+"-brightsign-"+player.config.playerID)
    player.nc.apply()
    print "Rebooting to update hostname."
    RebootSystem()
  end if

  player.firmwareCMSState = "idle"
  player.contentCMSState = "idle"
  
  if player.config.syncMode = "leader" or player.config.syncMode = "solo" then
    sleep(player.config.startupleaderdelay.toInt())
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
  player.firmwareCMS = firmwareCMSMachine
  player.contentCMS = contentCMSMachine
  player.transport = transportMachine
  player.submitTimestamp = submitTimestamp
  player.markLocalStart = markLocalStart
  player.setupUDP = setupUDP
  player.setupVideoWindow = setupVideoWindow
  player.handleUDP = handleUDP
  player.updateConfig = updateConfig
  player.updateScripts = updateScripts
  player.updateContent = updateContent
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
  player.video.setVolume(player.config.volume.toInt()) ' see config stuff in master from zachpoff

  ' Load the currently selected video and report its duration
  player.loadVideoFile()

  ' UDP Setup
  player.setupUDP()

  
  return player
end function

function loadVideoFile()
  print "Preloading video..."
  if MatchFiles("/", "*.mp4").count() = 0 then
    print("!!!! WARNING !!!!")
    print("!!!! No MP4 files found !!!!")
    m.transportState = "noValidVideo"
    m.clock.state = "idle"
    m.meta99 = CreateObject("roAssociativeArray")
    m.meta99.AddReplace("CharWidth", 30)
    m.meta99.AddReplace("CharHeight", 50)
    m.meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
    m.meta99.AddReplace("TextColor", &Hffff00) ' Yellow
    m.tf99 = CreateObject("roTextField", 10, 10, 60, 2, m.meta99)
    m.tf99.SendBlock("No valid video files found!")
    sleep(5000)
  else 
    if m.video.getFilePlayability(m.config.videopath).video <> "playable" then 
      mp4List = MatchFiles("/","*.mp4")
      playable = False
      for each file in mp4List
        if m.video.getFilePlayability(file).video = "playable" then
          m.updateConfig("videopath",file)
          playable = True
          EXIT FOR
        end if
      end for
      if not playable then
        print("!!!! WARNING !!!!")
        print("!!!! MP4s exist but are not playable videos !!!")
        m.transportState = "noValidVideo"
        m.clock.state = "idle"
        m.meta99 = CreateObject("roAssociativeArray")
        m.meta99.AddReplace("CharWidth", 30)
        m.meta99.AddReplace("CharHeight", 50)
        m.meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
        m.meta99.AddReplace("TextColor", &Hffff00) ' Yellow
        m.tf99 = CreateObject("roTextField", 10, 10, 60, 2, m.meta99)
        m.tf99.SendBlock("No valid video files found!")
        sleep(5000)
      end if
    end if
    print "Preload status:", m.video.preloadFile(m.config.videopath)
    m.video.seek(0)
    sleep(40)
    m.duration = m.video.getDuration()-20

    ' Update the server with the newly determined timestamp
    print "Updating duration on server..."
    m.apiRequest.setUrl(m.config.syncURL+"/api/work/"+m.config.workID+"/duration")
    updateDurationData = "password="+m.config.password+"&"
    durationWithDelay = m.duration
    if m.config.syncMode = "leader" or m.config.syncMode = "follower" then 
      durationWithDelay = durationWithDelay + m.config.looppointleaderdelay.toInt()
    end if
    updateDurationData = updateDurationData+"duration="+durationWithDelay.toStr()
    if m.config.updateWeb = "on" then 
      m.apiRequest.asyncPostFromString(updateDurationData)
    end if 

    ' Window setup
    print "Sleeping so that video dimensions can be parsed..."
    sleep(1000)
    m.setupVideoWindow()
  end if
end function

function setupUDP()
  print "Setting up udp port", m.config.commandPort.toInt()
  m.udpSocket = createObject("roDatagramSocket")
  m.udpSocket.bindToLocalPort(m.config.commandPort.toInt())
  m.udpPort = createObject("roMessagePort")
  m.udpSocket.setPort(m.udpPort)
  m.udpSocket.joinMulticastGroup("239.192.0.0")
  m.udpSocket.joinMulticastGroup("239.192.0."+m.config.syncGroup)
  m.udpSocket.joinMulticastGroup("239.192.4."+m.config.playerID)
  if m.config.syncMode = "leader" then
    m.udpSocket.joinMulticastGroup("239.192.1.0")
    m.udpSocket.joinMulticastGroup("239.192.1."+m.config.syncGroup)
  else if m.config.syncMode = "follower" then
    m.udpSocket.joinMulticastGroup("239.192.2.0")
    m.udpSocket.joinMulticastGroup("239.192.2."+m.config.syncGroup)
  end if
end function

function setupVideoWindow()
  probeData = m.video.probeFile(m.config.videopath)

  m.width = probeData.videoWidth
  m.height = probeData.videoHeight
  if m.width = 0 or m.height = 0 then
    m.width = 1920
    m.height = 1080
  end if
  m.aspectRatio = m.width / m.height
  _window = ParseJSON(ReadAsciiFile("window.json"))
  if not _window = invalid then
    print "Loading window mapping from disk..."
    print(_window)
    m.window = createObject("roRectangle", _window.x,_window.y,_window.w,_window.h)
    m.transform = _window.transform
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
    m.transform = "identity"
  end if
  m.video.setRectangle(m.window)
  ' m.video.setTransform(m.transform)
end function

function markLocalStart()
  m.lastCycleStartedAt = m.clock.getEpochAsMSString()
end function

function submitTimestamp() ' as String
  m.apiRequest.setUrl(m.config.syncURL+"/api/work/"+m.config.workID+"/timestamp")
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
    else if msg.getString().tokenize(" ")[0]="seek" then 
      m.video.pause()
      seekPositionMS = msg.getString().tokenize(" ")[1]
      m.video.seek(seekPositionMS.toInt())
    else if msg.getString().tokenize(" ")[0]="seekSec" then 
      m.video.pause()
      seekPositionS = msg.getString().tokenize(" ")[1]
      m.video.seek(int(seekPositionS.toFloat()*1000))
      print("just sought.")
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
    else if msg="rot180" then
      m.transform = "rot180"
      ' m.video.setTransform(m.transform)
    else if msg="saveWindow" then 
      _window = createObject("roAssociativeArray")
      _window.x = m.window.getX()
      _window.y = m.window.getY()
      _window.w = m.window.getWidth()
      _window.h = m.window.getHeight()
      _window.transform = m.transform
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
      _window.transform = "identity"
      json = FormatJSON(_window)
      print "Writing new window configuration to disk: ", json
      WriteAsciiFile("window.json", json)
    else if msg.getString().tokenize(" ")[0]="config" then 
      m.updateConfig(msg.getString().tokenize(" ")[1], msg.getString().tokenize(" ")[2])
      m.video.setVolume(m.config.volume.toInt())
    else if msg = "printConfig" then
      for each key in m.config
        print key, m.config[key]
      end for
    else if msg = "changeHumanController" then
      m.controllerIP = msg.getSourceHost()
    else if msg = "query" then
      print "received query request"
      print m.controllerIP
      if m.config.oscDebug = "on" AND not m.controllerIP = invalid then
        print ("attempting to transmit config data to: "+m.controllerIP)
        for each key in m.config
          oscMsg = oscBuildMessage("/brightsign/"+m.config.playerID+"/config/"+key, m.config[key].getString())
          m.udpSocket.sendTo(m.controllerIP, m.config.commandPort.toInt(), oscMsg)
        end for
        ip = m.nc.getCurrentConfig().ip4_address
        oscMsg = oscBuildMessage("/brightsign/"+m.config.playerID+"/config/ip",ip.getString())
        m.udpSocket.sendTo(m.controllerIP,m.config.commandPort.toInt(), oscMsg)
      end if
    else if msg = "flash" then
      m.updateScripts()
    else if msg = "updateContent" then
      m.updateContent()
    else if msg = "reload" then
      RestartScript()
    else if msg="debug" then
      STOP
    else if msg="exit" then
      END
    else
      bytes = msg.getByteArray()
      if chr(bytes.getEntry(0)) = "/" then ' check to see if first sign is slash, if so, assume osc
        payload = oscParseMessage(bytes)
        if payload.address = "/seekSec" then
          m.video.pause()
          seekPositionS = payload.data
          m.video.seek(int(seekPositionS.toFloat()*1000))
        else if payload.address = "/seekS" then
          m.video.pause()
          seekPositionS = payload.data
          m.video.seek(int(seekPositionS*1000))
        else 
          print "Unhandled OSC address:", payload.address
          print "Unhandled OSC data:", payload.data
        end if
      else 
        print "unhandled message:", msg
      end if

    end if

  end if
end function

function updateConfig(key, value)
  print "Received a new key:", key
  print "Received a new value:", value
  if type(value) = "roString" then
    value = value.getString()
  end if
  m.config.addReplace(key,value)
  json = FormatJSON(m.config)
  print "Saving new configuration..."
  for each key in m.config
    print key, m.config[key]
  end for
  WriteAsciiFile("config.json", json)
  if key = "videopath" then
    ' handler for specific key changes
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
    if m.transportState <> "noValidVideo" and m.video.getPlaybackPosition() > m.duration - 25000 then
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
  if m.transportState = "noValidVideo" then
    m.tf99.SendBlock("No valid video files found!")
    sleep(200)
  else if m.transportState = "idle" then
  else if m.transportState = "starting" then
    if m.config.syncMode = "leader" then 
      m.udpSocket.sendTo("239.192.2."+m.config.syncGroup, 9500, "start")
    end if
    if m.video.getPlaybackPosition() <> 0 
      print "Seeking to beginning which would cause delay"
      m.video.seek(0)
    end if
    m.video.play()
    sleep(35)
    m.markLocalStart()
    m.transportState = "submitting timestamp"
  else if m.transportState = "submitting timestamp" then
    if m.config.syncMode = "follower" then
      sleep((m.config.workID.toInt() MOD 10)*5)
    end if
    if m.config.updateWeb = "on" then
      m.submitTimestamp()
    end if
    print "Just started a loop.  Now waiting to finish."
    m.transportState = "waiting to finish"
  else if m.transportState = "waiting to finish" then
    if m.video.getPlaybackPosition() >= m.duration then 
      if m.config.syncMode = "solo" then
        m.video.seek(0)
        m.transportState = "starting"
      else if m.config.syncMode = "leader" then
        m.video.pause()
        m.video.seek(0)
        sleep(m.config.looppointleaderdelay.toInt())
        m.transportState = "starting"
      else if m.config.syncMode = "follower" then
        m.video.pause()
        m.video.seek(0)
        m.transportState = "idle"
      end if
    end if
  end if
end function

function firmwareCMSMachine()
  if m.firmwareCMSState = "idle"
  else if m.firmwareCMSState = "start downloading scripts" then
  else if m.firmwareCMSState = "downloading scripts" then
  end if
end function

function contentCMSMachine()
  if m.contentCMSState = "idle"
  else if m.contentCMSState = "start downloading content" then
  else if m.contentCMSState = "downloading content" then
  end if
end function

function runMachines()
  while True: 
    m.handleUDP()
    m.transport()
    m.sync()
    m.firmwareCMS()
    m.contentCMS()
  end while
end function

function updateScripts() 
  m.video.stop()
  print "Attempting to download new scripts from "+m.config.firmwareURL+"/..."
  
  meta99 = CreateObject("roAssociativeArray")
  meta99.AddReplace("CharWidth", 30)
  meta99.AddReplace("CharHeight", 50)
  meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
  meta99.AddReplace("TextColor", &Hffff00) ' Yellow
  tf99 = CreateObject("roTextField", 10, 10, 60, 2, meta99)
  tf99.SendBlock("Downloading new scripts.")
  sleep(2000)

  resPort = createObject("roMessagePort")
  request = createObject("roUrlTransfer")
  request.setPort(resPort)
  print "Getting autorun..."
  autorunslug = m.config.firmwareURL+"/autorun.brs"
  request.setUrl(autorunslug)
  request.asyncGetToFile("autorun.brs")
  resPort.waitMessage(2000)
  print "Getting sync player library..."
  syncPlayerslug = m.config.firmwareURL+"/syncPlayer.brs"
  request.setUrl(syncplayerslug)
  request.getToFile("syncPlayer.brs")
  resPort.waitMessage(2000)
  print "Getting time library..."
  timeslug = m.config.firmwareURL+"/time.brs"
  request.setUrl(timeslug)
  request.getToFile("time.brs")
  resPort.waitMessage(2000)
  print "Getting OSC library..."
  oscslug = m.config.firmwareURL+"/oscBuilder.brs"
  request.setUrl(oscslug)
  request.getToFile("oscBuilder.brs")
  resPort.waitMessage(2000)
  print "Attempt to update scripts has completed."
  RestartScript()
end function

function updateContent()
  m.video.stop()
  meta99 = CreateObject("roAssociativeArray")
  meta99.AddReplace("CharWidth", 30)
  meta99.AddReplace("CharHeight", 50)
  meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
  meta99.AddReplace("TextColor", &Hffff00) ' Yellow
  tf99 = CreateObject("roTextField", 10, 10, 60, 2, meta99)

  tf99.SendBlock("Downloading new content.")
  sleep(2000)
  request = createObject("roUrlTransfer")
  request.setUrl(m.config.videoURL)
  request.getToFile(m.config.videopath)
  RestartScript()
end function

function bootSetup()
  initStatus = ParseJSON(ReadAsciiFile("init.json"))
  syncSignReg = createObject("roRegistrySection", "syncSign")
  n = CreateObject("roNetworkConfiguration", 0)
  registry = CreateObject("roRegistry")
  shouldReboot = False
  
  ' Exit to Shell
  if initStatus.boottoshell = "true" then
    initstatus.boottoshell = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    END
  end if

  ' Factory reset
  if initStatus.justfactoryreset = "true" then
    initStatus.justfactoryreset  = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    syncSignReg.write("resetComplete","true")
    syncSignReg.flush()
  else 
    if syncSignReg.read("resetComplete") <> "true" or initstatus.shouldfactoryreset = "true" then
      if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
      meta99 = CreateObject("roAssociativeArray")
      meta99.AddReplace("CharWidth", 30)
      meta99.AddReplace("CharHeight", 50)
      meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
      meta99.AddReplace("TextColor", &Hffff00) ' Yellow
      tf99 = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, meta99)

      tf99.SendBlock("Deleting Recovery settings.")
      sleep(2000)
      tf99.Cls()

      mfgn=createobject("roMfgtest")
      mfgn.FactoryReset()
      registry.Flush()
      initStatus.justfactoryreset = "true"
      initStatus.shouldfactoryreset = "false"
      WriteAsciiFile("init.json", FormatJSON(initStatus))
      

      tf99.SendBlock("Factory reset complete.  Restarting and then will configure network")
      sleep(4000)
      RebootSystem()
    end if
  end if

  testReq = createObject("rourltransfer")
  testReq.setURL(ParseJSON(ReadAsciiFile("config.json")).syncURL+"/api/sync?reqSentAt=0")
  testReqPort = createObject("roMessagePort")
  testReq.setPort(testReqPort)
  testReq.asyncGetToString()
  msg = testReqPort.waitmessage(3000)
  if type(msg) <> "roUrlEvent" then 
    print("Internet check failed because request timed out.")
    if initstatus.justnetworkrebooted = "true"
      print("Already rebooted once, so continuing on without internet.")
    else
      initStatus.justnetworkrebooted = "true"
      WriteAsciiFile("init.json",FormatJSON(initStatus))
      print("Rebooting once to attempt to reconnect because no response received.")
      sleep(10000)
      RebootSystem()
    end if
  else 
    if msg.getResponseCode() <> 200 then
      print("Internet check failed.")
      if initstatus.justnetworkrebooted = "true"
        print("Already rebooted once, so continuing on without internet.")
      else
        initStatus.justnetworkrebooted = "true"
        WriteAsciiFile("init.json",FormatJSON(initStatus))
        print("Rebooting once to attempt to reconnect because network check returned false code")
        sleep(10000)
        RebootSystem()
      end if
    else 
      print("internet check is successful")
    end if
  end if
  initstatus.justnetworkrebooted = "false"
  WriteAsciiFile("init.json",FormatJSON(initStatus))

  ' if n.testinternetconnectivity().ok = false then
  '   print("Internet check failed.  Attempting to set to null ip and then back to dhcp.")
  '   n.setIP4Address("240.0.0.0") ' Null IP Address
  '   n.apply()
  '   registry.flush()
  '   sleep(5000)
  '   n.setDHCP()
  '   n.apply()
  '   registry.flush()
  '   sleep(5000)
  '   print n.testinternetconnectivity()
  ' end if

  if not n.getCurrentConfig().dhcp then
    n.setDHCP()
    n.apply()
    registry.flush()
    print("Should reboot because dhcp was not configured")
    shouldReboot = true
  end if

  ' DHC SSH and DWS
  if syncSignReg.read("remoteAccessConfigured") <> "true" then
    if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
    meta99 = CreateObject("roAssociativeArray")
    meta99.AddReplace("CharWidth", 30)
    meta99.AddReplace("CharHeight", 50)
    meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
    meta99.AddReplace("TextColor", &Hffff00) ' Yellow
    tf99 = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, meta99)

    tf99.SendBlock("Setting up registries.")
    sleep(2000)
    tf99.Cls()

    reg = CreateObject("roRegistrySection", "networking")
    reg.write("ssh","22")

    n.SetLoginPassword("syncSign")
    n.SetupDWS({open:"syncSign"})

    n.Apply()
    reg.flush()


    ' regSec = CreateObject("roRegistrySection", "networking")
    ' regSec.Write("ptp_domain", "0")
    ' regSec.Flush()

    tf99.SendBlock("Registries written and flushed.  Restarting and loading main file.")
    syncSignReg.write("remoteAccessConfigured", "true")
    syncSignReg.flush()
    sleep(4000)
    shouldReboot = true
  end if 

  if shouldReboot then
    RebootSystem()
  end if

end function