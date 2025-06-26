function createSubtitler(parent)
  print("Initializing subtitler...")
  subtitler = createObject("roAssociativeArray")

  ' Widget Creation
  videoMode = createObject("roVideoMode")
  widthFraction = 0.8
  xAnchor = videoMode.getSafeX()+videoMode.getSafeWidth()*(1.0-widthFraction)/2.0
  yAnchor = videoMode.GetSafeY()+videoMode.GetSafeHeight()-180
  width = widthFraction*videoMode.getSafeWidth()
  height = 170
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
  subtitler.sourceUrl = parent.config.syncUrl+"/api/mediaplayer/"+parent.id.toStr()+"?includeSubtitles=true"
  subtitler.srtFetcher.setUrl(subtitler.sourceUrl)
  subtitler.srtResponse = createObject("roMessagePort")
  subtitler.srtFetcher.setPort(subtitler.srtResponse)
  subtitler.fetchSubtitles = fetchSubtitles

  subtitler.htmlPort = createObject("roMessagePort")
  htmlConfig = {
    url: "file:/SD:/subtitles.html",
    port: subtitler.htmlPort,
    brightsign_js_objects_enabled: true,
    nodejs_enabled: true
  }
  subtitler.htmlWidget = createObject("roHtmlWidget", subtitleRectangle, htmlConfig)
  loadingError = false
  while true
    msg = subtitler.htmlPort.waitMessage(10000)
    if msg <> invalid 
      eventData = msg.getData()
      if type(eventData) = "roAssociativeArray" and type(eventData.reason) = "roString" then
        if eventData.reason = "load-error" then
          print "=== BS: HTML load error: "; eventData.message
          loadingError = true
          exit while
        else if eventData.reason = "load-finished" then
          print "=== BS: Received load finished"
          loadingError = false
          exit while
        end if
      end if
    end if
  end while
  subtitler.enabled = loadingError<>true
  subtitler.fetchSubtitles()

  print("Subtitler initialized.")
  return subtitler
end function 

function fetchSubtitles()
  m.events = createDefaultSubtitles()
  if m.enabled<>true then
    print("Not enabled, using default subtitles.")
  else 
    m.srtFetcher.asyncGetToString()
    res = m.srtResponse.waitMessage(5000)
    if res <> invalid and res.getResponseCode() = 200 then
      data = ParseJSON(res.getString())
      ' determine which subtitles to use
      if data.work <> invalid then
        if data.work.parsedSrts <> invalid then
          if data.work.parsedSrts.count() = 0 then
            print("Found work, but no subtitles available, using default subtitles.")
          else
            parsedSrtIndex = invalid  
            if m.parent.config.onScreenSubtitlesShortDescriptor = invalid then
              print("No short descriptor set for subtitles, using first available.")
              parsedSrtIndex = 0
            else
              for cursor = 0 to data.work.srts.count() - 1
                if data.work.srts[cursor].shortDescriptor = m.parent.config.onScreenSubtitlesShortDescriptor then
                  print("Using subtitles " + cursor.toStr() + ": " + data.work.srts[cursor].shortDescriptor)
                  parsedSrtIndex = cursor
                end if
              end for
            end if
            if parsedSrtIndex = invalid then
              print("No matching srt lang code, falling back to 0th srt.")
              parsedSrtIndex = 0
            end if
            m.events = data.work.parsedSrts[parsedSrtIndex]
          end if
        else
          print("Found work, but no multilingual subtitles delivered.  API endpoint not yet upgraded. Using default subtitles.")
        end if
      else 
          print("No subitles found (no work associated with this mediaplayer), using default subtitles.")
      end if
    else
      print("Invalid response when fetching subtitles (possibly a network error or missing work).")
      subtitleString = ReadAsciiFile("subtitles.json")
      if subtitleString <> "" then
          events = ParseJSON(subtitleString)
          if events <> invalid then 
            print("Falling back to subtitles.json saved on SD card.")
            m.events = events 
          else
            print("Could not parse subtitles.json from SD card, using default subtitles.")
          end if
      else
        print("Could not read subtitles.json from SD card, using default subtitles.")
      end if
    end if
  end if

  ' Send subtitles to html widget and write to file in case of network loss
  subtitleString = FormatJSON(m.events)
  WriteAsciiFile("subtitles.json", subtitleString)
  m.htmlWidget.postJsMessage({
    code: "load-subtitles",
    events: subtitleString 
  })

  if m.events.count() <= m.currentIndex then
    m.htmlWidget.hide()
    m.thresholdState = "waitingToFinishLoop"
  end if
  m.determineCurrentIndex()
end function

function createDefaultSubtitles()
  event = createObject("roAssociativeArray")
  event.id = 0
  event.start = 0
  event.end = 50
  event.text = "No captions available."
  parsedSrt = createObject("roArray", 1, true)
  parsedSrt.push(event)
  return parsedSrt
end function

function subtitleMachine()
  if m.enabled<>true then
    return false
  end if
  if m.activationState = "starting" then
    print("starting up onscreen subtitles!")
    m.determineCurrentIndex()
    m.activationState = "active"
  else if m.activationState = "active" then
    if m.thresholdState = "waitingToCrossNextStart" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].start*1000 then
        m.htmlWidget.postJsMessage({id: m.currentIndex, code: "subtitle-index"})
        m.htmlWidget.show()
        m.thresholdState = "waitingToCrossNextEnd"
      end if
    else if m.thresholdState = "waitingToCrossNextEnd" then
      if m.video.getPlaybackPosition() >= m.events[m.currentIndex].end*1000 then
        m.htmlWidget.hide()
        m.htmlWidget.postJsMessage({code: "clear"})
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
  else if m.activationState = "inactive" then
    ' Do nothing when inactive
  end if
end function

function activateSubtitles()
  if m.enabled = true then
    m.fetchSubtitles()
  end if
  if m.activationState = "inactive" then
    m.htmlWidget.show()
    m.activationState = "starting" 
  end if
end function

function deactivateSubtitles()
  if m.activationState <> "inactive" then
    m.htmlWidget.hide()
    m.htmlWidget.postJsMessage({code: "clear"})
    m.activationState = "inactive"
  end if
end function

function determineCurrentIndex()
  m.currentIndex = 0
  currentTime = m.video.getPlaybackPosition()
  while m.currentIndex < m.events.count()-1
    if currentTime < m.events[m.currentIndex].end*1000 then
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

function stringToAscii(thestring)
  charCount = len(thestring)
  parsedChars = createObject("roArray", 1, true)
  for i = 1 to charCount
    character = right(left(thestring, i ), 1)
    print(character)
    print(asc(character))
    parsedChars.push(asc(character))
  end for
  print(parsedChars)
end function
