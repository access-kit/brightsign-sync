reg = CreateObject("roRegistrySection", "networking")
reg.write("ssh","22")

n=CreateObject("roNetworkConfiguration", 0)

n.SetLoginPassword("syncSign")
n.Apply()
reg.flush()
print "Password has been set and SSH Enabled."
movefile("autorun.brs","enablessh.brs")