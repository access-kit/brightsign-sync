LIBRARY "time.brs"
LIBRARY "subtitler.brs"
LIBRARY "gpio.brs"
LIBRARY "timeline.brs"
LIBRARY "oscBuilder.brs"
LIBRARY "oscParser.brs"

function createSyncPlayer(_config as Object) as Object
  player = createObject("roAssociativeArray")
  player.quit = quit
  player.accessKitReg = createObject("roRegistrySection","accessKit")
  player.password = player.accessKitReg.read("password")
  player.provisioned = player.accessKitReg.read("provisioned")

  player.handleCommand = handleCommand
  player.handleRawOrCommand = handleRawOrCommand
  player.changeRegistration = changeRegistration

  if player.provisioned = "true" then
    player.id = player.accessKitReg.read("id").toInt()
  else 
    player.id = 1
  end if
  player.config = _config
  player.apiEndpoint = player.config.syncUrl+"/api/mediaplayer/"+player.id.toStr()
  player.nc = createObject("roNetworkConfiguration", 0)

  ' Set up the http request and response handlers
  player.apiRequest = createObject("roUrlTransfer")
  player.apiResponsePort = createObject("roMessagePort")
  player.apiRequest.setPort(player.apiResponsePort )
  player.postToLog = postToLog

  player.downloadRequest = createObject("roUrlTransfer")
  player.downloadResponsePort = createObject("roMessagePort")
  player.downloadRequest.setPort(player.downloadResponsePort)

  player.configRequest = createObject("roUrlTransfer")
  player.configRequest.setUrl(player.apiEndpoint+"/poll/config?"+"password="+player.password)
  player.configResponsePort = createObject("roMessagePort")
  player.configRequest.setPort(player.configResponsePort)
  player.configMetronome = createObject("roTimer")
  player.configMetronome.setElapsed(10,0)
  player.configMetronomeTriggerPort = createObject("roMessagePort")
  player.configMetronome.setPort(player.configMetronomeTriggerPort)
  player.configPollingState = "waitingToPoll"
  player.configMetronome.start()
  player.configPoller = configPoller

  player.injectionRequest = createObject("roUrlTransfer")
  player.injectionRequest.setUrl(player.apiEndpoint+"/poll/inject?"+"password="+player.password)
  player.injectionResponsePort = createObject("roMessagePort")
  player.injectionRequest.setPort(player.injectionResponsePort)
  player.injectionMetronome = createObject("roTimer")
  player.injectionMetronome.setElapsed(10,0)
  player.injectionMetronomeTriggerPort = createObject("roMessagePort")
  player.injectionMetronome.setPort(player.injectionMetronomeTriggerPort)
  player.injectionPollingState = "waitingToPoll"
  player.injectionMetronome.start()
  player.injectionPoller = injectionPoller

  ' Ensure that necessary config values are present
  if player.config.syncMode = invalid then
    player.config.addReplace("syncMode","solo")
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/syncMode")
    player.apiRequest.asyncPostFromString("password="+player.password+"&syncMode="+player.config.syncMode)
  end if

  if player.config.syncGroup= invalid then
    player.config.addReplace("syncGroup",1)
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/syncGroup")
    player.apiRequest.asyncPostFromString("password="+player.password+"&syncGroup="+player.config.syncGroup.toStr())
  end if

  if player.config.workId = invalid then
    player.config.addReplace("workId",-1)
    ' WriteAsciiFile("config.json", FormatJSON(player.config))
    ' player.apiRequest.setUrl(player.apiEndpoint+"/workId")
    ' player.apiRequest.asyncPostFromString("password="+player.password+"&workId="+player.config.workId.toStr())
  end if

  if player.config.videoPath = invalid then
    player.config.addReplace("videoPath","auto")
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/videoPath")
    player.apiRequest.asyncPostFromString("password="+player.password+"&videoPath="+player.config.videoPath)
  end if

  if player.config.updateWeb = invalid then
    player.config.addReplace("updateWeb","on")
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/updateWeb")
    player.apiRequest.asyncPostFromString("password="+player.password+"&updateWeb="+player.config.updateWeb)
  end if

  if player.config.nickname = invalid then
    player.config.addReplace("nickname","mediaplayer")
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/nickname")
    player.apiRequest.asyncPostFromString("password="+player.password+"&nickname="+player.config.nickname)
  end if

  if player.config.volume = invalid then
    player.config.volume = 15
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/volume")
    player.apiRequest.asyncPostFromString("password="+player.password+"&volume="+player.config.volume.toStr())
  end if

  if player.config.quietMode = invalid then
    player.config.quietMode = 1
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/quietMode")
    player.apiRequest.asyncPostFromString("password="+player.password+"&quietMode="+player.config.quietMode.toStr())
  end if

  if player.config.startupLeaderDelay = invalid then
    player.config.addReplace("startupLeaderDelay", 30000)
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/startupLeaderDelay")
    player.apiRequest.asyncPostFromString("password="+player.password+"&startupLeaderDelay="+player.config.startupLeaderDelay.toStr())
  end if 

  if player.config.loopPointLeaderDelay = invalid then
    player.config.addReplace("loopPointLeaderDelay",100)
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/loopPointLeaderDelay")
    player.apiRequest.asyncPostFromString("password="+player.password+"&loopPointLeaderDelay="+player.config.loopPointLeaderDelay.toStr())
  end if 

  if player.config.commandPort = invalid then
    player.config.commandPort = 9500
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/commandPort")
    player.apiRequest.asyncPostFromString("password="+player.password+"&commandPort="+player.config.commandPort.toStr())
  end if 

  if player.config.pollForCodeInjection = invalid then
    player.config.pollForCodeInjection = false
    WriteAsciiFile("config.json", FormatJSON(player.config))
  end if 

  if player.config.pollForConfigChanges = invalid then
    player.config.pollForConfigChanges = false
    WriteAsciiFile("config.json", FormatJSON(player.config))
  end if 
  
  if player.config.onScreenSubtitleActive = invalid then
    player.config.onScreenSubtitleActive = "false"
    WriteAsciiFile("config.json", FormatJSON(player.config))
    player.apiRequest.setUrl(player.apiEndpoint+"/onScreenSubtitleActive")
    player.apiRequest.asyncPostFromString("password="+player.password+"&onScreenSubtitleActive="+player.config.onScreenSubtitleActive)
  end if
  

  player.firmwareCMSState = "idle"
  player.contentCMSState = "idle"
  
  if player.config.syncMode = "leader" then
    print("Leader is sleeping to let others boot up...")
    sleep(player.config.startupLeaderDelay)
    player.transportState = "starting"
  else if player.config.syncMode = "solo"
    player.transportState = "starting"
  else 
    player.transportState = "idle"
  end if



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
  player.changevideoPath = changevideoPath
  player.loadVideoFile = loadVideoFile
  player.resumeSync = resumeSync
  player.resync = resync
  player.relockAndSync = relockAndSync

  ' Video timing fields
  player.lastCycleStartedAt = 0
  player.duration = 0

  ' Screen resolution settings
  player.videoMode = CreateObject("roVideoMode")
  if ParseJSON(readasciifile("video.json")) <> invalid then 
    videoSettings = ParseJSON(ReadAsciiFile("video.json"))
    if player.videoMode.getMode() <> videoSettings.mode then
      player.videoMode.setMode(videoSettings.mode)
      RebootSystem()
    else 
      player.videoMode.setMode(videoSettings.mode)
    end if
  else 
    player.videoMode.setMode("auto")
  end if

  ' Create a clock and sync it
  player.clock = createClock(player.config.syncUrl,player.password)



  ' Video port for events
  player.videoPort = createObject("roMessagePort")

  ' Init the video playback object
  player.video = createObject("roVideoPlayer")
  player.video.setPort(player.videoPort)
  player.video.setViewMode(0) 
  player.video.setVolume(cint(player.config.volume*player.config.quietMode)) ' see config stuff in master from zachpoff
  if ParseJSON(readasciifile("audio.json")) <> invalid then 
    audioSettings = ParseJSON(ReadAsciiFile("audio.json"))
    player.audio = CreateObject("roAudioOutput", audioSettings.output)
     
    if audioSettings.mode = "compressed" then ' use mode: compressed and output: spdif for optical ac3 
      player.video.setCompressedAudioOutputs(player.audio)
    else
      player.video.SetPcmAudioOutputs(player.audio)
    end if
  else 
  end if


  ' Load the currently selected video and report its duration
  player.loadVideoFile()

  ' Create a subtitler engine
  player.subtitler = createSubtitler(player)
  if player.config.onScreenSubtitleActive = "true" then
    player.subtitler.activate()
  end if
  
  ' Create GPIO Handler
  player.gpioHandler = createGPIOManager(player)
  player.gpioEnabled = true

  ' Create Timeline Manager
  player.timelineManager = createTimelineManager(player)
  player.timelineManager.enabled = true

  ' UDP Setup
  player.setupUDP()
  
  return player
