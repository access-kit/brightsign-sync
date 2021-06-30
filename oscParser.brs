Function oscParseMessage(bytes)
  if chr(bytes.getEntry(0)) = "/" then ' check to see if first sign is slash, if so, assume osc
    
    bytes.reset() ' set the iterator to the beginning
    
    address = createObject("roByteArray")
    byte = bytes.next()
    while not byte = 44 ' stop when you reach a comma
      if not byte = 0 ' skip over null bytes
        address.push(byte)
      end if
      byte = bytes.next()
    end while

    dataTypes = createObject("roByteArray")
    byte = bytes.next()
    while not byte = 0 ' step when you find a 0-padding bytes
      dataTypes.push(byte)
      byte = bytes.next()
    end while

    while byte = 0 ' skip over 0-padding bytes
      byte = bytes.next()
    end while
    
    data = createObject("roByteArray")
    data.push(byte)
    while bytes.isNext():
      byte = bytes.next()
      data.push(byte)
    end while


    parsedData = createObject("roArray", 0, True)
    parsedDatatypes = createobject("roArray", 0, True)
    
    data.reset() ' set the data iterator to the beginning
    byteCount = 0 ' track how many bytes have been counted
    for each byte in datatypes
      datatype = chr(byte) ' convert the type byte to the human-readable char.
      parsedDatatypes.push(datatype) ' store the datatype

      if datatype = "s" ' handle strings
        stringData = createObject("roByteArray")
        byte = data.next()
        byteCount = byteCount + 1
        while not byte = 0 and data.isNext()
          stringData.push(byte)
          byte = data.next()
          byteCount= byteCount+1
        end while
        parsedData.push(stringData.toAsciiString())
        while byte = 0 and data.isNext() and (not byteCount MOD 4 = 0)
          byte = data.next()
          byteCount = byteCount +1
        end while

      else if datatype = "i"
        ' ToDo: implement 32-bit int parser
        intData = createObject("roByteArray")
        for i=0 to 3 STEP 1
          byte = data.next()
          byteCount = byteCount + 1
          intData.push(byte)
        end for 
        parsedData.push(intData)

      else if datatype = "f"
        ' ToDo: implement 32-bit IEEE 754 parser
        floatData = createObject("roByteArray")
        for i=0 to 3 STEP 1
          byte = data.next()
          byteCount = byteCount + 1
          floatData.push(byte)
        end for 
        parsedData.push(floatData)
      end if
      
    end for

    payload = createObject("roAssociativeArray")
    payload.address = address.toAsciiString()
    payload.datatypes = parsedDatatypes
    if parsedData.count() = 1
      payload.data = parsedData.getEntry(0)
    else
      payload.data = parsedData
    end if
    return payload
  else 
    return -1
  end if
end Function