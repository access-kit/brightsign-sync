function createGPIOManager(parent)
	print("Configuring GPIO Manager")

  gpioManager = createObject("roAssociativeArray")
  gpioManager.parent = parent
  gpioManager.controlPort = createObject("roControlPort", "BrightSign")
  gpioManager.controlPort.enableInput(1)
  gpioManager.messagePort = createObject("roMessagePort")
  gpioManager.controlPort.setPort(gpioManager.messagePort)
  gpioManager.handle = handleGPIO

  return gpioManager

end function

function handleGPIO()
  if m.parent.gpioEnabled and m.parent.clock.state = "idle"
    msg = m.messagePort.GetMessage()
    if msg <> invalid
      if type(msg) = "roControlDown"
        m.parent.subtitler.activate()
      else if type(msg) = "roControlUp"
        m.parent.subtitler.deactivate()
      end if
    end if
  end if
end function
