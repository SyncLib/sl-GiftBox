<br />
  <h3 align="center">STARTER GIFT BOX</h3>

  <p align="center">
    Free, open source starter gift box using the QBCore Framework
    <br />
    <br />
    <a href="https://youtu.be/mtoYvVRTMK4">Showcase</a>
    ·
    <a href="https://github.com/ImMacky/mk-GiftBox/issues">Bug Report</a>
    ·
    <a href="https://github.com/ImMacky/mk-GiftBox/issues">Suggestions</a>
  </p>
</p>

## Prerequisites

* [QBCore Framework](https://github.com/qbcore-framework)

## Installation

* Download ZIP
* Drag and drop into `[standalone]` remove `-main` from file name
* Restart your server

## qb-core > shared > main.lua > Paste to `QBShared.StarterItems` table
```lua
    ['giftbox'] = { amount = 1, item = 'giftbox' },
```

## qb-inventory > shared > items.lua
```lua
	-- Starter Gift Box
	['giftbox']             		= {['name'] = 'giftbox',                		['label'] = 'Starter Gift Box',       	['weight'] = 0,         ['type'] = 'item',      ['image'] = 'giftbox.png',     		    ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Present with various items'},
```