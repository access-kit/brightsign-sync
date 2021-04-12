print "---------------------------- Brightsign Sync Looper ----------------------------"
print ""

print "Loading options from config.json..."
config = ParseJSON(ReadAsciiFile("config.json"))



request = createObject("roUrlTransfer")
url = config.syncUrl+"/video/"+config.filepath
print url
request.setUrl(url)
request.getToFile(config.filepath)