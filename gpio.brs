function createGPIOManager(parent)
	print("Configuring GPIO Manager")

  gpioManager = createObject("roAssociativeArray")
  gpioManager.parent = parent
  gpioManager.controlPort = createObject("roControlPort", "BrightSign")
  gpioManager.messagePort = createObject("roMessagePort")
  gpioManager.controlPort.setPort(gpioManager.messagePort)
  gpioManager.handle = handleGPIO

  triggerPin = gpioGetTriggerInputPin(parent)
  if parent.config.syncMode = "gpiotriggered" then
    gpioManager.controlPort.enableInput(triggerPin)
    print "gpiotriggered: listening on GPIO input "; triggerPin
  else
    gpioManager.controlPort.enableInput(1)
  end if

  return gpioManager

end function

function gpioGetTriggerInputPin(parent as Object) as Integer
  pin = parent.config.gpioTriggerPin
  if pin = invalid then
    return 1
  end if
  return cint(pin)
end function

function handleGPIO()
  if not m.parent.gpioEnabled then
    return
  end if

  msg = m.messagePort.GetMessage()
  if msg = invalid then
    return
  end if

  if m.parent.config.syncMode = "gpiotriggered" then
    ' Match follower UDP "start": only begin a new cycle from idle transport.
    if m.parent.transportState = "idle" then
      if type(msg) = "roControlDown" and msg.GetInt() = gpioGetTriggerInputPin(m.parent) then
        print "GPIO trigger: starting playback (gpiotriggered mode)"
        m.parent.transportState = "starting"
      end if
    end if
    return
  end if

  if m.parent.clock.state = "idle" then
    if type(msg) = "roControlDown" then
      m.parent.subtitler.activate()
    else if type(msg) = "roControlUp" then
      m.parent.subtitler.deactivate()
    end if
  end if
end function
