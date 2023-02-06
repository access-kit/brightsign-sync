function createTimelineManager(parent)
  print("Initializing timeline manager...")
  timelineManager = createObject("roAssociativeArray")

  timelineManager.activationState = "starting"
  timelineManager.thresholdState = "waitingToCrossNextStart"
  timelineManager.update = eventMachine
  timelineManager.parent = parent ' ref to parent engine
  timelineManager.currentIndex = 0
  timelineManager.determineCurrentIndex = determineTimelineCurrentIndex

  ' TODO: Make sure it does not cause crashes for unregistered players or missing timeline
  timelineManager.eventFetcher = createObject("roUrlTransfer")
  timelineManager.sourceUrl = parent.config.syncUrl+"/api/mediaplayer/"+parent.id.toStr()+"/events?password="+parent.password
  timelineManager.eventFetcher.setUrl(timelineManager.sourceUrl)
  timelineManager.eventResponse = createObject("roMessagePort")
  timelineManager.eventFetcher.setPort(timelineManager.eventResponse)
  timelineManager.fetchEvents = fetchEvents 

  timelineManager.video = parent.video

  timelineManager.controlPort = createObject("roControlPort", "BrightSign")

  timelineManager.enabled = true
  timelineManager.fetchEvents()


  print("Timeline manager initialized.")
  return timelineManager
end function 

function fetchEvents()
  if m.enabled<>true
    m.events = []
  else 
    m.eventFetcher.asyncGetToString()
    res = m.eventResponse.waitMessage(1000)
    if res <> invalid then
      if res.getResponseCode() = 200 then
        data = parseJSON(res.getString())
        if data <> invalid
          m.events = data
          for each event in m.events
            if event.gpio <> invalid
              if event.gpio.pin >= 2 or event.gpio.pin <= 7
                print("Setting up gpio pin "+str(event.gpio.pin)+" as ouput.")
                m.controlPort.enableOutput(event.gpio.pin)
              else
                print("Will not use event since it is an invalid pin number. PIN: "+str(event.gpio.pin))
              end if
            end if
          end for
        else 
            print("No events found.")
            m.events = []
        end if
      else 
        print("Error in request to get events")
        m.events = []
      end if
    else
      print("Invalid response when fetching events (possibly a network eror)")
      m.events = []
    end if
  end if
  if m.events.count() <= m.currentIndex
    m.thresholdState = "waitingToFinishLoop"
  end if
  if m.events.count() > 0
    newEvents = []
    for each event in m.events
      if event.timestamp < m.parent.duration - 2000
        newEvents.push(event)
      else
        print("Removing event with id "+str(event.id)+" because it is within 2s of the end of the video file, or after the end.")
      end if
    end for
    m.events = newEvents
  end if
  m.determineCurrentIndex()
end function

function eventMachine()

  if m.enabled<>true or m.events.count() = 0
    return false
  end if
  if m.activationState = "starting" then
    print("starting up timeline event handler!")
    m.determineCurrentIndex()
    m.activationState = "active"
  else if m.activationState = "active" then
    if m.thresholdState = "waitingToCrossNextStart" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].timestamp then
        event = m.events[m.currentIndex]
        if (event.raw <> invalid)
          eventConfig = createObject("roAssociativeArray")
          eventConfig.type = "raw"
          eventConfig.code = event.raw.code
          m.parent.handleRawOrCommand(eventConfig)
        end if
        if (event.cmd <> invalid)
          ' TODO: allow payloads
          eventConfig = createObject("roAssociativeArray")
          eventConfig.type = "command"
          eventConfig.code = event.cmd.command
          m.parent.handleRawOrCommand(eventConfig)
        end if
        if (event.udp <> invalid)
          targetIp = event.udp.ip
          targetPort = event.udp.port 
          message = "{"+chr(34)+"message"+chr(34)+": "+chr(34)+"no message"+chr(34)+"}"
          if event.udp.payload <> invalid
            message =event.udp.payload
            m.parent.udpSocket.sendTo(targetIp, targetPort, message)
          end if
        
        end if
        if (event.gpio <> invalid)
          if event.gpio.pin >= 2 or event.gpio.pin <= 7
            m.controlPort.setOutputState(event.gpio.pin, event.gpio.state)
          end if
        end if
        if (event.osc <> invalid)
          ' TODO: Handle OSC sends
        end if
        if m.currentIndex = m.events.count()-1 then
          m.thresholdState = "waitingToFinishLoop"
        else
          m.currentIndex = m.currentIndex + 1
          m.thresholdState = "waitingToCrossNextStart"
        end if
      end if
    else if m.thresholdState = "waitingToFinishLoop" then
      if m.video.getPlaybackPosition() < m.events[m.currentIndex].timestamp then
        m.currentIndex = 0
        m.thresholdState = "waitingToCrossNextStart"
      end if
    end if
  else if m.activationState = "inactive"
  end if
end function


function determineTimelineCurrentIndex()
  m.currentIndex = 0
  currentTime = m.video.getPlaybackPosition()
  while m.currentIndex < m.events.count()-1
    if currentTime < m.events[m.currentIndex].timestamp then
      print("Timeline events activating at index"+m.currentIndex.toStr())
      EXIT WHILE
    end if
    m.currentIndex = m.currentIndex + 1 
  end while
  m.thresholdState = "waitingToCrossNextStart"
  if m.currentIndex = m.events.count()-1 and currentTime > m.events[m.currentIndex].timestamp then
    m.thresholdState = "waitingToFinishLoop"
  end if
end function