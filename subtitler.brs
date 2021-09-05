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
  subtitler.machine = subtitleMachine
  subtitler.activate = activateSubtitles
  subitlter.deactivate = deactivateSubtitles
  subtitler.video = m.video ' ref to parent engine's roVideoPlayer
  subtitler.parent = m ' ref to parent engine
  subtitler.currentIndex = 0

  if m.config.useSubtitles then
    m.downloadRequest.setUrl(m.apiEndpoint+"/work/"+config.workID.toInt()+"/parsedSrt")
    m.downloadRequest.asyncGetToString()
    res = m.downloadResponsePort.waitMessage(3000)
    if res <> invalid then
      if res.responseCode = 200 then
        workData = parseJSON(res.getString())
        parsedSrt = workData.parsedSrt
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
      end if
    end if
  else if m.activationState = "inactive"
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