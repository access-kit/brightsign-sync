LIBRARY "syncPlayer.brs"

print "Starting up the show!"

url = "http://samwolk.info/reneSeminar/index.php"
password = "FlatwingHollanderWhitney555"
id = "rene"
mediaPath = "rene_film.mov"
player = createSyncPlayer(id,mediaPath,url,password)
print "Sync Player Initialized!"

player.video.play()
sleep(30)
player.lastCycleStartedAt = player.clock.getEpochAsMSString()
player.submitTimestamp()
print "Film has begun!"

print "Skipping ahead in time..."
player.video.seek(player.video.getDuration()-30000)
print "New location: " , player.video.getPlaybackPosition()


oldPosition = -1
while True
  ' Check for timecode events
  event = player.videoPort.getMessage()
  if event <> invalid
    ' Check what type of event it is
    if event.getInt() = 8
      print "Film finished without looping!  Uh-oh..."
    else if event.getInt() = 12 ' timecode event
      if event.getData() = 1
        print "Film finishing in ~20s"
        player.clock.ntpSync()
      end if
    end if
  end if


  newPosition = player.video.getPlaybackPosition()
  if newPosition < oldPosition
    sleep(30)
    player.lastCycleStartedAt = player.clock.getEpochAsMSString()
    player.submitTimestamp()
    print "Film just looped!"
    print "Old Position", oldPosition
    print "New Position",newPosition
  end if
  oldPosition = newPosition

end while