end function

function consume()
end function

function loadVideoFile()
  print "Preloading video..."
  if MatchFiles("/", "*.mp4").count() = 0 and MatchFiles("/","*.mov").count() = 0 then
    print("!!!! WARNING !!!!")
    print("!!!! No MP4 or MOV files found !!!!")
    m.transportState = "noValidVideo"
    m.clock.state = "idle"
    m.meta99 = CreateObject("roAssociativeArray")
    m.meta99.AddReplace("CharWidth", 30)
    m.meta99.AddReplace("CharHeight", 50)
    m.meta99.AddReplace("BackgroundColor", &H000000) ' Dark grey
    m.meta99.AddReplace("TextColor", &Hffffff) ' Yellow
    m.tf99 = CreateObject("roTextField", 10, 10, 60, 2, m.meta99)
    m.tf99.SendBlock("No valid video files found!")
    sleep(5000)
  else 
    if m.video.getFilePlayability(m.config.videoPath).video <> "playable" then 
      movList = MatchFiles("/","*.mov")
      playable = False
      for each file in movList 
        if m.video.getFilePlayability(file).video = "playable" then
          m.updateConfig("videoPath",file)
          playable = True
          EXIT FOR
        end if
      end for
      if not playable then
        mp4List = MatchFiles("/","*.mp4")
        playable = False
        for each file in mp4List
          if m.video.getFilePlayability(file).video = "playable" then
            m.updateConfig("videoPath",file)
            playable = True
            EXIT FOR
          end if
        end for
      end if
      if not playable then
        print("!!!! WARNING !!!!")
        print("!!!! MP4s or MOVs exist but are not playable videos !!!")
        m.transportState = "noValidVideo"
        m.clock.state = "idle"
        m.meta99 = CreateObject("roAssociativeArray")
        m.meta99.AddReplace("CharWidth", 30)
        m.meta99.AddReplace("CharHeight", 50)
        m.meta99.AddReplace("BackgroundColor", &H000000) ' Dark grey
        m.meta99.AddReplace("TextColor", &Hffffff) ' Yellow
        m.tf99 = CreateObject("roTextField", 10, 10, 60, 2, m.meta99)
        m.tf99.SendBlock("No valid video files found! Provided MP4 or MOV was not valid.")
        sleep(5000)
      end if
    end if
    print "Preload status:", m.video.preloadFile(m.config.videoPath)
    m.video.seek(0)
    sleep(40)
    m.duration = m.video.getDuration()-20

    ' Update the server with the newly determined timestamp
    print "Updating duration on server..."
    m.apiRequest.setUrl(m.apiEndpoint.+"/duration")
    updateDurationData = "password="+m.password+"&"
    durationWithDelay = m.duration
    if m.config.syncMode = "leader" or m.config.syncMode = "follower" then 
      durationWithDelay = durationWithDelay + m.config.loopPointLeaderDelay
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
  print "Setting up udp port", m.config.commandPort
  m.udpSocket = createObject("roDatagramSocket")
  m.udpSocket.bindToLocalPort(m.config.commandPort)
  m.udpPort = createObject("roMessagePort")
  m.udpSocket.setPort(m.udpPort)
  m.udpSocket.joinMulticastGroup("239.192.0.0")
  m.udpSocket.joinMulticastGroup("239.192.0."+m.config.syncGroup.toStr())
  m.udpSocket.joinMulticastGroup("239.192.4."+m.id.toStr())
  if m.config.syncMode = "leader" then
    m.udpSocket.joinMulticastGroup("239.192.1.0")
    m.udpSocket.joinMulticastGroup("239.192.1."+m.config.syncGroup.toStr())
  else if m.config.syncMode = "follower" then
    m.udpSocket.joinMulticastGroup("239.192.2.0")
    m.udpSocket.joinMulticastGroup("239.192.2."+m.config.syncGroup.toStr())
  end if
