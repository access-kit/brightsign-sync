function createSubtitler()
  subtitler = createObject("roAssociativeArray")

  ' Widget Creation
  videoMode = createObject("roVideoMode")
  xAnchor = videoMode.getSafeX()+10
  yAnchor = videoMode.GetSafeY()+videoMode.GetSafeHeight()+90
  width = videoMode.getSafeWidth()-20
  height = 80
  subtitleRectangle = createObject("roRectangle",xAnchor,yAnchor,width,height)
  subtitleWidget = createObject("roTextWidget",subtitleRectangle,2,2,0) ' lines, mode, pausetime

  subtitler.rect = subtitleRectangle
  subtitler.widget = subtitleWidget
  subtitler.activationState = "inactive"
  subtitler.thresholdState = "waitingToCrossNextStart"
  subtitler.update = subtitleMachine
  subtitler.activate = activateSubtitles
  subitlter.deactivate = deactivateSubtitles
  subtitler.video = m.video ' ref to parent engine's roVideoPlayer
  subtitler.parent = m ' ref to parent engine
  subtitler.currentIndex = 0
  subtitler.metronome = createObject("roTimer") ' for polling 
  subtitler.metronomeTrigger = createObject("roMessagePort") ' Port which will receive events to trigger get requests
  subtitler.metronome.setPort(subtitler.metronomeTrigger)
  subtitler.metronome.setElapsed(10)

  ' Set up polling for subtitle toggling
  subtitler.statePoller = createObject("roUrlTransfer")
  subtitler.statePoller.setUrl(m.apiEndpoint+"/work")
  subtitler.statePollerResponsePort = createObject("roMessagePort")
  subtitler.statePoller.setPort(subtitler.statePollerResponsePort)
  subtitler.pollingState = "waitingToPoll"

  if m.config.updateSubtitles then
    m.apiRequest.setUrl(m.apiEndpoint+"/work")
    m.apiRequest.asyncGetToString()
    res = m.apiRequest.waitMessage(3000)
    if res <> invalid then
      if res.responseCode = 200 then
        data = parseJSON(res.getString())
        parsedSrt = data.work.parsedSrt
        WriteAsciiFile("subtitles.json",FormatJSON(parsedSrt))
        subtitler.events = parsedSrt
      else 
        subtitler.events = ParseJSON(ReadAsciiFile("subtitles.json"))
      end if
    else
      subtitler.events = ParseJSON(ReadAsciiFile("subtitles.json"))
    end if
  end if
  return subtitler
end function 

function subtitleMachine()
  if m.activationState = "starting" then
    m.determineCurrentIndex()
    m.activationState = "active"
  else if m.activationState = "active" then
    if m.thresholdState = "waitingToCrossNextStart" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].start then
        m.widget.pushString(m.events[m.currentIndex].text)
        m.thresholdState = "waitingToCrossEnd"
      end if
    else if m.thresholdState = "waitingToCrossNextEnd" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].end then
        m.widget.clear()
        if m.currentIndex = m.events.count()-1 then
          m.thresholdState = "waitingToFinishLoop"
        else
          m.currentIndex = m.currentIndex + 1
          m.thresholdState = "waitingToCrossNextStart"
        end if
      end if
    else if m.thresholdState = "waitingToFinishLoop" then
      if m.video.getPlaybackPosition() < m.events[currentIndex].end then
        m.currentIndex = 0
        m.thresholdState = "waitingToCrossNextStart"
        if m.parent.config.autoShutoffSubtitles then
          m.deactivate()
        end if
      end if
    end if
  else if m.activationState = "inactive"
  end if

  ' subtitle state polling engine
  if m.parent.config.pollForSubtitleState then
    if and m.video.getPlaybackPosition() > 1000 or m.video.getPlaybackPosition < m.parent.duration - 30000 then
      if m.pollingState = "waitingToPoll"
        msg = m.metronomeTrigger.getMessage()
        if msg <> invalid then
          m.statePoller.asyncGetToString()
          m.metronome.setElapsed(1)
        end if
        m.pollingState = "waitingForResponse"
      else if m.pollingState = "waitingForResponse"
        msg = m.statePollerResponsePort.getMessage()
        if msg <> invalid
          if msg.responseCode = 200 then
            data = ParseJSON(msg.getString())
            if data.onScreenSubtitles then
              m.activateSubtitles()
            else
              m.deactivateSubtitles()
            end if
          end if
        end if
      end if

    else 
      ' block api requests during critical sync windows
    end if
  end if
end function

function activateSubtitles()
  m.widget.clear()
  m.widget.show()
  m.activationState = "starting"
end function

function deactivateSubtitles()
  m.widget.clear()
  m.widget.hide()
  m.activationState = "inactive"
end function