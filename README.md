<h3 align="center">STARTER GIFT BOX</h3>

  <p align="center">
    Free, open source starter gift box using the QBCore Framework
    <br />
    <br />
    <a href="https://youtu.be/mtoYvVRTMK4">Showcase</a>
  </p>
</p>

## Prerequisites

* [QBCore Framework](https://github.com/qbcore-framework)

## Installation

* Download ZIP
* Drag and drop into `[standalone]`
* Restart your server

## qb-core > shared > main.lua > Paste to `QBShared.StarterItems` table
```lua
    ['giftbox'] = { amount = 1, item = 'giftbox' },
```

## qb-inventory > html > images
```lua
sl-GiftBox/images/giftbox.png
```

## qb-core > shared > items.lua
```lua
	-- Starter Gift Box
	['giftbox']             		= {['name'] = 'giftbox',                		['label'] = 'Starter Gift Box',       	['weight'] = 0,         ['type'] = 'item',      ['image'] = 'giftbox.png',     		    ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Present with various items'},
```
