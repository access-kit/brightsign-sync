function createGPIOManager(parent)
  print("Configuring GPIO Manager")

  gpioConfig = loadGPIOConfig()

  gpioManager = createObject("roAssociativeArray")
  gpioManager.parent = parent
  gpioManager.controlPort = createObject("roControlPort", "BrightSign")
  gpioManager.messagePort = createObject("roMessagePort")
  gpioManager.controlPort.setPort(gpioManager.messagePort)
  gpioManager.handle = handleGPIO

  gpioManager.captionsPin = gpioConfig.captionsPin
  gpioManager.triggerPin = gpioConfig.triggerPin
  gpioManager.startEdge = gpioConfig.startEdge
  gpioManager.stopOnOppositeEdge = gpioConfig.stopOnOppositeEdge
  if gpioManager.startEdge = "up" then
    gpioManager.startEdgeType = "roControlUp"
    gpioManager.stopEdgeType = "roControlDown"
  else
    gpioManager.startEdgeType = "roControlDown"
    gpioManager.stopEdgeType = "roControlUp"
  end if

  gpioManager.controlPort.enableInput(gpioManager.captionsPin)
  print("GPIO: captionsPin enabled on pin "+gpioManager.captionsPin.toStr())

  gpioManager.triggerEnabled = false
  if parent.config.syncMode = "gpiotriggered" then
    if gpioManager.triggerPin = gpioManager.captionsPin then
      print("WARNING: gpio.json triggerPin equals captionsPin ("+gpioManager.triggerPin.toStr()+"); captions wins, trigger disabled.")
    else
      gpioManager.controlPort.enableInput(gpioManager.triggerPin)
      gpioManager.triggerEnabled = true
      print("GPIO: triggerPin enabled on pin "+gpioManager.triggerPin.toStr()+", startEdge="+gpioManager.startEdge)
    end if
  end if

  return gpioManager
end function

function loadGPIOConfig()
  defaults = createObject("roAssociativeArray")
  defaults.addReplace("captionsPin", 1)
  defaults.addReplace("triggerPin", 0)
  defaults.addReplace("startEdge", "down")
  defaults.addReplace("stopOnOppositeEdge", true)

  needsWrite = false
  gpioConfig = ParseJSON(ReadAsciiFile("gpio.json"))
  if gpioConfig = invalid then
    print("gpio.json missing or unparseable; writing defaults.")
    gpioConfig = defaults
    needsWrite = true
  else
    if not isValidGPIOPin(gpioConfig.captionsPin) then
      print("gpio.json captionsPin invalid; using default 1.")
      gpioConfig.addReplace("captionsPin", defaults.captionsPin)
      needsWrite = true
    end if
    if not isValidGPIOPin(gpioConfig.triggerPin) then
      print("gpio.json triggerPin invalid; using default 0.")
      gpioConfig.addReplace("triggerPin", defaults.triggerPin)
      needsWrite = true
    end if
    if gpioConfig.startEdge <> "down" and gpioConfig.startEdge <> "up" then
      print("gpio.json startEdge invalid; using default 'down'.")
      gpioConfig.addReplace("startEdge", defaults.startEdge)
      needsWrite = true
    end if
    if not isValidGPIOBoolean(gpioConfig.stopOnOppositeEdge) then
      print("gpio.json stopOnOppositeEdge invalid; using default true.")
      gpioConfig.addReplace("stopOnOppositeEdge", defaults.stopOnOppositeEdge)
      needsWrite = true
    end if
  end if

  if needsWrite then
    WriteAsciiFile("gpio.json", FormatJSON(gpioConfig))
  end if

  return gpioConfig
end function

function isValidGPIOPin(value)
  if value = invalid then return false
  valType = type(value)
  if valType <> "Integer" and valType <> "roInt" and valType <> "roInteger" then
    return false
  end if
  return value >= 0 and value <= 7
end function

function isValidGPIOBoolean(value)
  if value = invalid then return false
  valType = type(value)
  return valType = "Boolean" or valType = "roBoolean"
end function

function handleGPIO()
  if not m.parent.gpioEnabled then return invalid

  msg = m.messagePort.GetMessage()
  if msg = invalid then return invalid

  msgType = type(msg)
  if msgType <> "roControlDown" and msgType <> "roControlUp" then return invalid

  pin = msg.GetInt()

  ' Trigger pin must respond regardless of clock.state so we can stop mid-playback.
  if m.triggerEnabled and pin = m.triggerPin and m.parent.config.syncMode = "gpiotriggered" then
    if msgType = m.startEdgeType then
      if m.parent.transportState = "idle" then
        print("GPIO trigger: start edge on pin "+pin.toStr()+"; moving transport to 'starting'.")
        m.parent.transportState = "starting"
      else
        print("GPIO trigger: start edge ignored (transportState='"+m.parent.transportState+"').")
      end if
    else if msgType = m.stopEdgeType then
      if not m.stopOnOppositeEdge then
        print("GPIO trigger: stop edge on pin "+pin.toStr()+" ignored (stopOnOppositeEdge=false; momentary-button mode).")
      else if m.parent.transportState = "starting" or m.parent.transportState = "submitting timestamp" or m.parent.transportState = "waiting to finish" then
        print("GPIO trigger: stop edge on pin "+pin.toStr()+"; moving transport to 'stopping'.")
        m.parent.transportState = "stopping"
      else
        print("GPIO trigger: stop edge ignored (transportState='"+m.parent.transportState+"').")
      end if
    end if
    return invalid
  end if

  ' Captions pin retains the original sync-window guard so subtitle toggles don't disturb critical timing.
  if pin = m.captionsPin and m.parent.clock.state = "idle" then
    if msgType = "roControlDown" then
      m.parent.subtitler.activate()
    else if msgType = "roControlUp" then
      m.parent.subtitler.deactivate()
    end if
  end if
end function
