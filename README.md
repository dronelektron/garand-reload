# Garand reload

Allows you to reload the M1 Garand when the clip is not empty

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/garand-reload/releases)
* Extract `plugins` and `gamedata` folders to `addons/sourcemod` folder of your server

### API

Called when the `client` tries to reload the `M1 Garand`

```sourcepawn
forward Action Garand_OnReload(int client);
```
