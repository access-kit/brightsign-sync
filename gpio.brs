function createGPIOManager(parent)
	print("Configuring GPIO Manager")

  gpioManager = createObject("roAssociativeArray")
  gpioManager.parent = parent

  ' Load gpio.json with auto-populate of defaults
  gpioConfig = loadGPIOConfig()
  gpioManager.captionsPin = gpioConfig.captionsPin
  gpioManager.triggerPin = gpioConfig.triggerPin
  gpioManager.triggerOn = gpioConfig.triggerOn

  ' The captions pin always gets wired up. The trigger pin is only wired
  ' up when the player is in gpiotriggered sync mode AND the pin differs
  ' from the captions pin (avoid double-purposing a single pin).
  gpioManager.triggerEnabled = false
  if parent.config.syncMode = "gpiotriggered"
    if gpioManager.triggerPin = gpioManager.captionsPin
      print("WARNING: gpio.json triggerPin ("+gpioManager.triggerPin.toStr()+") is the same as captionsPin; GPIO trigger disabled.")
    else
      gpioManager.triggerEnabled = true
    end if
  end if

  gpioManager.controlPort = createObject("roControlPort", "BrightSign")
  gpioManager.controlPort.enableInput(gpioManager.captionsPin)
  if gpioManager.triggerEnabled
    print("Enabling GPIO trigger input on pin "+gpioManager.triggerPin.toStr()+" with edge "+gpioManager.triggerOn+".")
    gpioManager.controlPort.enableInput(gpioManager.triggerPin)
  end if
  gpioManager.messagePort = createObject("roMessagePort")
  gpioManager.controlPort.setPort(gpioManager.messagePort)
  gpioManager.handle = handleGPIO

  return gpioManager

end function

function loadGPIOConfig() as Object
  defaults = createObject("roAssociativeArray")
  defaults.addReplace("captionsPin", 1)
  defaults.addReplace("triggerPin", 0)
  defaults.addReplace("triggerOn", "down")

  needsWrite = false
  gpioConfig = ParseJSON(ReadAsciiFile("gpio.json"))
  if gpioConfig = invalid
    print("gpio.json missing or unparseable; writing defaults.")
    gpioConfig = defaults
    needsWrite = true
  else
    ' captionsPin
    if type(gpioConfig.captionsPin) <> "Integer" or gpioConfig.captionsPin < 0 or gpioConfig.captionsPin > 7
      print("gpio.json captionsPin invalid; using default 1.")
      gpioConfig.addReplace("captionsPin", defaults.captionsPin)
      needsWrite = true
    end if
    ' triggerPin
    if type(gpioConfig.triggerPin) <> "Integer" or gpioConfig.triggerPin < 0 or gpioConfig.triggerPin > 7
      print("gpio.json triggerPin invalid; using default 0.")
      gpioConfig.addReplace("triggerPin", defaults.triggerPin)
      needsWrite = true
    end if
    ' triggerOn
    if gpioConfig.triggerOn <> "down" and gpioConfig.triggerOn <> "up"
      print("gpio.json triggerOn invalid; using default 'down'.")
      gpioConfig.addReplace("triggerOn", defaults.triggerOn)
      needsWrite = true
    end if
  end if

  if needsWrite
    WriteAsciiFile("gpio.json", FormatJSON(gpioConfig))
  end if

  return gpioConfig
end function

function handleGPIO()
  if m.parent.gpioEnabled
    msg = m.messagePort.GetMessage()
    if msg <> invalid
      msgType = type(msg)
      if msgType = "roControlDown" or msgType = "roControlUp"
        pin = msg.GetInt()
        if pin = m.captionsPin
          ' Captions toggle: only while playback is idle (preserves existing behavior).
          if m.parent.clock.state = "idle"
            if msgType = "roControlDown"
              m.parent.subtitler.activate()
            else
              m.parent.subtitler.deactivate()
            end if
          end if
        else if m.triggerEnabled and pin = m.triggerPin and m.parent.config.syncMode = "gpiotriggered"
          triggerEdge = "roControlDown"
          if m.triggerOn = "up" then triggerEdge = "roControlUp"
          if msgType = triggerEdge
            print("GPIO trigger fired on pin "+pin.toStr()+"; moving transport to 'starting'.")
            m.parent.transportState = "starting"
          end if
        end if
      end if
    end if
  end if
end function
