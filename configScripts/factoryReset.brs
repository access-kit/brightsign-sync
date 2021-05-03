


if type(vm) <> "roVideoMode" then vm = CreateObject("roVideoMode")
meta99 = CreateObject("roAssociativeArray")
meta99.AddReplace("CharWidth", 30)
meta99.AddReplace("CharHeight", 50)
meta99.AddReplace("BackgroundColor", &H101010) ' Dark grey
meta99.AddReplace("TextColor", &Hffff00) ' Yellow
tf99 = CreateObject("roTextField", vm.GetSafeX()+10, vm.GetSafeY()+vm.GetSafeHeight()/2, 60, 2, meta99)

tf99.SendBlock("Deleting Recovery settings.")
sleep(2000)
tf99.Cls()
if type(registry) <> "roRegistry" then registry = CreateObject("roRegistry")

mfgn=createobject("roMfgtest")
mfgn.FactoryReset()
registry.Flush()

tf99.SendBlock("Settings Deleted. Remove script from flash card, and Restart.")
sleep(4000)
DeleteFile("autorun.brs")
MoveFile("setupRegistry.brs","autorun.brs")
RebootSystem()
