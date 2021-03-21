Function oscBuildMessage(addr as String, payload) as Object
  REM convert the address into a byte array
  addrBytes = CreateObject("roByteArray")
  addr = "/"+addr
  addrBytes.fromAsciiString(addr)
  REM pad the byte array
  while (addrBytes.count() mod 4 <> 0)
    addrBytes.push(0)
  end while

  REM set up byte arrays for the typetag, payload, and a buffer for converting the payload to bytes
  typeTagBytes = CreateObject("roByteArray")
  payloadBytes = CreateObject("roByteArray")
  littleEndianBytes = CreateObject("roByteArray")

  REM Convert an integer to a 32-bit Big Endian
  if (type(payload) = "Integer") then
    typeTag = ","+"i"
    typeTagBytes.fromAsciiString(typeTag)
    typeTagBytes.push(0)
    typeTagBytes.push(0)
    if (payload > 0) then
      if payload >= 16777216
      REM TODO TEST WITH LARGE NUMBERS!  MIGHT NEED 4 NULL BYTES
      else if payload >= 65536
        payloadBytes.push(0)
      else if payload >= 256
        payloadBytes.push(0)
        payloadBytes.push(0)
      else
        payloadBytes.push(0)
        payloadBytes.push(0)
        payloadBytes.push(0)
      end if
      total = payload
      REM ugh this could be done better by tracking which place we just found, setting the bits right to left, etc.
      while (total <> 0)
        remainder = total mod 256
        total = int(total/256)
        littleEndianBytes.push(remainder)
      end while
      REM reverse the order
      while (littleEndianBytes.count() > 0)
        payloadBytes.push(littleEndianBytes.pop())
      end while
    end if
  REM Create the payload byte array if its a string
  else if (type(payload) = "String") then
    typeTag = ","+"s"
    typeTagBytes.fromAsciiString(typeTag)
    typeTagBytes.push(0)
    typeTagBytes.push(0)
    payloadBytes.fromAsciiString(payload)
    if (payloadBytes.count() mod 4 = 0) then
      payloadBytes.push(0)
      payloadBytes.push(0)
      payloadBytes.push(0)
      payloadBytes.push(0)
    end if
    while (payloadBytes.count() mod 4 <> 0)
      payloadBytes.push(0)
    end while
  else if (type(payload) = "roArray") then
    REM handle array payloads
  end if

  oscMessage = CreateObject("roByteArray")
  oscMessage.append(addrBytes)
  oscMessage.append(typeTagBytes)
  oscMessage.append(payloadBytes)
  return oscMessage
End Function
