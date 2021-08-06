function bootSetup()
  initStatus = ParseJSON(ReadAsciiFile("init.json"))
  accessKitReg = createObject("roRegistrySection", "accessKit")
  n = CreateObject("roNetworkConfiguration", 0)
  registry = CreateObject("roRegistry")
  shouldReboot = False

  textboxConfig = createObject("roAssociativeArray")
  textboxConfig.AddReplace("CharWidth", 30)
  textboxConfig.AddReplace("CharHeight", 50)
  textboxConfig.AddReplace("BackgroundColor", &H000000) ' Black
  textboxConfig.AddReplace("TextColor", &Hffffff) ' White
  textbox = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, textboxConfig)
  
  ' Exit to Shell
  if initStatus.boottoshell = "true" then
    initstatus.boottoshell = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    END
  end if


  ' Factory reset
  if initStatus.justfactoryreset = "true" then
    ' Just factory reset, don't do it again, make sure we mark it in the registry.
    initStatus.justfactoryreset  = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    accessKitReg.write("resetComplete","true")
    accessKitReg.flush()
  else 
    if accessKitReg.read("resetComplete") <> "true" or initstatus.shouldfactoryreset = "true" then
      ' If the resetComplete registry entry does not exist, or the init file is set to force a reset, then...
      if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")

      textbox.SendBlock("Deleting Recovery settings.")
      sleep(2000)
      textbox.Cls()

      mfgn=createobject("roMfgtest")
      mfgn.FactoryReset()
      registry.Flush()
      initStatus.justfactoryreset = "true"
      initStatus.shouldfactoryreset = "false"
      WriteAsciiFile("init.json", FormatJSON(initStatus))
      

      textbox.SendBlock("Factory reset complete.  Restarting and then will configure network")
      sleep(4000)
      RebootSystem()
    end if
  end if

  ' Internet Connectivity Test
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





  ' DHCP SETUP
  if not n.getCurrentConfig().dhcp then
    n.setDHCP()
    n.apply()
    registry.flush()
    print("Should reboot because dhcp was not configured")
    shouldReboot = true
  end if
  





  ' Access-Kit provisioning 
  deviceInfo = createObject("roDeviceInfo")
  uniqueID = deviceInfo.getDeviceUniqueID()
  currentIP = n.getCurrentConfig().ip4_address
  currentHostname = n.getHostName()
  print "BrightSign Serial Number:", uniqueID
  print "BrightSign IP Address:", currentIP
  print "BrightSign Hostname:", currentHostname
  print "Checking Access-Kit provisioning status..."

  if accessKitReg.exists("playerID") then
    print "Player already provisioned."
    print "Checking for new configurtion..."
    ' check for new config data
    playerID = accessKitReg.read("playerID")
    configRequest = createObject("rourltransfer")
    configRequest.setUrl(ParseJSON(ReadAsciiFile("config.json")).syncURL+"/api/mediaplayer/"+playerID"?includeWork=false")
    configResponsePort = createObject("roMessagePort")
    configRequest.setPort(configResponsePort)
    configRequest.asyncGetToString()
    msg = configResponsePort.waitMessage(3000)
    if type(msg) <> "roUrlEvent" then 
      print "Could not connect to Access Kit service.  Connection timed out (3s)."
      ' Internet could not connect for some reason
    else if not msg.responseCode = 200 then
      ' Handle resource not found
      print "Could not connect to Access Kit service.  Error code: "+msg.responseCode
    else 
      data = ParseJSON(msg.getString())
      if uniqueID <> data.serialnumber then
        ' TODO: Handle conflict between player id and putativeID!
      end if
      if playerID <> data.id then
        ' TODO: Handle conflict between player id and putativeID!
      end if
      if n.getHostName() <> "access-kit-mediaplayer-"+data.id then
        n.setHostName("access-kit-mediaplayer-"+data.id)
        player.n.apply()
        print "Hostname updated.  Will reboot."
        shouldReboot = true
      end if
      data.ipAddress = currentIP
      data.playerID = data.id
      print("Acquired config data.")
      print(data)
      ' TODO: handle any other conflicts for which the authoritative source of truth is the player
      WriteAsciiFile("config.json",data)
      ' Updates remote with new IP
      print("Sending IP address to Access-Kit API...")
      configRequest.setUrl(data.syncURL+"/api/mediaplayer/"+playerID+"/ipAddress")
      configRequest.asyncPutFromString("password="+data.password+"&ipAddress="+data.currentIP)
    end if
  else
    ' register with access-kit
    if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")

    print("Attempting to connect to Access-Kit for the first time...")
    textbox.SendBlock("Attempting to connect to Access-Kit for the first time...")
    sleep(2000)
    textbox.Cls()

    accessKitReg.write("serialnumber",uniqueID)
    accessKitReg.flush()
    registry.flush()
    requestPlayerID = createObject("rourltransfer")
    requestPlayerID.setURL(ParseJSON(ReadAsciiFile("config.json")).syncURL+"/api/mediaplayer/serialnumber")
    password = ParseJSON(ReadAsciiFile("config.json")).password
    accessKitReg.write("password",password)
    accessKitReg.flush()
    registry.flush()
    requestPlayerIDPort = createObject("roMessagePort")
    requestPlayerID.setPort(requestPlayerIDPort)
    requestPlayerID.asyncPostFromString("password="+password+"&serialnumber="+uniqueID+"&ipAddress="+currentIP)
    msg = requestPlayerID.waitmessage(5000)
    if type(msg) <> ("roUrlEvent") then
      textbox.Cls()
      textbox.SendBlock("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
      while true
        sleep(1000)
      end while
    else 
      responseCode = msg.getResponseCode()
      if responseCode = 200 then
        response = = msg.getString()
        data = ParseJSON(response)
        playerID = data.id
        WriteAsciiFile("config.json",FormatJSON(data))
        accessKitReg.write("playerID",playerID)
        accessKitReg.flush()
        registry.flush()
      if n.getHostName() <> "access-kit-mediaplayer-"+playerID then
        n.setHostName("access-kit-mediaplayer-"+playerID)
        player.n.apply()
        print "Hostname updated."
        shouldReboot = true
      end if
      else 
        'TODO: handle 403
      end if
    end if
  end if








  ' SSH and DWS
  if accessKitReg.read("remoteAccessConfigured") <> "true" then
    if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")

    textbox.SendBlock("Setting up registries.")
    sleep(2000)
    textbox.Cls()

    reg = CreateObject("roRegistrySection", "networking")
    reg.write("ssh","22")

    n.SetLoginPassword("syncSign")
    n.SetupDWS({open:"syncSign"})

    n.Apply()
    reg.flush()


    ' regSec = CreateObject("roRegistrySection", "networking")
    ' regSec.Write("ptp_domain", "0")
    ' regSec.Flush()

    textbox.SendBlock("Registries written and flushed.  Restarting and loading main file.")
    accessKitReg.write("remoteAccessConfigured", "true")
    accessKitReg.flush()
    sleep(4000)
    shouldReboot = true
  end if 

  if shouldReboot then
    RebootSystem()
  end if

end function