' Clock Constructor
function createClock(_syncUrl as String, _password as String) as Object
  ' Init object
  timer = createObject("roAssociativeArray")

  ' Give it timer objects
  timer.systemClock = createObject("roSystemTime") ' NB: System clock's epoch timestamp is only accurate to the nearest second; use getMillisecond to findout ms at that point, though rounding issue is possible
  timer.startupTime = timer.systemClock.getLocalDateTime()
  timer.startupTime.subtractMilliseconds(timer.startupTime.getMillisecond())
  timer.elapsedTime = createObject("roTimeSpan")
  timer.elapsedTime.mark()

  ' Create a secondary timer for convenience performance measurements
  timer.perfCounter = createObject("roTimeSpan")
  timer.markStart = markStart
  timer.markElapsed = markElapsed
  timer.reqTimer = createObject("roTimeSpan")
  timer.syncTimer = createObject("roTimeSpan") ' use to measure elapsed time since last syncprocess 

  ' Give it timing functions
  timer.getEpoch = getEpoch
  timer.getEpochAsMSString = getEpochAsMSString
  timer.getTimeDiff = getTimeDiff
  timer.checkRollover = checkRollover

  ' Give it a sync destination and an initial offset
  timer.request = createObject("roUrlTransfer")
  timer.apiEndpoint = _syncUrl+"/api/sync"
  timer.responsePort = createObject("roMessagePort")
  timer.request.setPort(timer.responsePort)
  timer.password = _password
  timer.serverTimeOffset = 0
  timer.ntpSyncCycles = 20

  ' Give it NTP functions
  timer.calculateOffset = calculateOffset
  timer.blockingNTPSync = blockingNTPSync
  timer.synchronizeTimestamp = synchronizeTimestamp
  
  ' Give it state machine functions
  timer.step = clockMachine
  timer.state = "idle"

  ' Run an initial sync and get the clock into the same range
  ' Then calculate the new difference
  timer.blockingNTPSync()
  timer.originalOffset = timer.serverTimeOffset
  timer.lastMonotonicMSStamp = timer.elapsedTime.totalMilliseconds()
  timer.startupTime.addMilliseconds(timer.serverTimeOffset)
  timer.blockingNTPSync()
  timer.syncTimer.mark()

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
  ' considering taking into account ms since epoch as well?
  epoch = {seconds:m.startupTime.toSecondsSinceEpoch()+m.elapsedTime.totalSeconds(), milliseconds:(m.elapsedTime.totalMilliseconds() - (m.elapsedTime.totalSeconds()*1000))}
  ' Protect against negative (and thus invalid) millisecond values
  if epoch.milliseconds < 0:
    print("Caught a bad timestamp when attempting to mark time")
    print("Creating a new monotonic origin.")
    m.startupTime = m.systemClock.getLocalDateTime()
    m.startupTime.subtractMilliseconds(m.startupTime.getMillisecond())
    m.startupTime.addMilliseconds(m.originalOffset)
    m.elapsedTime.mark()
    epoch = {seconds:m.startupTime.toSecondsSinceEpoch()+m.elapsedTime.totalSeconds(), milliseconds:(m.elapsedTime.totalMilliseconds() - (m.elapsedTime.totalSeconds()*1000))}
    m.state = "starting"
  end if
  return epoch
end function

function checkRollover()
  stamp = m.elapsedTime.totalMilliseconds()
  if stamp < m.lastMonotonicMSStamp then
    print("Detected timestamp rollover, should be 24days sinced program started.")
    print "Rollover stamp:", stamp
    m.startupTime = m.systemClock.getLocalDateTime()
    m.startupTime.subtractMilliseconds(m.startupTime.getMillisecond())
    m.startupTime.addMilliseconds(m.originalOffset)
    m.elapsedTime.mark()
    print("Resynchronizing...")
    m.state = "starting"
  end if
  m.lastMonotonicMSStamp = m.elapsedTime.totalMilliseconds()
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

