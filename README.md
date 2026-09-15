# PluginSMP

The full plugin pack for **BladeSMP** — money, sell menu, and auction house,
made for Eaglercraft 1.8 / Spigot 1.8.8 servers.

**Easy install page:** https://cloudyiceocean.github.io/PluginSMP/

| Plugin | What it gives you | Its own page |
|---|---|---|
| **SMPmoneyplugin** | Money, `/pay`, `/baltop`, and the balance board on the right of the screen | [page](https://cloudyiceocean.github.io/SMPmoneyplugin/) · [code](https://github.com/CLoudyIceOceaN/SMPmoneyplugin) |
| **SMPauctionplugin** | `/sell` menu + `/ah` auction house with quick buy | [page](https://cloudyiceocean.github.io/SMPauctionplugin/) · [code](https://github.com/CLoudyIceOceaN/SMPauctionplugin) |

---

## 1. Install everything with one command

Open the terminal in your Codespace, `cd` into your **server folder**
(the one with the server jar or `server.properties` in it), and paste:

```
curl -sL https://cloudyiceocean.github.io/PluginSMP/install.sh | bash
```

Then **restart the server**. That's the whole install.

Running the same command again later **updates** every plugin to the
newest version (your money and auction listings are kept — they live in
data files, not in the jars).

---

## 2. Every command

### Money (SMPmoneyplugin)

| Command | Who | What it does |
|---|---|---|
| `/bal` (or `/balance`, `/money`) | everyone | Shows your money |
| `/bal Steve` | everyone | Shows Steve's money |
| `/pay Steve 500` | everyone | Sends Steve $500 of your money |
| `/baltop` | everyone | Top 10 richest players |
| `/eco give Steve 1000` | OP only | Creates $1,000 for Steve out of thin air |
| `/eco take Steve 1000` | OP only | Removes $1,000 from Steve |
| `/eco set Steve 0` | OP only | Sets Steve's money to exactly $0 |
| `/smpmoney reload` | OP only | Reloads the money config after you edit it |

### Sell menu & auction house (SMPauctionplugin)

What the menus look like (mockups — in game it's drawn with real
Minecraft item textures):

| The auction house | The sell menu |
|---|---|
| ![Auction house](https://cloudyiceocean.github.io/SMPauctionplugin/images/auction-house.svg) | ![Sell menu](https://cloudyiceocean.github.io/SMPauctionplugin/images/sell-menu.svg) |

| Command | Who | What it does |
|---|---|---|
| `/sell` | everyone | Opens the sell menu — drop items in, hover the green pane (bottom-right) to see your total, click it, get paid |
| `/worth` | everyone | Says what the item in your hand sells for |
| `/ah` | everyone | Opens the auction house |
| `/ah diamond` | everyone | Searches the auction house for an item (cheapest first) |
| `/ah sell 5k` | everyone | Puts the item in your hand up for sale for $5,000 |

**Amounts everywhere** understand shortcuts: `500`, `2k` (= 2,000),
`1.5m` (= 1,500,000), `1b` (= 1,000,000,000).

**Inside the auction house:**
- **Click** an item → confirm screen (green wool = buy, red wool = cancel)
- **Shift-click** an item → bought **instantly**, no confirm
- **Hopper** → change sorting: newest → cheapest → priciest
- **Ender chest** → ⚡ **Quick Buy**: every item type for sale in one menu
  with its cheapest price — click one to see all of them, cheapest first
- **Anvil** → refresh the listings
- **Sign** → search (type `/ah <item name>`; click the sign again to clear)
- **Chest** → *Your Items*: take things off sale, claim back items that
  expired or that you cancelled
- **Arrow** (bottom right) → next page

---

## 3. Editing the plugins (no coding needed)

Each plugin makes a settings file on the server the first time it runs.
Open the file, change what you want, save.

### Money settings — `plugins/SMPmoneyplugin/config.yml`

| You want to... | Change this |
|---|---|
| Rename the server on the board | `title: "&6&lBLADESMP"` under `scoreboard:` |
| Change the board's lines | the `lines:` list (each `- "..."` is one line, `""` = blank line) |
| Change the money symbol | `currency: "$"` |
| Change new players' starting money | `starting-balance: 100` |
| Change any chat message | everything under `messages:` |
| Turn the board off | `enabled: false` under `scoreboard:` |

After saving, type **`/smpmoney reload`** in game — changes apply
instantly, **no restart needed**.

The board's lines can use these placeholders:
`%balance%` → `$1,234,567` · `%balance_short%` → `$1.2M` ·
`%player%` → your name · `%online%` → players online.

Player balances are stored in `plugins/SMPmoneyplugin/balances.yml`.
You can edit money by hand in there, but only while the server is off
(otherwise use `/eco set`, it's safer).

### Sell & auction settings — `plugins/SMPauctionplugin/config.yml`

| You want to... | Change this |
|---|---|
| Change what an item pays in `/sell` | its line under `sell-prices:` (price is per single item) |
| Make a new item sellable | add a line, like `DIAMOND_BLOCK: 900` |
| Change how long auctions last | `duration-hours: 48` under `listing:` |
| Change max auctions per player | `max-per-player: 10` |
| Charge a fee for listing | `fee-percent: 0` (5 = the seller pays 5% up front) |
| Change menu titles or any message | `gui:` and `messages:` sections |

After saving these, **restart the server** (this plugin has no reload
command yet).

⚠️ **1.8 item names are weird.** A few that will trip you up:
gunpowder = `SULPHUR`, raw porkchop = `PORK`, carrot = `CARROT_ITEM`,
potato = `POTATO_ITEM`, nether wart = `NETHER_STALK`, fish = `RAW_FISH`.
If a price doesn't work, the name is probably wrong — check the server
log at startup for complaints.

### Color codes (used in every config)

Write `&` + a code before text: `&6&lBLADESMP` = bold gold BLADESMP.

| Code | Color | Code | Color |
|---|---|---|---|
| `&6` | gold | `&e` | yellow |
| `&a` | green | `&c` | red |
| `&f` | white | `&7` | gray |
| `&b` | aqua | `&d` | pink |
| `&l` | **bold** | `&o` | *italic* |

---

## 4. Releasing a plugin update

The download pages always hand out the jar that is committed in each
plugin's repo. So updating a plugin for everyone is:

```
cd ~/Documents/Claude/SMPmoneyplugin     # or SMPauctionplugin
./build.sh
git add -A && git commit -m "update" && git push
```

A minute later the download page — and the install command above —
serves the new version. Your friend just runs the install command again
and restarts.

---

## 5. Editing THIS page later

This whole guide is just the `README.md` file in this repo, and the
install page is `index.html`. To edit either one:

1. Go to https://github.com/CLoudyIceOceaN/PluginSMP
2. Click the file, then the **pencil** (✏️) button at the top right
3. Make your changes and press **Commit changes**

The website updates itself about a minute after you commit.
To add a new plugin to the one-command installer, edit `install.sh`
the same way — there's a marked list at the top, one line per plugin.

---

## 6. If something goes wrong

| Problem | Fix |
|---|---|
| `/ah` says nothing / auction plugin didn't load | SMPmoneyplugin is missing — rerun the install command |
| Board doesn't show up | Check `enabled: true` in the money config, then `/smpmoney reload` |
| "That's not a valid amount" | Use plain numbers or `2k` / `1.5m` style, no `$` sign |
| Sell menu won't take an item | Renamed/enchanted items are protected on purpose; other items need a price under `sell-prices:` |
| Edited a config and now the plugin errors | You probably broke the YAML — check the spaces at the start of lines (use 2, never tabs) |
| Everything is on fire | Delete the plugin's folder in `plugins/` (NOT the jar) and restart — you get fresh default configs. `balances.yml` and `listings.yml` are the only files with real player stuff in them, so back those two up first |
