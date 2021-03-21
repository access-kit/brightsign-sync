LIBRARY "oscBuilder.brs"
LIBRARY "helperFns.brs"

sender = CreateObject("roDatagramSender")
sender.setDestination("192.168.0.234",9005)
receiver = CreateObject("roDatagramReceiver", 9004)

pongForever(receiver,sender,"ping","/response","pong")
