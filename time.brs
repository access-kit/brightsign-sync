' Clock Constructor
function createClock(_syncURL as String, _password as String) as Object
  ' Init object
  timer = createObject("roAssociativeArray")

  ' Give it timer objects
  timer.systemClock = createObject("roSystemTime")
  timer.startupTime = timer.systemClock.getLocalDateTime()
  timer.startupTime.subtractMilliseconds(timer.startupTime.getMillisecond())
  timer.elapsedTime = createObject("roTimeSpan")
  timer.elapsedTime.mark()

  ' Create a secondary timer for convenience performance measurements
  timer.perfCounter = createObject("roTimeSpan")
  timer.markStart = markStart
  timer.markElapsed = markElapsed

  ' Give it timing functions
  timer.getEpoch = getEpoch
  timer.getEpochAsMSString = getEpochAsMSString
  timer.getTimeDiff = getTimeDiff

  ' Give it a sync destination and an initial offset
  timer.request = createObject("roUrlTransfer")
  timer.apiEndpoint = _syncURL+"/api/sync"
  timer.responsePort = createObject("roMessagePort")
  timer.request.setPort(timer.responsePort)
  timer.password = _password
  timer.serverTimeOffset = 0
  timer.syncResponses = 0
  timer.ntpSyncCycles = 20

  ' Give it NTP functions
  timer.calculateOffset = calculateOffset
  timer.ntpSync = ntpSync
  timer.synchronizeTimestamp = synchronizeTimestamp

  ' Run an initial sync and get the clock into the same range
  ' Then calculate the new difference
  timer.ntpSync()
  timer.startupTime.addMilliseconds(timer.serverTimeOffset)
  timer.ntpSync()

  return timer
end function

function markStart() as void
  m.perfCounter.mark()
end function

function markElapsed() as Integer
  return m.perfCounter.totalMilliseconds()
end function


' Get epoch as table with separate seconds and ms
function getEpoch() as Object
  epoch = {seconds:m.startupTime.toSecondsSinceEpoch()+m.elapsedTime.totalSeconds(), milliseconds:(m.elapsedTime.totalMilliseconds() - (m.elapsedTime.totalSeconds()*1000))}
  return epoch
end function

' Get epoch as a ms string
function getEpochAsMSString() as String
  epochTable = m.getEpoch()
  ms = box(epochTable.milliseconds.toStr())
  ' Pad ms with leading zeros
  while ms.len() < 3
    zero = box("0")
    zero.appendString(ms,ms.len())
    ms.setString(zero,zero.len())
  end while
  ' Combine epoch ms with s
  seconds = box(epochTable.seconds.toStr())
  seconds.appendString(ms,3)
  ms = seconds
  return ms
end function

' Get the difference between two timestamps in ms
function getTimeDiff(time1 as String, time2 as String) as Integer ' NB: Assumes time diff is < 32-bit, can be returned as a normal integer
  ' TODO: adapt for using an {int,int} timetable instead of a string for each timestamp
  time1S = time1.left(10).toInt()
  time1MS = time1.right(3).toInt()
  time2S = time2.left(10).toInt()
  time2MS = time2.right(3).toInt()
  sDiff = time1S - time2S
  msDiff = time1MS-time2MS
  diff = sDiff*1000+msDiff
  return diff
end function

' Submit a timestamp to a server
' Use the response to calculate the time difference
function calculateOffset() as Integer
  m.request.setUrl(m.apiEndpoint+"?reqSentAt="+m.getEpochAsMSString())
  m.request.asyncGetToString()
  ' TODO: MAKE ASYNC, WAIT BLOCKS!
  res = m.responsePort.waitMessage(0)
  resReceivedAt = m.getEpochAsMSString()
  response = res.getString()
  tokens = response.tokenize(chr(34)+"{},:")
  reqSentAt = ""
  reqReceivedAt = ""
  resSentAt = ""
  if (tokens[0] = "reqSentAt") then
    reqSentAt = tokens[1]
  else if (tokens[0] = "reqReceivedAt") then
    reqReceivedAt = tokens[1]
  else
    resSentAt = tokens[1]
  end if

  if (tokens[2] = "reqSentAt") then
    reqSentAt = tokens[3]
  else if (tokens[2] = "reqReceivedAt") then
    reqReceivedAt = tokens[3]
  else
    resSentAt = tokens[3]
  end if

  if (tokens[4] = "reqSentAt") then
    reqSentAt = tokens[5]
  else if (tokens[4] = "reqReceivedAt") then
    reqReceivedAt = tokens[5]
  else
    resSentAt = tokens[5]
  endif
  voyageOutTime = m.getTimeDiff(reqReceivedAt,reqSentAt)
  voyageBackTime = m.getTimeDiff(resReceivedAt,resSentAt)
  doubleLatency = voyageOutTime+voyageBackTime
  latency = int((voyageOutTime+voyageBackTime)/2)
  offset = voyageOutTime-latency
  print " "
  print "Local Time Sent:", reqReceivedAt
  print "Response Received:", resReceivedAt
  print "Total Time:",,m.getTimeDiff(resReceivedAt,reqSentAt)
  print "Server Reception Time:", reqReceivedAt
  print "Server Transmission Time:", resSentAt
  print "One-way latency:", voyageOutTime
  print "One-way latency:", voyageBackTime
  print "Average latency:", latency
  return offset
end function

' Adjust the clock object
function ntpSync() as void
  ' Create an empty array to store the offsets in
  offsets = createObject("roArray",0,true)

  ' Accumulate the offsets and calc. average.
  sum = 0
  for i = 0 to m.ntpSyncCycles-1
    offset = m.calculateOffset()
    sum = sum + offset
    offsets.push(offset)
    print "Server Time Offset: " , offset
  end for
  avgOffset = sum/offsets.count()

  ' Standard deviation calculation
  diffsSquaredSum = 0
  for each offset in offsets
    diffsSquaredSum = diffsSquaredSum + (offset-avgOffset)*(offset-avgOffset)
  end for
  stdDev = sqr(diffsSquaredSum/(offsets.count()-1))

  ' Throw out outliers at > 1 std dev.
  validOffsetsCount = 0
  validSum = 0
  for each offset in offsets
    if abs(offset-avgOffset) < stdDev then
      validOffsetsCount = validOffsetsCount +1
      validSum = validSum + offset
    end if
  end for
  avgNoOutliers = int(validSum/validOffsetsCount)

  ' Set the offset accordingly.
  m.serverTimeOffset = avgNoOutliers
end function

function synchronizeTimestamp(timestamp as String) as String
  ' TODO: use a {int,int} to represent timestamp
  input = box(timestamp)
  ' Separate ms and s
  inputS = input.left(10).toInt()
  inputMS = input.right(3).toInt()
  ' Add server time offset to ms
  msSum = inputMS+m.serverTimeOffset
  ' Set up placeholders for final values
  finalS = inputS
  finalMS = msSum
  ' Carry digits if ms add up to more than 1s
  if msSum >= 1000 then
    quotient = int(msSum/1000)
    remainder = int(msSum mod 1000)
    finalS = finalS + quotient
    finalMS = remainder
  end if
  seconds = box(finalS.toStr())
  milliseconds = box(finalMS.toStr())
  ' Pad ms with zeros
  while milliseconds.len() < 3
    zero = box("0")
    zero.appendString(milliseconds,milliseconds.len())
    milliseconds.setString(zero,zero.len())
  end while
  ' Recombine s and ms
  syncTime = box("")
  syncTime.setString(seconds,10)
  syncTime.appendString(milliseconds,3)

  return syncTime
end function
