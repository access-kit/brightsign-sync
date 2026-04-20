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

The player supports four `syncMode` values (configured via `config.json`):

- `solo` — the player loops the video on its own (default).
- `leader` — the player loops the video and broadcasts loop-start UDP messages so `follower`s in its sync group stay in sync.
- `follower` — the player starts playback each cycle when it receives a UDP `start` message from a `leader` in its sync group.
- `gpiotriggered` — the player starts playback each cycle when a GPIO input event is received on the configured trigger pin.

## GPIO Configuration

GPIO pins used by the player are configured via `gpio.json`. The file is auto-populated with defaults on first boot if it is missing or invalid:

```json
{
  "captionsPin": 1,
  "triggerPin": 0,
  "triggerOn": "down"
}
```

- `captionsPin` — GPIO input pin that toggles on-screen captions while the player is idle. Defaults to `1` (matches legacy hardcoded behavior).
- `triggerPin` — GPIO input pin used to start playback when `syncMode` is `gpiotriggered`. Defaults to `0`, intentionally different from `captionsPin` and outside the `2`–`7` range used for timeline-event GPIO outputs.
- `triggerOn` — `"down"` (default, trigger on button press / `roControlDown`) or `"up"` (trigger on release / `roControlUp`).

Valid pins are `0`–`7`. If `triggerPin` equals `captionsPin`, the GPIO trigger is disabled and a warning is logged (captions wins).

## Connecting via SSH

`ssh brightsign@ip`

or 

`ssh -oHostKeyAlgorithms=+ssh-rsa brightsign@ip`