function clockMachine()
  if m.state = "idle" then 
    m.checkRollover()
  else if m.state = "starting" then
    ' Create an empty array to store the offsets in
    m.offsets = createObject("roArray",0,true)
    m.state = "requesting an offset"
    m.syncTimer.mark()
  else if m.state = "requesting an offset" then
    m.request.setUrl(m.apiEndpoint+"?reqSentAt="+m.getEpochAsMSString())
    m.request.asyncGetToString()
    m.reqTimer.mark()
    m.state = "awaiting an offset"
  else if m.state = "awaiting an offset" then
    if m.reqTimer.totalMilliseconds() > 750 then
      m.offsets.push(m.serverTimeOffset)
      if m.offsets.count() < m.ntpSyncCycles then 
        m.state = "requesting an offset"
      else 
        m.state = "calculating average"
      end if
    else
      res = m.responsePort.getMessage()
      if not res = invalid then
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
        end if
        if reqSentAt.len() > 0 then
          roundTripTime = m.getTimeDiff(resReceivedAt,reqSentAt)
          serverPerfTime = m.getTimeDiff(resSentAt,reqReceivedAt)
          transitTime = roundTripTime-serverPerfTime
          latency = int(transitTime / 2)
          offset = m.getTimeDiff(reqReceivedAt,reqSentAt)-latency
          print "Latency:", latency
          print "Offset: ", offset
          m.offsets.push(offset)
        else 
          m.offsets.push(m.serverTimeOffset)
        end if
        if m.offsets.count() < m.ntpSyncCycles then 
          m.state = "requesting an offset"
        else 
          m.state = "calculating average"
        end if
      end if
    end if
  else if m.state = "calculating average" then
    sum = 0
    for each offset in m.offsets
      sum = sum + offset
    end for
    avgOffset = sum/m.offsets.count()

    ' Standard deviation calculation
    diffsSquaredSum = 0
    for each offset in m.offsets
      diffsSquaredSum = diffsSquaredSum + (offset-avgOffset)*(offset-avgOffset)
    end for
    stdDev = sqr(diffsSquaredSum/(m.offsets.count()-1))

    ' Throw out outliers at > 1 std dev.
    validOffsetsCount = 0
    validSum = 0
    for each offset in m.offsets
      if abs(offset-avgOffset) <= stdDev then
        validOffsetsCount = validOffsetsCount +1
        validSum = validSum + offset
      end if
    end for
    avgNoOutliers = int(validSum/validOffsetsCount)
    ' Set the offset accordingly.
    m.serverTimeOffset = avgNoOutliers
    m.state = "finished"
  else if m.state = "finished" then
    if m.syncTimer.totalMilliseconds() > 30000 then
      m.state = "idle"
    end if
  end if
end function

' Submit a timestamp to a server
' Use the response to calculate the time difference
function calculateOffset() as Integer
  m.request.setUrl(m.apiEndpoint+"?reqSentAt="+m.getEpochAsMSString())
  m.request.asyncGetToString()
  ' TODO: MAKE ASYNC, WAIT BLOCKS!
  res = m.responsePort.waitMessage(750)
  if not res = invalid then
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
    end if
    'voyageOutTime = m.getTimeDiff(reqReceivedAt,reqSentAt)
    'voyageBackTime = m.getTimeDiff(resReceivedAt,resSentAt)
    'doubleLatency = voyageOutTime+voyageBackTime
    'latency = int((voyageOutTime+voyageBackTime)/2)
    'offset = voyageOutTime-latency
    if reqSentAt.len() > 0 then
      roundTripTime = m.getTimeDiff(resReceivedAt,reqSentAt)
      serverPerfTime = m.getTimeDiff(resSentAt,reqReceivedAt)
      transitTime = roundTripTime-serverPerfTime
      latency = int(transitTime / 2)
      offset = m.getTimeDiff(reqReceivedAt,reqSentAt)-latency
      print " "
      print "Latency:", latency
      print "Offset: ", offset
      return offset
    else 
      print "response did not contained expected data"
      return m.serverTimeOffset
    end if
    
  else 
    print "response was invalid"
    return m.serverTimeOffset

  end if
  
end function

' Adjust the clock object
function blockingNTPSync() as void
  ' Create an empty array to store the offsets in
  offsets = createObject("roArray",0,true)

  ' Accumulate the offsets and calc. average.
  sum = 0
  for i = 0 to m.ntpSyncCycles-1
    offset = m.calculateOffset()
    sum = sum + offset
    offsets.push(offset)
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
    if abs(offset-avgOffset) <= stdDev then
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
  print "Timestamp", timestamp
  print "Offset", m.serverTimeOffset
  msSum = inputMS+m.serverTimeOffset
  print "MS Sum", msSum
  ' Set up placeholders for final values
  finalS = 0
  finalMS = 0
  ' Carry digits if ms add up to more than 1s
  if msSum >= 1000 then
    print "positive carrying"
    quotient = int(msSum/1000)
    print "Quotient", quotient
    remainder = int(msSum mod 1000)
    print "Remainder", remainder
    finalS = inputS + quotient
    finalMS = remainder
  else if msSum < 0  and msSum > -1000 then
    print("small negative carrying")
    finalS = inputS - 1 
    finalMS = 1000 + msSum
  else if msSum <= -1000 then
    print("large negative carrying")
    quotient = abs(int(msSum/1000))
    print "Quotient", quotient
    remainder = msSum+ quotient*1000
    print "Remainder", remainder
    finalS =inputS - quotient
    finalMS = remainder
    finalS = int(finalS)
    finalMS = int(finalMS)
  else 
    print("no carrying")
    finalS = inputS
    finalMS = msSum
  end if
  print "final",finals;finalms
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
