function updateScripts() 
    config = ParseJSON(ReadAsciiFile("config.json"))
    print "Attempting to download new scripts from "+config.syncURL+"/brightsign/"+"..."
    

    resPort = createObject("roMessagePort")
    request = createObject("roUrlTransfer")
    request.setPort(resPort)
    print "Getting autorun..."
    autorunslug = config.syncUrl+"/brightsign/autorun.brs"
    request.setUrl(autorunslug)
    request.asyncGetToFile("autorun.brs")
    resPort.waitMessage(2000)
    print "Getting sync player library..."
    syncPlayerslug = config.syncUrl+"/brightsign/syncPlayer.brs"
    request.setUrl(syncplayerslug)
    request.getToFile("syncPlayer.brs")
    resPort.waitMessage(2000)
    print "Getting time library"
    timeslug = config.syncUrl+"/brightsign/time.brs"
    request.setUrl(timeslug)
    request.getToFile("time.brs")
    resPort.waitMessage(2000)
    print "Getting content updater..."
    getContentslug = config.syncUrl+"/brightsign/getContent.brs"
    request.setUrl(getContentslug)
    request.getToFile("getContent.brs")
    resPort.waitMessage(2000)
    print "Getting script updater..."
    updateScriptsslug = config.syncUrl+"/brightsign/updateScripts.brs"
    request.setUrl(updateScriptsslug)
    request.getToFile("updateScripts.brs")
    resPort.waitMessage(2000)
    print "Attempt to update scripts has completed."
end function