LIBRARY "updateScripts.brs"
LIBRARY "syncPlayer.brs"



print "---------------------------- Brightsign Sync Looper ----------------------------"
print ""

print "Loading options from config.json..."
config = ParseJSON(ReadAsciiFile("config.json"))
print config
print ""

print "Initializing seamless synchronized looper..."
player = createSyncPlayer(config)

Print "Sleeping for 1s..."
sleep(2000)

print "Initialization complete."

' Start the endless loop!
player.loop()
