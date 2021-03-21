LIBRARY "time.brs"

function createSyncPlayer( id as String, videopath as String, url as String, password as String) as Object
  player = createObject("roAssociativeArray")
  player.id = id
  player.password = password

  player.request = createObject("roUrlTransfer")
  player.request.setUrl(url)
  player.responsePort = createObject("roMessagePort")
  player.request.setPort(player.responsePort)
  player.submitTimestamp = submitTimestamp

  ' Create a clock and sync it
  player.clock = createClock(url,password)

  player.video = createObject("roVideoPlayer")
  player.videoPort = createObject("roMessagePort")
  player.video.setPort(player.videoPort)
  player.video.setLoopMode(true) ' Should be "seamlessloopornotatall"
  player.video.setViewMode(1) ' centered and letterboxed
  player.video.setVolume(15) ' see config stuff in master from zachpoff
  player.mode = CreateObject("roVideoMode")
  player.mode.setMode("auto")
  player.video.preloadFile(videopath)

  ok = player.video.addEvent(1, player.video.getDuration() - 20000) ' Throw an event for resynchronization 20s before film end
  sleep(5000) ' Pause to make sure video is fully loaded.
  return player
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
