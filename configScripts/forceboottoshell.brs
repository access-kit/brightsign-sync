init = parsejson(readasciifile("init.json"))
init.boottoshell = "true"
writeasciifile("init.json",formatjson(init))