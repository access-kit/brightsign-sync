vm = createObject("roVideoMode")
vm.setMode("1280x768x60p")

createObject("roSystemLog")

meta99 = CreateObject("roAssociativeArray")
meta99.AddReplace("CharWidth", 30)
meta99.AddReplace("CharHeight", 50)
meta99.AddReplace("BackgroundColor", &H000000) ' Dark grey
meta99.AddReplace("TextColor", &Hffffff) ' Yellow
tf99 = CreateObject("roTextField", 10, 10, 60, 2, meta99)
tf99.SendBlock("Setting video mode to custom resolution, and then will reboot")
sleep(2000)
