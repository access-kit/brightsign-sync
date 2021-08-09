'name file autorun.zip
' Content update application

Sub Main()
    path$= FindDestPath()
    source$= FindSourcePath()
    package = CreateObject("roBrightPackage", source$+"autorun.zip")
    package.SetPassword("test")
    package.Unpack(path$)
    package = 0
    CreateDirectory(path$+"feed_cache")
    CreateDirectory(path$+"feedPool")
    CreateDirectory(path$+"brightsign-dumps")

    DeleteFile(path$+"autozip.brs")
    DeleteFile(source$+"autorun.zip")
    a=RebootSystem()
End Sub

Function FindDestPath()
    if not IsFirmwareValid() then
        return "SD:/"
    end if

    destinationPaths = ["SSD:", "SD:", "USB1:"]
    for each destination in destinationPaths
        if IsMounted(destination) then
            return destination+"/"
        end if
    next
    return "unknown"
End Function

Function FindSourcePath()
    if not IsFirmwareValid() then
        return "SD:/"
    end if

    sourcePaths = ["USB1:", "SD:", "SSD:"]
    for each source in sourcePaths
        if IsMounted(source) and CheckFile(source+"/autorun.zip") then
            return source+"/"
        end if
    next
    return "unknown"
End Function

Function IsMounted(path as String)
    if CreateObject("roStorageHotplug").GetStorageStatus(path).mounted then
        return true
    end if

    return false
End Function

Function IsFirmwareValid()
    di = CreateObject("roDeviceInfo")
    return di.FirmwareIsAtLeast("7.0.60")
End Function

Function CheckFile(path as String)
    file = CreateObject("roReadFile", path)
    if type(file) = "roReadFile" then
        return true
    end if

    return false
End Function