end function

function setupVideoWindow()

  probeData = m.video.getStreamInfo()

  if probeData <> invalid then
    m.width = probeData.videoWidth
    m.height = probeData.videoHeight
  else
    print "Probe data invalid, using default dimensions"
    m.width = 1920
    m.height = 1080
  end if
  if m.width = 0 or m.height = 0 then
    m.width = 1920
    m.height = 1080
  end if
  if m.width = invalid or m.height = invalid then
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

function resync()
  currentPlaybackPosition = m.video.getPlaybackPosition()
  m.markLocalStart()
  m.clock.serverTimeOffset = m.clock.serverTimeOffset - currentPlaybackPosition
  if m.config.updateWeb = "on" then
    m.submitTimestamp()
  end if
  m.clock.serverTimeOffset = m.clock.serverTimeOffset + currentPlaybackPosition
end function

function relockAndSync()
  m.clock.blockingNTPSync()
  m.resync()
end function

function resumeSync()
  m.clock.blockingNTPSync()
  m.video.resume()
  sleep(35) 
  m.resync()
end function

function submitTimestamp() ' as String
  m.apiRequest.setUrl(m.apiEndpoint+"/timestamp")
  postString = "password="+m.apiRequest.escape(m.password)+"&"
  postString = postString +"lastTimestamp="+m.apiRequest.escape(m.clock.synchronizeTimestamp(m.lastCycleStartedAt))
  m.apiRequest.asyncPostFromString(postString )
  ' response = m.apiResponsePort .waitMessage(1000)
  ' if not response = invalid then
  '   response = response.getString()
  '   return response
  ' else 
  '   return "invalid"
  ' end if
