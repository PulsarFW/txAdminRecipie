<div align="center">

<img src="https://r2.fivemanage.com/GPYOH8Hq4GPyAY7czrgLe/pulsarbanner.png" alt="Pulsar Framework" width="100%" />

<br/>

# PULSAR-TXADMINRECIPE

### txAdmin deploy recipe for the Pulsar Framework — sql, server.cfg, resources.cfg, and every pulsar_* resource

<br/>

![YAML](https://img.shields.io/badge/txAdmin-Recipe-2C2D72?style=flat-square)
![FiveM](https://img.shields.io/badge/FiveM-F40552?style=flat-square)

<br/>

<sub>Enjoy the framework? A coffee helps keep active development, hardening, and support going.</sub>

<a href="https://buymeacoffee.com/pulsarframework"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 50px !important;width: 180px !important;" /></a>

<br/>

[Overview](#overview) · [First Start](#first-start) · [Not Included](#not-included) · [Maintaining](#maintaining-this-recipe)

</div>

---

## Overview

This recipe runs inside [**txAdmin**](https://github.com/tabarra/txAdmin). Please check the [**Recipe Documentation Page**](https://github.com/tabarra/txAdmin/blob/master/docs/recipe.md).

Deploys `server.cfg`, `resources.cfg`, `pulsar.sql`, and every `pulsar_*` resource plus its third-party dependencies (`oxmysql`, cfx base resources, etc).

---

## First Start

`yarn` needs to build `pulsar_core` on its first run — expect errors on the very first server start while that happens. Once it finishes building, restart the server and allow the scripts to fully build their respective database part , you should see a print after that restart it again and it'll come up clean

---

## Not Included

- [`pulsar_weapons`](https://github.com/PulsarFW/pulsar_weapons) (274MB custom weapon pack) — install manually.
- [`pulsar_assets`](https://github.com/PulsarFW/pulsar_assets) (mining node props, hotel room interior) — copy in manually.
- `steam_webApiKey` in `server.cfg` — txAdmin has no way to collect this during deploy, add your own from your [Steam API key](https://steamcommunity.com/dev/apikey) page. (`sv_licenseKey` and the DB connection string *are* filled in automatically from what you enter in txAdmin's deploy UI — get a license key at [Cfx registration keys](https://portal.cfx.re/servers/registration-keys) if you don't have one yet.)
- Discord webhooks and other integration tokens in `server.cfg` — blank, fill in what you use.

---

## Maintaining This Recipe

Deploy URL: `https://raw.githubusercontent.com/PulsarFW/txAdminRecipie/main/pulsar.yaml`

**Adding/removing a resource:**
1. Add or remove the `ensure` line in `resources.cfg`.
2. Add or remove the matching `download_file` + `unzip` task pair in `pulsar.yaml`.
3. If it's a new `pulsar_*` resource, make sure it has a published GitHub release first (`PulsarFW/<name>/releases/latest/download/<name>.zip`) — the recipe pulls from releases, not raw source, so a resource with no release yet will fail the whole deploy at that step.

---

<div align="center">

![Pulsar Framework](https://img.shields.io/badge/Pulsar-Framework-7c3aed?style=flat-square)
![Built for FiveM](https://img.shields.io/badge/Built_for-FiveM-F40552?style=flat-square)

</div>
