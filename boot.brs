function bootSetup()
  initStatus = ParseJSON(ReadAsciiFile("init.json"))
  ' Exit to Shell
  if initStatus.boottoshell = "true" then
    print("Exiting to shell immediately.")
    initstatus.boottoshell = "false"
    WriteAsciiFile("init.json",FormatJSON(initStatus))
    END
  end if


  networkConfig = ParseJSON(ReadAsciiFile("network.json"))
  if networkConfig = invalid then
    networkConfig = createObject("roAssociativeArray")
    networkConfig.addReplace("useStaticIP",false)
    networkConfig.addReplace("ipAddress","192.168.0.2")
    networkConfig.addReplace("gateway","192.168.0.1")
    networkConfig.addReplace("broadcast","192.168.0.255")
    networkConfig.addReplace("netmask","255.255.255.0")
    networkConfig.addReplace("dns","8.8.8.8")
    networkConfig.addReplace("useWifi",false)
    networkConfig.addReplace("wifiSSID","my-wifi")
    WriteAsciiFile("network.json",formatjson(networkConfig))
  end if
  if networkConfig.useWifi = invalid then
    networkConfig.useWifi = false
    WriteAsciiFile("network.json",formatjson(networkConfig))
  end if

  accessKitReg = createObject("roRegistrySection", "accessKit")
  if networkConfig.useWifi then
    n = CreateObject("roNetworkConfiguration", 1)
  else
    n = CreateObject("roNetworkConfiguration", 0)
  end if
  registry = CreateObject("roRegistry")
  networkConfigLogger = CreateObject("roAssociativeArray")
  shouldReboot = False
  textbox = createTextBox()

  if initstatus.runnetworkdiagnostics = "true" then
    writeasciifile("interfaceTestResults.json",formatjson(n.testinterface()))
    writeasciifile("internetConnectivityResults.json",formatjson(n.testInternetConnectivity()))
    writeasciifile("networkConfigurationCurrentConfig.json",formatjson(n.getCurrentConfig()))
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

      textbox.SendBlock("Clearing registries/settings...")
      sleep(3000)
      textbox.Cls()

      mfgn=createobject("roMfgtest")
      mfgn.FactoryReset()
      registry.Flush()
      initStatus.justfactoryreset = "true"
      initStatus.shouldfactoryreset = "false"
      WriteAsciiFile("init.json", FormatJSON(initStatus))
      

      textbox.SendBlock("Registry reset complete.  Restarting and then will configure network.")
      sleep(4000)
      RebootSystem()
    end if
  end if

  if networkConfig.useWifi then
    if not n.GetWiFiESSID() = networkConfig.wifiSSID then
      n.SetWiFiESSID(networkConfig.wifiSSID)
    end if
    if networkConfig.wifiPASS <> invalid then
      n.SetWiFiPassphrase(networkConfig.wifiPASS)
      networkConfig.delete("wifiPASS")
      n.apply()
      ' TODO: Should overwrite network.json file!!!
    end if
  end if

  currentIP = n.getCurrentConfig().ip4_address
  macAddress = n.getCurrentConfig().ethernet_mac
  currentHostname = n.getHostName()

  ' IP SETUP
  if not networkConfig.useStaticIP then
    if not n.getCurrentConfig().dhcp then
      textbox.SendBlock("Switching to DHCP (will reboot after setup is complete)")
      sleep(3000)
      textbox.Cls()
      n.setDHCP()
      n.setTimeServer("time.brightsignnetwork.com")
      n.apply()
      registry.flush()
      print("Should reboot because dhcp was not configured")
      shouldReboot = true
    else
      networkConfig.addReplace("ipAddress",n.getCurrentConfig().ip4_address)
      networkConfig.addReplace("netmask",n.getCurrentConfig().ip4_netmask)
      networkConfig.addReplace("broadcast",n.getCurrentConfig().ip4_broadcast)
      networkConfig.addReplace("gateway",n.getCurrentConfig().ip4_gateway)
      networkConfig.addReplace("dns",n.getCurrentConfig().dns_servers[0])
      writeasciifile("network.json",formatjson(networkconfig))
      print "Using DHCP."
    end if
  else 
    currentConfig = n.getCurrentConfig()
    shouldUpdateConfig = false
    if not currentConfig.ip4_address = networkConfig.ipAddress then 
      networkConfigLogger.addReplace("old_ip4",currentConfig.ip4_address)
      networkConfigLogger.addReplace("new_ip4",networkConfig.ipAddress)
      shouldUpdateConfig = true
    end if
    if not currentConfig.ip4_netmask = networkConfig.netmask then 
      networkConfigLogger.addReplace("old_netmask",currentConfig.ip4_netmask)
      networkConfigLogger.addReplace("new_netmask",networkConfig.netmask)
      shouldUpdateConfig = true
    end if
    if not currentConfig.ip4_gateway = networkConfig.gateway then 
      networkConfigLogger.addReplace("old_gateway",currentConfig.ip4_gateway)
      networkConfigLogger.addReplace("new_gateway",networkConfig.gateway)
      shouldUpdateConfig = true
    end if
    if not currentConfig.ip4_broadcast = networkConfig.broadcast then 
      networkConfigLogger.addReplace("old_broadcast",currentConfig.ip4_broadcast)
      networkConfigLogger.addReplace("new_broadcast",networkConfig.broadcast)
      shouldUpdateConfig = true
    end if
    if shouldUpdateConfig then
      n.setTimeServer("time.brightsignnetwork.com")
      if initStatus.debugNetworkConfig = "true" then
        result = eval(ReadAsciiFile("networkConfigCodeSnippet.txt"))
        textbox.cls()
        textbox.sendblock("Network Configuration Code Evaluation Response Code:"+result.toStr())
        while True
          sleep(3000)
        end while
      else 
        shouldReboot = true
        WriteAsciiFile("networkConfigurationChangeLog.json",FormatJSON(networkConfigLogger))
        textbox.SendBlock("Attempting to set up Static IP Address...")
        sleep(3000)
        textbox.Cls()
        textbox.SendBlock("IP: "+networkConfig.ipAddress)
        sleep(1000)
        textbox.Cls()
        textbox.SendBlock("Netmask: "+networkConfig.netmask)
        sleep(1000)
        textbox.Cls()
        textbox.SendBlock("Broadcast: "+networkConfig.broadcast)
        sleep(1000)
        textbox.Cls()
        textbox.SendBlock("Gateway: "+networkConfig.gateway)
        sleep(1000)
        textbox.Cls()
        textbox.SendBlock("DNS Server: "+networkConfig.dns)
        sleep(1000)
        textbox.Cls()
        n.setIP4Address(networkConfig.ipAddress)
        n.setIP4Netmask(networkConfig.netmask)
        n.setIP4Gateway(networkConfig.gateway)
        n.setIP4Broadcast(networkConfig.broadcast)
        n.addDNSServer(networkConfig.dns)
        n.apply()
        registry.flush()
        WriteAsciiFile("networkConfigurationCompletion.txt",FormatJSON("Done!"))
      end if
    else
      print "Using previously configured static ip."
    end if
  end if

  ' SSH and DWS
  if accessKitReg.read("remoteAccessConfigured") <> "true" then

    textbox.SendBlock("Setting up SSH and Diagnostic Web Server.")
    sleep(2000)
    textbox.Cls()

    reg = CreateObject("roRegistrySection", "networking")
    reg.write("ssh","22")

    n.SetLoginPassword("syncSign")
    n.SetupDWS({open:"syncSign"})

    n.Apply()


    ' regSec = CreateObject("roRegistrySection", "networking")
    ' regSec.Write("ptp_domain", "0")
    ' regSec.Flush()

    textbox.SendBlock("SSH and DWS setup.  Password: syncSign.  Rebooting to flush registries... ")
    accessKitReg.write("remoteAccessConfigured", "true")
    accessKitReg.flush()
    registry.flush()
    sleep(4000)
    shouldReboot = true
  end if 

  if shouldReboot then
    RebootSystem()
  end if

  ' Internet Connectivity Test
  if initstatus.testinternet = "true" then 
    testReq = createObject("rourltransfer")
    testReq.setURL(ParseJSON(ReadAsciiFile("config.json")).syncUrl+"/api/sync?reqSentAt=0")
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
  deviceCustomization = createObject("roDeviceCustomization")
  deviceCustomization.writeSplashScreen("access-kit.png")
  deviceInfo = createObject("roDeviceInfo")
  uniqueID = deviceInfo.getDeviceUniqueID()
  currentIP = n.getCurrentConfig().ip4_address
  macAddress = n.getCurrentConfig().ethernet_mac
  currentHostname = n.getHostName()
  print "BrightSign Serial Number:", uniqueID
  print "BrightSign IP Address:", currentIP
  print "BrightSign Mac Address:", macAddress
  print "BrightSign Hostname:", currentHostname
  print "Checking Access-Kit provisioning status..."

  if accessKitReg.exists("id") then
    id = accessKitReg.read("id").toInt()
    password = accessKitReg.read("password")
    syncUrl = accessKitReg.read("syncUrl")
    print "Player already provisioned with id "+id.toStr()+"."
    if accessKitReg.exists("password") <> true then
      print("No password in registry.")
      localConfig= ParseJSON(ReadAsciiFile("config.json"))
      if localConfig <> invalid then 
        configPassword = localConfig.password
        print "Password found in local file."
        if configPassword <> invalid then
          password = configPassword
          accessKitReg.write("password", password)
          accessKitReg.flush()
        else
          print("No password in the access kit registry and no sync url in the config file.")
          textbox.sendBlock("No password was found in the registry or in the configuration file.  Please add it to the config file then reboot.")
          sleep(3000)

        end if
      else 
        print("No password in the access kit registry and no sync url in the config file.")
        textbox.sendBlock("No password was found in the registry or in the configuration file.  Please add it to the config file then reboot.")
          sleep(3000)
      end if
    else
      print "Password found in registry."
    end if
    if accessKitReg.exists("syncUrl") <> true then
      print("No sync url in registry.")
      localConfig= ParseJSON(ReadAsciiFile("config.json"))
      if localConfig <> invalid then 
        configSyncUrl = localConfig.syncUrl
        print "syncUrl found in local file: ", configSyncUrl
        if configSyncUrl <> invalid then
          syncUrl = configSyncUrl
          accessKitReg.write("syncUrl", syncUrl)
          accessKitReg.flush()
        else
          print("No sync url in the access kit registry and no sync url in the config file.")
          textbox.sendBlock("No Sync URL was found in the registry or in the configuration file.  Please add it to the config file then reboot.")
          sleep(3000)
        end if
      else 
        print("No sync url in the access kit registry and no sync url in the config file.")
        textbox.sendBlock("No Sync URL was found in the registry or in the configuration file.  Please add it to the config file then reboot.")
        sleep(3000)
      end if
    else
      print "syncUrl found in registry: ", syncUrl
    end if
    print "Checking for new configuration..."
    ' check for new config data
    configRequest = createObject("rourltransfer")
    configRequest.setUrl(syncUrl+"/api/mediaplayer/"+id.toStr()+"?includeWork=false")
    configResponsePort = createObject("roMessagePort")
    configRequest.setPort(configResponsePort)
    configRequest.asyncGetToString()
    msg = configResponsePort.waitMessage(3000)
    if type(msg) <> "roUrlEvent" then 
      print "Could not connect to Access Kit service.  Connection timed out (3s)."
      ' Internet could not connect for some reason
    else if msg.getResponseCode() <> 200 then
      ' Handle resource not found
      print "Could not connect to Access Kit service.  Error code: "+msg.getResponseCode().toStr()
    else 
      data = ParseJSON(msg.getString())
      if uniqueID <> data.serialNumber then
        ' TODO: Handle conflict between player id and putativeID!
      else
        print "Serial number matched remote known serial number."
      end if
      if id <> data.id then
        ' TODO: Handle conflict between player id and putativeID!
      else
        print "Player ID matched remote known Player ID."
      end if
      if n.getHostName() <> data.nickname+"-"+data.id.tostr() then
        n.setHostName(data.nickname+"-"+data.id.tostr())
        n.apply()
        print "Hostname updated.  Will reboot."
        textbox.SendBlock("Updating hostname and then will reboot.  New hostname: "+data.nickname+"-"+data.id.tostr() )
        sleep(3000)
        textbox.Cls()
        shouldReboot = true
      end if
      print("Acquired config data.")
      print(data)
      ' TODO: handle any other conflicts for which the authoritative source of truth is the player
      WriteAsciiFile("config.json",formatjson(data))
      ' Updates remote with new IP
      print("Sending IP and MAC address to Access-Kit API...")
      ipReq = createObject("rourltransfer")
      ipReq.setUrl(syncUrl+"/api/mediaplayer/"+id.toStr()+"/ipAddress")
      ipReq.asyncPostFromString("password="+password+"&ipAddress="+currentIP)
      macReq = createObject("rourltransfer")
      macReq.setUrl(data.syncUrl+"/api/mediaplayer/"+id.toStr()+"/macAddress")
      macReq.asyncPostFromString("password="+password+"&macAddress="+macAddress)
    end if
  else
    ' register with access-kit

    print("Attempting to connect to Access-Kit for the first time...")
    textbox.SendBlock("Attempting to connect to Access-Kit for the first time...")
    sleep(2000)
    textbox.Cls()

    initialConfigData = ParseJSON(ReadAsciiFile("config.json"))
    password = initialConfigData.password
    syncUrl = initialConfigData.syncUrl
    if password = invalid then
      password = "null"
      print("No password was provided for provisioning.  Please log in to your access kit account for the proper provisioning configuration data.")
      textbox.SendBlock("No password was provided for provisioning.  Please log in to your access kit account for the proper provisioning configuration data.")
      sleep(4000)
      textbox.Cls()
    end if
    if syncUrl = invalid then
      syncUrl = "null"
      print("No syncurl was provided for provisioning.  Please log in to your access kit account for the proper provisioning configuration data.")
      textbox.SendBlock("No Sync URL was provided for provisioning.  Please log in to your access kit account for the proper provisioning configuration data.")
      sleep(4000)
      textbox.Cls()
    end if
    accessKitReg.write("serialNumber",uniqueID)
    accessKitReg.write("password",password)
    accessKitReg.write("syncUrl",syncUrl)
    accessKitReg.flush()
    registry.flush()

    requestPlayerID = createObject("rourltransfer")
    requestPlayerID.setURL(syncUrl+"/api/mediaplayer/serialnumber")
    requestPlayerIDPort = createObject("roMessagePort")
    requestPlayerID.setPort(requestPlayerIDPort)
    requestPlayerID.asyncPostFromString("password="+password+"&serialNumber="+uniqueID+"&ipAddress="+currentIP+"&syncUrl="+syncUrl+"&macAddress="+macAddress)

    msg = requestPlayerIDPort.waitmessage(20000)

    if type(msg) <> ("roUrlEvent") then
      textbox.Cls()
      textbox.SendBlock("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
      sleep(4000)
      textbox.cls()
      textbox.SendBlock("The player will now startup with limited functionality.")
      sleep(4000)
      textbox.cls()
      print("failed to connect.")
      accessKitReg.write("provisioned","false")
      accessKitReg.flush()
      registry.flush()
    else 
      responseCode = msg.getResponseCode()
      if responseCode = 200 then
        response = msg.getString()
        data = ParseJSON(response)
        WriteAsciiFile("config.json",FormatJSON(data))
        accessKitReg.write("id",data.id.toStr())
        accessKitReg.write("provisioned","true")
        accessKitReg.flush()
        registry.flush()
        textbox.SendBlock("Succesfully registered!  Player ID: "+data.id.toStr())
        sleep(7000)
        textbox.Cls()
        if n.getHostName() <> data.nickname+"-"+data.id.toStr() then
          n.setHostName(data.nickname+"-"+data.id.toStr())
          n.apply()
          print "Hostname updated."
          textbox.SendBlock("Updating hostname and then will reboot.  New hostname: "+ data.nickname+"-"+data.id.toStr())
          sleep(5000)
          textbox.Cls()
          shouldReboot = true
        end if
      else 
        textbox.Cls()
        textbox.SendBlock("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
        print("Could not connect to Access-Kit provisioning service; check that the internet connection is valid and restart the player.  If the problem persists, please contact info@accesskit.media")
        sleep(4000)
        textbox.cls()
        textbox.SendBlock("The player will now startup with limited functionality.")
        sleep(4000)
        textbox.cls()
        print("failed to connect.")
        accessKitReg.flush()
        registry.flush()
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
  textbox = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 4, textboxConfig)
  return textbox
end function