end function

function handleCommand(msg)
  if msg="pause" then
    m.video.pause()
    return {status: 0, message: "paused"}
  else if msg="resync" then
    m.resync()
    return {status: 0, message: "resynced timestamp"}
  else if msg="lockResync" then
    m.relockAndSync()
    return {status: 0, message: "locked and resynced timestamp"}
  else if msg="playResync" then
    m.resumeSync()
    return {status: 0, message: "locked, resynced and resumed"}
  else if msg="start" then
    m.transportState = "starting"
    return {status: 0, message: "starting"}
  else if msg="play" then
    m.video.resume()
    return {status: 0, message: "resumed"}
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
    return {status: 0, message: "resumed"}
  else if msg = "printLoc" then 
    print "Playback Position: (ms)", m.video.getPlaybackPosition()
    return {status: 0, message: "Playback position (ms)"+m.video.getPlaybackPosition().toStr()}
  else if msg.getString().tokenize(" ")[0]="seek" then 
    m.video.pause()
    seekPositionMS = msg.getString().tokenize(" ")[1]
    m.video.seek(seekPositionMS.toInt())
    return {status: 0, message: "Jumped as close to "+seekPositionMS+"ms as possible."}
  else if msg.getString().tokenize(" ")[0]="seekSec" then 
    m.video.pause()
    seekPositionS = msg.getString().tokenize(" ")[1]
    m.video.seek(int(seekPositionS.toFloat()*1000))
    print("just sought.")
    return {status: 0, message: "Jumped as close to "+seekPositionS+"s as possible."}
  else if msg="ff" then
    m.video.setPlaybackSpeed(2)
    return {status: 0, message: "fast-forwarding"}
  else if msg="fff" then
    m.video.setPlaybackSpeed(8)
    return {status: 0, message: "fast-forwarding"}
  else if msg="rr" then
    m.video.setPlaybackSpeed(-2)
    return {status: 0, message: "rewinding"}
  else if msg="rrr" then
    m.video.setPlaybackSpeed(-8)
    return {status: 0, message: "rewinding"}
  else if msg="defaultspeed" then
    m.video.setPlaybackSpeed(1)
    return {status: 0, message: "setting normal playback speed"}
  else if msg="stretchX" then 
    m.window.setWidth(m.window.getWidth() + 6)
    m.window.setX(m.window.getX()-3)
    m.video.setRectangle(m.window)
    return {status: 0, message: "stretched video to "+m.window.getWidth().toStr()+"px wide"}
  else if msg="compressX" then 
    m.window.setWidth(m.window.getWidth() - 6)
    m.window.setX(m.window.getX()+3)
    m.video.setRectangle(m.window)
    return {status: 0, message: "compressed video to "+m.window.getWidth().toStr()+"px wide"}
  else if msg="stretchY" then 
    m.window.setHeight(m.window.getHeight() + 6)
    m.window.setY(m.window.getY()-3)
    m.video.setRectangle(m.window)
    return {status: 0, message: "stretched video to "+m.window.getHeight().toStr()+"px tall"}
  else if msg="compressY" then 
    m.window.setHeight(m.window.getHeight() - 6)
    m.window.setY(m.window.getY()+3)
    m.video.setRectangle(m.window)
    return {status: 0, message: "compressed video to "+m.window.getHeight().toStr()+"px tall"}
  else if msg="enlarge" then 
    _window = ParseJson(ReadAsciiFile("window.json"))
    base_y = 0
    base_h = 0
    base_x = 0
    base_w = 0
    if _window = invalid then
      base_y = m.window.getY()
      base_h = m.window.getHeight()
      base_x = m.window.getX()
      base_w = m.window.getWidth()
    else 
      base_y = _window.y
      base_h = _window.h
      base_x = _window.x
      base_w = _window.w
    end if
    m.window.setHeight(m.window.getHeight() + 6)
    m.window.setY(base_y + (base_h - m.window.getHeight())/2)
    m.window.setWidth(m.window.getHeight()*m.aspectRatio)
    m.window.setx(base_x + (base_w - m.window.getWidth())/2)
    m.video.setRectangle(m.window)
    return {status: 0, message: "stretched video to "+m.window.getWidth().toStr()+"x"+m.window.getHeight().toStr()}
  else if msg="shrink" then 
    _window = ParseJson(ReadAsciiFile("window.json"))
    base_y = 0
    base_h = 0
    base_x = 0
    base_w = 0
    if _window = invalid then
      base_y = m.window.getY()
      base_h = m.window.getHeight()
      base_x = m.window.getX()
      base_w = m.window.getWidth()
    else 
      base_y = _window.y
      base_h = _window.h
      base_x = _window.x
      base_w = _window.w
    end if
    m.window.setHeight(m.window.getHeight() - 6)
    m.window.setY(base_y + (base_h - m.window.getHeight())/2)
    m.window.setWidth(m.window.getHeight()*m.aspectRatio)
    m.window.setx(base_x + (base_w - m.window.getWidth())/2)
    m.video.setRectangle(m.window)
    return {status: 0, message: "shrunk video to "+m.window.getWidth().toStr()+"x"+m.window.getHeight().toStr()}
  else if msg="nudgeUp" then 
    m.window.setY(m.window.getY() - 5)
    m.video.setRectangle(m.window)
    return {status: 0, message: "moved video up"}
  else if msg="nudgeDown" then 
    m.window.setY(m.window.getY() + 5)
    m.video.setRectangle(m.window)
    return {status: 0, message: "moved video down"}
  else if msg="nudgeLeft" then 
    m.window.setX(m.window.getX() - 5)
    m.video.setRectangle(m.window)
    return {status: 0, message: "moved video left"}
  else if msg="nudgeRight" then 
    m.window.setX(m.window.getX() + 5)
    m.video.setRectangle(m.window)
    return {status: 0, message: "moved video right"}
  else if msg="rot180" then
    m.transform = "rot180"
    return {status: 0, message: "set rotation transformation (CURRENTLY NOT SUPPORTED)"}
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
    return {status: 0, message: "Saved picture configuration to disk: "+json}
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
    return {status: 0, message: "Reset picture configuration and saved new window to disk: "+json}
  else if msg = "disableOutputs"
    m.video.hide()
    m.video.setVolume(0)
    return {status: 0, message: "Disabled image display and audio."}
  else if msg = "enableOutputs"
    m.video.show()
    m.video.setVolume(cint(m.config.volume*m.config.quietMode))
    return {status: 0, message: "Enabled image display and audio."}
  else if msg = "enterPowerSave"
    m.video.setVolume(0)
    m.videoMode.setPowerSaveMode(true)
    return {status: 0, message: "Disabled video output and audio; projectors will enter sleep mode if available."}
  else if msg = "exitPowerSave"
    m.video.setVolume(cint(m.config.volume*m.config.quietMode))
    m.videoMode.setPowerSaveMode(false)
    return {status: 0, message: "Waking projectors and re-enabling video output and audio."}
  else if msg = "volumeUp" then
    currentVolume = m.config.volume
    if currentVolume < 100 then
      newVolume = currentVolume + 1
      m.updateConfig("volume",newVolume)
      return {status: 0, message: "volume increased to "+m.config.volume.toStr()}
    else 
      return {status: 0, message: "volume already at maximum of 100"}
    end if
  else if msg = "volumeDown"
    currentVolume = m.config.volume
    if currentVolume > 0 then
      newVolume = currentVolume - 1
      m.updateConfig("volume",newVolume)
      return {status: 0, message: "volume decreased to "+m.config.volume.toStr()}
    else 
      return {status: 0, message: "volume already at minimum of 0"}
    end if
  else if msg.getString().tokenize(" ")[0]="config" then 
    m.updateConfig(msg.getString().tokenize(" ")[1], msg.getString().tokenize(" ")[2])
    return {status: 0, message: "Updated configuration key/value pair: ("+msg.getString().tokenize(" ")[1]+","+msg.getString().tokenize(" ")[1]+")"}
  else if msg = "refetch subtitles"
    m.subtitler.fetchSubtitles()
    return {status: 0, message: "Fetched new subtitles."}
  else if msg = "activate subtitles"
    m.subtitler.activate()
    return {status: 0, message: "Activated subtitles"}
  else if msg = "deactivate subtitles"
    m.subtitler.deactivate()
    return {status: 0, message: "Deactivated subtitles"}
  else if msg = "update timeline"
    m.timelineManager.fetchEvents()
    return {status: 0, message: "Updated Events!"}
  else if msg = "flash" or msg = "update scripts" or msg = "updateScripts" then
    m.updateScripts()
    ' Exits script
  else if msg = "updateContent" or msg = "update content" then
    m.updateContent()
    ' Exits script
  else if msg = "reload" then
    RestartScript()
    ' Exits script
  else if msg="debug" then
    STOP
    ' Exits script
  else if msg="exit" then
    END
    ' Exits script
  else if msg="reboot" or msg="restart" then
    RebootSystem()
    ' Exits script
  else 
    return {status:-1, message: "command not handled by default handler"}
  end if
