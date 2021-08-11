function bootSetup()
  initStatus = ParseJSON(ReadAsciiFile("init.json"))
  ' Exit to Shell
  if initStatus.boottoshell = "true" then
    print("Exiting to shell immediately.")
    initstatus.boottoshell = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    END
  end if


  accessKitReg = createObject("roRegistrySection", "accessKit")
  n = CreateObject("roNetworkConfiguration", 0)
  registry = CreateObject("roRegistry")
  shouldReboot = False
  textbox = createTextBox()

  


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

  ' DHCP SETUP
  if not n.getCurrentConfig().dhcp then
    n.setDHCP()
    n.apply()
    registry.flush()
    print("Should reboot because dhcp was not configured")
    shouldReboot = true
  end if

  ' SSH and DWS
  if accessKitReg.read("remoteAccessConfigured") <> "true" then

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

  ' Internet Connectivity Test
  if initstatus.testinternet = "true" then 
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
          print(msg.getResponseCode())
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

  if accessKitReg.exists("id") then
    id = accessKitReg.read("id").toInt()
    password = accessKitReg.read("password")
    print "Player already provisioned with id "+id.toStr()+"."
    previousConfig = ParseJSON(ReadAsciiFile("config.json"))
    print "Checking for new configuration..."
    ' check for new config data
    configRequest = createObject("rourltransfer")
    configRequest.setUrl(previousConfig.syncURL+"/api/mediaplayer/"+id.toStr()+"?includeWork=false")
    configResponsePort = createObject("roMessagePort")
    configRequest.setPort(configResponsePort)
    configRequest.asyncGetToString()
    msg = configResponsePort.waitMessage(3000)
    if type(msg) <> "roUrlEvent" then 
      print "Could not connect to Access Kit service.  Connection timed out (3s)."
      ' Internet could not connect for some reason
    else if msg.getResponseCode() <> 200 then
      ' Handle resource not found
      print "Could not connect to Access Kit service.  Error code: "+msg.getResponseCode()
    else 
      data = ParseJSON(msg.getString())
      if uniqueID <> data.serialnumber then
        ' TODO: Handle conflict between player id and putativeID!
      else
        print "Serial number matched remote known serial number."
      end if
      if id <> data.id then
        ' TODO: Handle conflict between player id and putativeID!
      else
        print "Player ID matched remote known Player ID."
      end if
      if n.getHostName() <> "access-kit-mediaplayer-"+data.id.tostr() then
        n.setHostName("access-kit-mediaplayer-"+data.id.tostr())
        n.apply()
        print "Hostname updated.  Will reboot."
        shouldReboot = true
      end if
      print("Acquired config data.")
      print(data)
      ' TODO: handle any other conflicts for which the authoritative source of truth is the player
      WriteAsciiFile("config.json",formatjson(data))
      ' Updates remote with new IP
      print("Sending IP address to Access-Kit API...")
      configRequest.setUrl(data.syncURL+"/api/mediaplayer/"+id.toStr()+"/ipAddress")
      configRequest.asyncPutFromString("password="+password+"&ipAddress="+data.ipAddress)
    end if
  else
    ' register with access-kit

    print("Attempting to connect to Access-Kit for the first time...")
    textbox.SendBlock("Attempting to connect to Access-Kit for the first time...")
    sleep(2000)
    textbox.Cls()

    initialConfigData = ParseJSON(ReadAsciiFile("config.json"))
    password = initialConfigData.password
    accessKitReg.write("serialnumber",uniqueID)
    accessKitReg.write("password",password)
    accessKitReg.flush()
    registry.flush()

    requestPlayerID = createObject("rourltransfer")
    requestPlayerID.setURL(initialConfigData.syncURL+"/api/mediaplayer/serialnumber")
    requestPlayerIDPort = createObject("roMessagePort")
    requestPlayerID.setPort(requestPlayerIDPort)
    requestPlayerID.asyncPostFromString("password="+password+"&serialnumber="+uniqueID+"&ipAddress="+currentIP+"&syncURL="+initialConfigData.syncURL)

    msg = requestPlayerIDPort.waitmessage(5000)

    if type(msg) <> ("roUrlEvent") then
      textbox.Cls()
      textbox.SendBlock("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
      print("failed to connect.")
      while true
        sleep(1000)
        print("Failed to connect, caught in loop...")
      end while
    else 
      responseCode = msg.getResponseCode()
      if responseCode = 200 then
        response = msg.getString()
        data = ParseJSON(response)
        WriteAsciiFile("config.json",FormatJSON(data))
        accessKitReg.write("id",data.id.toStr())
        accessKitReg.flush()
        registry.flush()
        if n.getHostName() <> "access-kit-mediaplayer-"+data.id.toStr() then
          n.setHostName("access-kit-mediaplayer-"+data.id.toStr())
          n.apply()
          print "Hostname updated."
          shouldReboot = true
        end if
      else 
        textbox.Cls()
        textbox.SendBlock("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
        print("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
        while true
          sleep(1000)
        end while
      end if
    end if
  end if









  if shouldReboot then
    RebootSystem()
  end if

end function

function createTextBox()
  if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
  textboxConfig = createObject("roAssociativeArray")
  textboxConfig.AddReplace("CharWidth", 30)
  textboxConfig.AddReplace("CharHeight", 50)
  textboxConfig.AddReplace("BackgroundColor", &H000000) ' Black
  textboxConfig.AddReplace("TextColor", &Hffffff) ' White
  textbox = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, textboxConfig)
  return textbox
end function