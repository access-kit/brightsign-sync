reg = createobject("roRegistry")
nc = createObject("roNetworkConfiguration","eth0")
nc.setIP4Address("192.168.0.92")
nc.setIP4Netmask("255.255.255.0")
nc.setIP4Gateway("192.168.0.1")
nc.setIP4Broadcast("192.168.0.255")
nc.addDNSServer("8.8.8.8")
nc.apply()
reg.flush()
RebootSystem()