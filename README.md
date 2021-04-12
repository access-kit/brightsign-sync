# BrightSign Media Sync

Library for synchronizing BrightSign to a web server.

## Setup

Place the video file (H.264 .mp4/.mov) onto the SD card.  Then edit `config.json`, replacing the `<values>` with the appropriate data.

```
{
  "filepath"  : "<name of media file, including file extension>",
  "id"        : "<id to identify media player to server>",
  "syncURL"   : "<url for server to synchronize to>",
  "password"  : "<password for server to synchronize to>"
}

```

## Time API

The API currently works as follows, but will likely be changed

The media player posts two different tables to the server.

One table is a timestamp for the clock synchronization process:


```
{
'password' : <password>,
'localTimeSentAt' : <timestamp in ms>
}
```

The media player expects to receive the following response:

```
"<original timestamp sent to the server> | <timestamp when server received request> | <timestamp when server sent response>"
```

The other table the media player sends to the server is used to report when the last cycle started:

```
{
'password' : <password>,
'id' : <identification of the video, set in config.json>,
'timestamp' : <js string>,
'timestampJSON' : <json string with timestamp stored at 'timestamp'>
}
```