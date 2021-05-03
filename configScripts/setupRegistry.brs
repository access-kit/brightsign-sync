if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
meta99 = CreateObject("roAssociativeArray")
meta99.AddReplace("CharWidth", 30)
meta99.AddReplace("CharHeight", 50)
meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
meta99.AddReplace("TextColor", &Hffff00) ' Yellow
tf99 = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, meta99)

tf99.SendBlock("Setting up registries.")
sleep(2000)
tf99.Cls()



reg = CreateObject("roRegistrySection", "networking")
reg.write("ssh","22")

n=CreateObject("roNetworkConfiguration", 0)

n.SetLoginPassword("syncSign")
n.Apply()
reg.flush()

nc = CreateObject("roNetworkConfiguration", 0)
rebootRequired = nc.SetupDWS({open:"syncSign"})

' regSec = CreateObject("roRegistrySection", "networking")
' regSec.Write("ptp_domain", "0")
' regSec.Flush()

tf99.SendBlock("Registries written and flushed.  Restarting and loading main file.")
sleep(4000)
DeleteFile("autorun.brs")
MoveFile("runner.brs", "autorun.brs")
RebootSystem()
