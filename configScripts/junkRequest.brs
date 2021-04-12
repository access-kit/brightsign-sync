req = createObject("roUrlTransfer")
req.setUrl("http://192.168.0.202")
resPort = createObject("roMessagePort")
req.setPort(resPort)
req.asyncGetToString()
res = resPort.waitMessage(10000)
if not res=invalid  then 
    print res.getString()
    print type(res)
    print res
else
    print "req failed"
end if