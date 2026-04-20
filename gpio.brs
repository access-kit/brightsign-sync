function createGPIOManager(parent)
  print("Configuring GPIO Manager")

  gpioManager = createObject("roAssociativeArray")
  gpioManager.parent = parent
  gpioManager.controlPort = createObject("roControlPort", "BrightSign")
  gpioManager.messagePort = createObject("roMessagePort")
  gpioManager.controlPort.setPort(gpioManager.messagePort)

  ' Pin 1 is the onboard button and is always enabled for the subtitle toggle.
  gpioManager.controlPort.enableInput(1)

  ' Configure a start-trigger pin for "gpiotriggered" syncMode.
  gpioManager.triggerPin = -1
  gpioManager.triggerEdge = "down"
  if parent.config.syncMode = "gpiotriggered" then
    requestedPin = parent.config.gpioTriggerPin
    if requestedPin <> invalid and requestedPin >= 2 and requestedPin <= 7 then
      print("Enabling GPIO trigger pin "+requestedPin.toStr()+" for gpiotriggered syncMode.")
      gpioManager.controlPort.enableInput(requestedPin)
      gpioManager.triggerPin = requestedPin
      if parent.config.gpioTriggerEdge <> invalid then
        gpioManager.triggerEdge = parent.config.gpioTriggerEdge
      end if
      print("GPIO trigger edge: "+gpioManager.triggerEdge)
    else
      print("Invalid gpioTriggerPin for gpiotriggered syncMode; expected an integer in [2,7].")
    end if
  end if

  gpioManager.handle = handleGPIO

  return gpioManager

end function

function handleGPIO()
  if m.parent.gpioEnabled then
    msg = m.messagePort.GetMessage()
    if msg <> invalid then
      msgType = type(msg)
      if msgType = "roControlDown" or msgType = "roControlUp" then
        pin = msg.getInt()

        ' GPIO-triggered playback start: only fires in "gpiotriggered" syncMode,
        ' on the configured pin, when the configured edge is observed, and only
        ' while the transport is idle (so a trigger during playback cannot
        ' interrupt or re-fire playback mid-loop).
        handledAsTrigger = false
        if m.parent.config.syncMode = "gpiotriggered" and pin = m.triggerPin then
          edgeMatches = false
          if m.triggerEdge = "down" and msgType = "roControlDown" then
            edgeMatches = true
          end if
          if m.triggerEdge = "up" and msgType = "roControlUp" then
            edgeMatches = true
          end if
          if edgeMatches then
            handledAsTrigger = true
            if m.parent.transportState = "idle" then
              print("GPIO trigger fired on pin "+pin.toStr()+" ("+m.triggerEdge+") - starting playback.")
              m.parent.transportState = "starting"
            else
              print("GPIO trigger fired on pin "+pin.toStr()+" but transportState is '"+m.parent.transportState+"' - ignoring.")
            end if
          end if
        end if

        ' Onboard-button subtitle toggle (pin 1) - unchanged behavior across all syncModes.
        if not handledAsTrigger and pin = 1 and m.parent.clock.state = "idle" then
          if msgType = "roControlDown" then
            m.parent.subtitler.activate()
          else if msgType = "roControlUp" then
            m.parent.subtitler.deactivate()
          end if
        end if
      end if
    end if
  end if
end function
