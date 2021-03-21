LIBRARY "syncPlayer.brs"

print "---------------------------- Brightsign Sync Looper ----------------------------"

url = "http://samwolk.info/reneSeminar/index.php"
password = "FlatwingHollanderWhitney555"
id = "rene"
mediaPath = "rene_film.mov"

print "Initializing seamless synchronized looper..."
player = createSyncPlayer(id,mediaPath,url,password)

Print "Sleeping for 1s..."
sleep(2000)

print "Initialization complete."

' Start the endless loop!
player.loop()