end function

function handleUDP()
  msg = m.udpPort.getMessage() 
  if not msg = invalid
    responseData = m.handleCommand(msg)
    if responseData.status = 0 then 
      return 0
    end if
    if msg = "printConfig" then
      for each key in m.config
        print key, m.config[key]
      end for
      print "Player ID", m.id
    else if msg = "changeHumanController" then
      m.controllerIP = msg.getSourceHost()
    else if msg = "query" then
      print "received query request"
      print m.controllerIP
      if not m.controllerIP = invalid then
        print ("attempting to transmit config data to: "+m.controllerIP)
        for each key in m.config
          if key <> "work" then 
            val = m.config[key]
            if type(val) = "roString" or type(val) = "String" then
              val = val.getString()
            else if type(val) = "Integer" then
              val = val.toStr()
            else if type(val) = "Boolean" then
              if val = true then
                val = "true"
              else
                val = "false"
              end if
            end if
            if type(val) <> "Invalid" then 
              oscMsg = oscBuildMessage("/brightsign/"+m.id.toStr()+"/config/"+key, val)
              m.udpSocket.sendTo(m.controllerIP, m.config.commandPort, oscMsg)
            end if
          end if
        end for
        ip = m.nc.getCurrentConfig().ip4_address
        oscMsg = oscBuildMessage("/brightsign/"+m.id.toStr()+"/config/ip",ip.getString())
        m.udpSocket.sendTo(m.controllerIP,m.config.commandPort, oscMsg)
      end if
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
  ' TODO: Add better typesafety for other fields
  if key = "volume"
    value = cint(val(value))
  end if
  if key = "quietMode"
    value = val(value)
  end if
  m.config.addReplace(key,value)
  json = FormatJSON(m.config)
  print "Saving new configuration..."
  for each _key in m.config
    if _key <> "work" then 
      print _key, m.config[_key]
    end if
  end for
  if type(value) = "roString" then
    value = value.getString()
  else if type(value) = "Integer" or type(value) = "Float" or type(value) = "Double" then
    value = str(value)
  end if
  WriteAsciiFile("config.json", json)
  m.apiRequest.setUrl(m.apiEndpoint+"/"+key)
  m.apiRequest.asyncPostFromString("password="+m.password+"&"+key+"="+value)
  if key = "videoPath" then
    ' handler for specific key changes
  else if key = "volume" then
    m.video.setVolume(cint(m.config.quietMode * m.config.volume ))
  else if key = "quietMode" then
    m.video.setVolume(cint(m.config.quietMode * m.config.volume ))
  end if
