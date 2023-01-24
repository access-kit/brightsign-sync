function createSubtitler(parent)
  print("Initializing subtitler...")
  subtitler = createObject("roAssociativeArray")

  ' Widget Creation
  videoMode = createObject("roVideoMode")
  widthFraction = 0.8
  xAnchor = videoMode.getSafeX()+videoMode.getSafeWidth()*(1.0-widthFraction)/2.0
  yAnchor = videoMode.GetSafeY()+videoMode.GetSafeHeight()-170
  width = widthFraction*videoMode.getSafeWidth()
  height = 160
  subtitleRectangle = createObject("roRectangle",xAnchor,yAnchor,width,height)
  params = {Alignment:1, TextMode:2, PauseTime:0, LineCount:2}

  subtitleWidget = createObject("roTextWidget",subtitleRectangle,2,2,params) ' lines, mode, pausetime
  subtitleWidget.setBackgroundColor(&Ha0000000)
  subtitleWidget.setForegroundColor(&Hffffffff)

  subtitler.rect = subtitleRectangle
  subtitler.widget = subtitleWidget
  subtitler.activationState = "inactive"   ' 'starting' | 'inactive' | 'active'
  subtitler.thresholdState = "waitingToCrossNextStart"
  subtitler.update = subtitleMachine
  subtitler.activate = activateSubtitles
  subtitler.deactivate = deactivateSubtitles
  subtitler.video = parent.video ' ref to parent engine's roVideoPlayer
  subtitler.parent = parent ' ref to parent engine
  subtitler.currentIndex = 0
  subtitler.determineCurrentIndex = determineCurrentIndex

  ' TODO: Make sure it does not cause crashes for unregistered players or missing subtitles
  subtitler.srtFetcher = createObject("roUrlTransfer")
  subtitler.srtFetcher.setUrl(parent.config.syncUrl+"/api/mediaplayer/"+parent.id.toStr()+"?includeSubtitles=true")
  subtitler.srtResponse = createObject("roMessagePort")
  subtitler.srtFetcher.setPort(subtitler.srtResponse)
  subtitler.fetchSubtitles = fetchSubtitles
  subtitler.fetchSubtitles()
  print("Subtitler initialized.")


  ' TODO: Decide the write flow for updating subtitles file
  return subtitler
end function 

function fetchSubtitles()
  print("Fetching subtitles...")
  m.srtFetcher.asyncGetToString()
  res = m.srtResponse.waitMessage(1000)
  if res <> invalid then
    if res.getResponseCode() = 200 then
      data = parseJSON(res.getString())
      ' TODO: Check if subtitls are 
      if data.work <> invalid
        if data.work.parsedSrts.count() = 0
          m.events = createDefaultSubtitles()
          print("Found work, but no subtitles available.")
        else
          parsedSrt = data.work.parsedSrts[0]
          WriteAsciiFile("subtitles.json",FormatJSON(parsedSrt))
          m.events = parsedSrt
          print("Found subtitles.")
        end if
      else 
          m.events = createDefaultSubtitles()
          print("No subitles found (no work associated with this mediaplayer)")
      end if
    else 
      print("Error in request to get subtitles (possibly missing work)")
      m.events = createDefaultSubtitles()
    end if
  else
    print("Invalid response when fetching subtitles (possibly a network eror)")
    m.events = createDefaultSubtitles()
  end if
  if m.events.count() <= m.currentIndex
    m.widget.hide()
    m.widget.clear()
    m.thresholdState = "waitingToFinishLoop"
  end if
  m.determineCurrentIndex()
end function

function createDefaultSubtitles()
  event = createObject("roAssociativeArray")
  event.id = 0
  event.start = 0
  event.end = 10
  event.text = "No captions available."
  parsedSrt = createObject("roArray", 1, true)
  parsedSrt.push(event)
  WriteAsciiFile("subtitles.json", FormatJSON(parsedSrt))
  return parsedSrt
end function

function subtitleMachine()
  if m.activationState = "starting" then
    print("starting up onscreen subtitles!")
    m.determineCurrentIndex()
    m.activationState = "active"
  else if m.activationState = "active" then
    if m.thresholdState = "waitingToCrossNextStart" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].start*1000 then
        m.widget.clear()
        m.widget.pushString(m.events[m.currentIndex].text)
        m.widget.show()
        m.thresholdState = "waitingToCrossNextEnd"
      end if
    else if m.thresholdState = "waitingToCrossNextEnd" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].end*1000 then
        m.widget.hide()
        m.widget.clear()
        if m.currentIndex = m.events.count()-1 then
          m.thresholdState = "waitingToFinishLoop"
        else
          m.currentIndex = m.currentIndex + 1
          m.thresholdState = "waitingToCrossNextStart"
        end if
      end if
    else if m.thresholdState = "waitingToFinishLoop" then
      if m.video.getPlaybackPosition() < m.events[m.currentIndex].end*1000 then
        m.currentIndex = 0
        m.thresholdState = "waitingToCrossNextStart"
        ' if m.parent.config.autoShutoffSubtitles then
        '   m.deactivate()
        ' end if
      end if
    end if
  else if m.activationState = "inactive"
  end if
end function

function activateSubtitles()
  if m.activationState = "inactive"
    m.widget.clear()
    m.widget.show()
    m.activationState = "starting" 
  end if
end function

function deactivateSubtitles()
  if m.activationState <> "inactive"
    m.widget.clear()
    m.widget.hide()
    m.activationState = "inactive"
  end if
end function

function determineCurrentIndex()
  m.currentIndex = 0
  currentTime = m.video.getPlaybackPosition()
  while m.currentIndex < m.events.count()-1
    if currentTime < m.events[m.currentIndex].end*1000
      print("Subtitles activating at index"+m.currentIndex.toStr())
      EXIT WHILE
    end if
    m.currentIndex = m.currentIndex + 1 
  end while
  m.thresholdState = "waitingToCrossNextStart"
  if m.currentIndex = m.events.count()-1 and currentTime > m.events[m.currentIndex].end*1000 then
    m.thresholdState = "waitingToFinishLoop"
  end if


end function