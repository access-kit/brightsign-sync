# BrightSign Media Sync

Library for synchronizing BrightSign to a web server with [AccessKit](accesskit.media)

## Features

- Realtime BrightSign control, including transport controls, volume controls, and window controls
- Automatic BrightSign registration
- Synchronize BrightSigns for multi-channel video displays
- Synchronize accompanying captions and audio to mobile devices with BrightSigns

## Releasing

Creating and pushing a tag will automatically build a new release:

```sh
git tag -a vX.Y.Z -m "<descriptive message>"
git push origin <branch> --tags
```

Commits to master will also be built and update the tagged release `latest`.

If file should be excluded from the release, add them to the `exclusions` step of the `release.yml` GitHub Workflows Action.

Additionally, there is a file called `ak.features.json` which should be updated with any features from the official [AccessKit build](https://github.com/access-kit/access-kit) which the BrightSign release can make use of.

## Connecting via SSH

`ssh brightsign@ip`

or 

`ssh -oHostKeyAlgorithms=+ssh-rsa brightsign@ip`