end function

function changevideoPath(newpath)
  print "Received a new videoPath"
  m.config.videoPath = newpath
  json = FormatJSON(m.config)
  print "Saving new configuration..."
  print json
  WriteAsciiFile("config.json", json)
  m.apiRequest.setUrl(m.apiEndpoint+"/videoPath")
  m.apiRequest.asyncPostFromString("password="+m.password+"&videoPath="+newpath)
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
    if m.idWrittenToScreeen = true then
      sleep(200)
    else
      m.idWrittenToScreeen = true
      m.tf99.cls()
      if m.provisioned <> "true" then
        idToDisplay = "<No ID, not yet registered with AK>"
      else 
        idToDisplay = m.id.toStr()
      end if
      m.tf99.SendBlock("Access Kit ID / IP Address: "+idToDisplay+" / "+m.nc.getCurrentConfig().ip4_address)
    end if
  else if m.transportState = "idle" then
  else if m.transportState = "starting" then
    if m.config.syncMode = "leader" then 
      m.udpSocket.sendTo("239.192.2."+m.config.syncGroup.toStr(), 9500, "start")
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
      sleep(((m.config.syncGroup+1) MOD 10)*5)
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
        sleep(m.config.loopPointLeaderDelay)
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
    m.subtitler.update()
    m.gpioHandler.handle()
    m.timelineManager.update()
    m.firmwareCMS()
    m.contentCMS()
    m.configPoller()
    m.injectionPoller()
  end while
