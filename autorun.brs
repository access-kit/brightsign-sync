LIBRARY "syncPlayer.brs"
LIBRARY "boot.brs"



print "---------------------------- Brightsign Sync Looper ----------------------------"
print ""

bootSetup()

print "Loading options from config.json..."
config = ParseJSON(ReadAsciiFile("config.json"))
if config <> invalid then 
  print config
  print ""

  print "Initializing seamless synchronized looper..."
  player = createSyncPlayer(config)

  Print "Sleeping for 1s..."
  sleep(2000)

  print "Initialization complete."

  ' Start the endless loop!
  player.run()
else

  if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
  textboxConfig = createObject("roAssociativeArray")
  textboxConfig.AddReplace("CharWidth", 30)
  textboxConfig.AddReplace("CharHeight", 50)
  textboxConfig.AddReplace("BackgroundColor", &H000000) ' Black
  textboxConfig.AddReplace("TextColor", &Hffffff) ' White
  textbox = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 4, textboxConfig)
  textbox.sendBlock("Error in mediaplayer configuration file... The mediaplayer will automatically restart in 10s and attempt to fetch a new configuration file.  It must be connected to the internet to do so.  If the problem persists, please manually replace the configuration file.")
  sleep(10000)
  RebootSystem()
end if
