LIBRARY "time.brs"

function createSyncPlayer( id as String, videopath as String, url as String, password as String) as Object
  player = createObject("roAssociativeArray")
  player.id = id
  player.videopath = videopath



  ' Set up the sync API communications
  player.url = url
  player.password = password
  player.request = createObject("roUrlTransfer")
  player.request.setUrl(url)
  player.responsePort = createObject("roMessagePort")
  player.request.setPort(player.responsePort)

  ' Give the player methods
  player.submitTimestamp = submitTimestamp
  player.markLocalStart = markLocalStart
  player.loop = loop
  player.seek = seek

  ' Video timing fields
  player.lastCycleStartedAt = 0
  player.duration = 0

  ' Screen resolution settings
  player.mode = CreateObject("roVideoMode")
  player.mode.setMode("auto")

  ' Create a clock and sync it
  player.clock = createClock(url,password)
  player.videos = createObject("roArray",2,false)
  player.videoPort = createObject("roMessagePort")
  player.activeVideo = -1

  player.rect1 = createObject("roRectangle", 0,0,500,500)
  player.rect2 = createObject("roRectangle", 500,500,500,500)


  ' Init the first copy of video
  videoA = createObject("roVideoPlayer")
  videoA.setPort(player.videoPort)
  videoA.setViewMode(1) ' centered and letterboxed
  videoA.setVolume(15) ' see config stuff in master from zachpoff
  videoA.setRectangle(player.rect1)
  print "Loading copy A of video file..."
  print "Preload copy A:", videoA.preloadFile(videopath)
  ok = videoA.addEvent(1, videoA.getDuration() - 20000) ' Throw an event for resynchronization 20s before film end

  ' Init the second copy of video
  videoB = createObject("roVideoPlayer")
  videoB.setPort(player.videoPort)
  videoB.setViewMode(1) ' centered and letterboxed
  videoB.setVolume(15) ' see config stuff in master from zachpoff
  videoB.setRectangle(player.rect2)
  print "Loading copy 2 of video file..."
  print "Preload copy B:", videoB.preloadFile("rene_film.mp4")
  ok = videoB.addEvent(1, videoB.getDuration() - 20000) ' Throw an event for resynchronization 20s before film end

  player.duration = videoA.getDuration()-500 ' TODO: See if you can make this a little later.

  ' Store references to loaded videos in array.
  player.videos.setEntry(0,videoA)
  player.videos.setEntry(1,videoB)


  return player
end function

function markLocalStart()
  m.lastCycleStartedAt = m.clock.getEpochAsMSString()
end function

function submitTimestamp() as String
  postString = "password="+m.request.escape(m.password)+"&"
  postString = postString+"timestamp="+m.request.escape("let timestamp="+m.clock.synchronizeTimestamp(m.lastCycleStartedAt))+"&"
  postString = postString+"timestampJSON="+m.request.escape("{"+chr(34)+"timestamp"+chr(34)+":"+m.clock.synchronizeTimestamp(m.lastCycleStartedAt)+"}")
  m.request.asyncPostFromString(postString)
  response = m.responsePort.waitMessage(0)
  response = response.getString()
  return response
end function

function loop()
  print "Beginning seamless synchronized looping..."
  while true
    ' Switch the foreground and the background player
    m.activeVideo = int((m.activeVideo+1) mod 2)
    foregroundPlayer = m.videos[m.activeVideo]
    backgroundPlayer = m.videos[int((m.activeVideo+1) mod 2)]
    backgroundPlayer.pause()
    backgroundPlayer.hide()
    foregroundPlayer.show()
    ' Start the foreground player and send the timestamp to server
    foregroundPlayer.play()
    sleep(30) ' TODO: DEAL WITH THIS MAGIC NUMBER!!
    m.markLocalStart()
    m.submitTimestamp()
    print "New loop just started."
    backgroundPlayer.seek(0)


    ' wait until 20s before the end, then resynchronize to the server
    while (foregroundPlayer.getPlaybackPosition() < m.duration-20000):
      sleep(5) ' wait
    end while
    print "NTP sync beginning..."
    m.clock.ntpSync()
    ' wait until the end of the file
    print "NTP sync completed."
    while (foregroundPlayer.getPlaybackPosition() < m.duration):
      sleep(5) ' wait
    end while
  end while
end function

function seek(ms as Integer) as void
  foregroundPlayer = m.videos[m.activeVideo]
  foregroundPlayer.seek(ms)
end function