end function

function updateScripts() 
  m.video.stop()
  print "Attempting to download new scripts from "+m.config.firmwareUrl+"/..."
  
  meta99 = CreateObject("roAssociativeArray")
  meta99.AddReplace("CharWidth", 30)
  meta99.AddReplace("CharHeight", 50)
  meta99.AddReplace("BackgroundColor", &H000000) ' Dark grey
  meta99.AddReplace("TextColor", &Hffffff) ' Yellow
  tf99 = CreateObject("roTextField", 10, 10, 60, 2, meta99)
  tf99.SendBlock("Downloading new scripts.")
  sleep(2000)

  resPort = createObject("roMessagePort")
  request = createObject("roUrlTransfer")
  request.setPort(resPort)
  request.setUrl("https://api.github.com/repos/szvsw/brightSignMediaSync/git/trees/master?recursive=1")
  request.asyncGetToString()
  msg = resPort.waitMessage(2000)
  data = ParseJSON(msg.getString()).tree
  for each entry in data
    path = entry.path
    if path.inStr("/") = -1 then
      if path.right(3) = "brs" or path="init.json" or path.left(9) = "subtitles" then
        print("Downloading "+path+"...")
        request.setUrl(m.config.firmwareUrl + "/"+path)
        request.asyncGetToFile(path)
        resPort.waitMessage(3000)

      end if
    end if
  end for
  tf99.cls()
  tf99.sendBlock("Done downloading scripts... will now reboot.")
  sleep(3000)
  RebootSystem()
end function


function updateContent()
  m.video.stop()
  meta99 = CreateObject("roAssociativeArray")
  meta99.AddReplace("CharWidth", 30)
  meta99.AddReplace("CharHeight", 50)
  meta99.AddReplace("BackgroundColor", &H000000) ' Dark grey
  meta99.AddReplace("TextColor", &Hffffff) ' Yellow
  tf99 = CreateObject("roTextField", 10, 10, 60, 2, meta99)

  tf99.SendBlock("Downloading new content.")
  sleep(2000)
  request = createObject("roUrlTransfer")
  request.setUrl(m.config.videoUrl)
  if m.config.videoPath = "auto" then
    m.changevideoPath("auto.mp4")
  end if
  resCode = request.getToFile(m.config.videoPath)
  if resCode = 200 then
    tf99.cls()
    tf99.sendBlock("Finished Downloading Content... will now reboot.")
    sleep(3000)
    m.apiRequest.setUrl(m.apiEndpoint+"/downloadNewContent")
    postString = "password="+m.password+"&downloadNewContent=false"
    m.apiRequest.asyncPostFromString(postString)
    sleep(2000)

    RebootSystem()
  else 
    tf99.cls()
    tf99.sendBlock("Error downlaoding content... response code: "+resCode.toStr())
    sleep(15000)
  end if
