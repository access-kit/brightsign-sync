' shell commands

' registry write networking http_server 80
' registry flush
' brightscript autorun

nc = CreateObject("roNetworkConfiguration", 0)
rebootRequired = nc.SetupDWS({open:"syncSign"})
if rebootRequired RebootSystem()
