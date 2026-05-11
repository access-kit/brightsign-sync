# AccessKit Player Package for BrightSign

Library for synchronizing BrightSign to a web server with [AccessKit](accesskit.media)

## Features

- Realtime BrightSign control, including transport controls, volume controls, and window controls
- Automatic BrightSign registration
- Synchronize BrightSigns for multi-channel video displays
- Synchronize accompanying captions and audio to mobile devices with BrightSigns

## Releasing

Update the version in `ak.version.json` so the package versions of players can be tracked.

Creating and pushing a tag will automatically build a new release:

```sh
git tag -a vX.Y.Z -m "<descriptive message>"
git push origin <branch> --tags
```

Commits to master will also be built and update the tagged release `latest`.

If file should be excluded from the release, add them to the `exclusions` step of the `release.yml` GitHub Workflows Action.

Additionally, there is a file called `ak.features.json` which should be updated with any features from the official [AccessKit build](https://github.com/access-kit/access-kit) which the BrightSign release can make use of.

## Sync Modes

The player supports four `syncMode` values (set via `config.json`):

- `solo` — the player loops the video on its own.
- `leader` — the player loops the video and broadcasts loop-start UDP messages so `follower`s in its sync group stay in sync.
- `follower` — the player starts each cycle when it receives a UDP `start` message from a `leader` in its sync group.
- `gpiotriggered` — the player starts playback when a GPIO input edge is received on the configured trigger pin, and stops/rewinds when the opposite edge is received. After stopping (whether via the stop edge, the natural end of the video, or the `stop` UDP command), the player returns to idle and waits for the next start edge.

## GPIO Configuration

GPIO behavior is configured via `gpio.json`. If the file is missing or any field is invalid, the player writes defaults on boot:

```json
{
  "captionsPin": 1,
  "triggerPin": 0,
  "startEdge": "down",
  "stopOnOppositeEdge": true
}
```

- `captionsPin` (int, 0–7, default `1`): the on-screen captions toggle pin. A `down` edge activates captions; an `up` edge deactivates them. Only acted on outside the per-loop sync window.
- `triggerPin` (int, 0–7, default `0`): the start/stop pin used when `syncMode` is `gpiotriggered`. Default is `0` to avoid colliding with the captions pin (`1`) and with timeline event output pins (`2`–`7`). If `triggerPin` equals `captionsPin`, the trigger is disabled and a warning is logged (captions wins).
- `startEdge` (`"down"` | `"up"`, default `"down"`): which edge starts playback. The opposite edge stops it (subject to `stopOnOppositeEdge`).
- `stopOnOppositeEdge` (bool, default `true`): whether the opposite edge stops playback. Set to `false` for momentary-button hardware where the release should not stop the video — playback will instead run to its natural end and then return to idle, ready for the next press. Toggle-switch hardware should leave this `true`.

The `stop` UDP command (sent to the player's `commandPort`) is wired equivalently to the GPIO stop edge and is useful for testing without GPIO hardware. The UDP `stop` command is unaffected by `stopOnOppositeEdge`.

## Connecting via SSH

`ssh brightsign@ip`

or 

`ssh -oHostKeyAlgorithms=+ssh-rsa brightsign@ip`