end function

function configPoller()
  ' subtitle state polling engine
  ' TODO: line below bugs out when not provisioned
  if m.provisioned = "true" then
    if m.config.pollForConfigChanges and m.provisioned = "true" then
      if (m.video.getPlaybackPosition() > 1000 and m.video.getPlaybackPosition() < m.duration - 3000) or m.transportState = "noValidVideo" then
        if m.configPollingState = "waitingToPoll"
          m.configRequest.asyncGetToString()
          m.configPollingState = "waitingForResponse"
        else if m.configPollingState = "waitingForResponse"
          msg = m.configResponsePort.getMessage()
          if msg <> invalid
            if msg.getResponseCode() = 200 then
              data = ParseJSON(msg.getString())
              data.reset()
              while data.isNext()
                key = data.next()
                val = data.lookup(key)
                m.config.addReplace(key,val)
              end while
              m.video.setVolume(cint(m.config.quietMode * m.config.volume ))
              WriteAsciiFile("config.json",FormatJSON(data))
              if m.config.downloadNewContent then
                m.updateContent() ' get new media
              end if
            else 
            end if
            m.configPollingState="waitingToPoll"
          else
          end if
        end if

      else 
        ' block api requests during critical sync windows
      end if
    end if
  end if
end function

function changeRegistration(newSyncUrl,newPassword)
  m.accessKitReg.delete("provisioned")
  m.accessKitReg.delete("id")
  m.accessKitReg.delete("syncUrl")
  m.accessKitReg.delete("password")
  m.accessKitReg.flush()
  newConfig = createObject("roAssociativeArray")
  newConfig.addReplace("syncUrl",newSyncUrl)
  newConfig.addReplace("password",newPassword)
  WriteAsciiFile("config.json",FormatJSON(newConfig))
  sleep(1000)
  RebootSystem()

end function

function postToLog(message)
  postUrl = m.apiEndpoint+"/log"
  m.apiRequest.setUrl(postUrl)
  m.apiRequest.asyncPostFromString("password="+m.password+"&message="+m.apiRequest.escape(message))
  
end function

function handleRawOrCommand(line) 
  ' TODO: figure out why all hese sleeps are necessary
  print "Code type:", line.type
  print "Code to inject", line.code
  if line.type = "command" then
    responseData = m.handleCommand(line.code)
    sleep(500)
    m.postToLog(responseData.message)
    sleep(500)
  else if line.type = "raw" then
    results = eval(line.code)
    sleep(500)
    if type(results) = "roList" then
      for each result in results
        m.postToLog("Executed code with status: "+result.ERRNO.toStr()+" ("+result.ERRSTR+")")
        sleep(500)
        print("Executed code with status: "+result.ERRNO.toStr()+" ("+result.ERRSTR+")")
      end for

    else
      m.postToLog("Executed code with status: "+results.toStr())
      print("Executed code with status code: " + results.toStr())
    end if
  end if
  sleep(500)
end function

function injectionPoller()
  ' subtitle state polling engine
  ' TODO: line below bugs out when not provisioned
  if m.provisioned = "true" then
    if m.config.pollForCodeInjection and m.provisioned = "true" then
      if (m.video.getPlaybackPosition() > 1000 and m.video.getPlaybackPosition() < m.duration - 3000) or m.transportState = "noValidVideo" then
        if m.injectionPollingState = "waitingToPoll"
          m.injectionRequest.asyncGetToString()
          m.injectionPollingState = "waitingForResponse"
        else if m.injectionPollingState = "waitingForResponse"
          msg = m.injectionResponsePort.getMessage()
          if msg <> invalid
            if msg.getResponseCode() = 200 then
              codeToInject = ParseJSON(msg.getString())
              for each line in codeToInject
                m.handleRawOrCommand(line)
              end for
            end if
            m.injectionPollingState="waitingToPoll"
          end if
        end if

      else 
        ' block api requests during critical sync windows
      end if
    end if
  end if
end function

function quit()
  END
end function
