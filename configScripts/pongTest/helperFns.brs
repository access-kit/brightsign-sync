sub pongForever(_receiver, _sender, pingMessage as String, addr as String,response)
  roMP = CreateObject("roMessagePort")
  _receiver.SetPort(roMP)
  while true
    event = roMP.WaitMessage(0)
    if type(event) = "roDatagramEvent" then
      print "Datagram: ";event
      if event = pingMessage then
        _sender.send(oscBuildMessage(addr,response))
      endif
    endif
  end while
end sub
