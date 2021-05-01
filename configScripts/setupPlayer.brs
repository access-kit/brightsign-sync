reg = CreateObject("roRegistrySection", "networking")
reg.write("ssh","22")

n=CreateObject("roNetworkConfiguration", 0)

n.SetLoginPassword("syncSign")
n.Apply()
reg.flush()
print "Password has been set and SSH Enabled."

nc = CreateObject("roNetworkConfiguration", 0)
rebootRequired = nc.SetupDWS({open:"syncSign"})

regSec = CreateObject("roRegistrySection", "networking")
regSec.Write("ptp_domain", "0")
regSec.Flush()


WriteAsciiFile("initialized.txt","1")
RebootSystem()
