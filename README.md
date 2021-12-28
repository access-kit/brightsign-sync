# BrightSign Media Sync

Library for synchronizing BrightSign to a web server.

## Networking

| Multicast Address | Targets                                                  |
| ----------------- | -------------------------------------------------------- |
| 239.192.0.0       | All players on the network                               |
| 239.192.0.0/24    | Sync groups corresponding to a multi-channel work        |
| 239.192.1.0       | All "leader" or "solo" players.                          |
| 239.192.1.0/24    | Sync group leader corresponding to multi-channel work    |
| 239.192.2.0       | All "follower" players.                                  |
| 239.192.2.0/24    | Sync group followers corresponding to multi-channel work |

## Transferring to a Different Instance

Use basic `config.json` (just `syncUrl` and `password`), and force factory reset in `init.json`.
