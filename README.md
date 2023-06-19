# EMCO

## Prebuilt EMCO tabbed chat package

While there are many uses for an EMCO, the most requested one is by far tabbed chat display. This package takes the EMCO object available as part of the [MDK](https://github.com/demonnic/MDK) and builds a basic, generic chat tabs package out of it.

It's built using an adjustable container, so it can be moved, resized, etc right out of the box. There are range of aliases with the package which make adding/removing tabs and changing some of the basic themes of the EMCO easier.

You can leverage the entire [EMCO API](https://demonnic.github.io/mdk/current/classes/EMCO.html) by targeting `demonnic.chat` , as that is the actual underlying EMCO object.

## Installation

You can use the following command in Mudlet to install the latest version:

`lua installPackage("https://github.com/demonnic/EMCO/releases/latest/download/EMCOChat.mpackage")`

Once you have it installed you can update by using the `emco update` alias.

## Usage

### Copying lines into your EMCO

If you want to copy a line from the game and send it to EMCO, make a trigger to match the line, and use `demonnic.chat:append("tabName")` to copy the line to the EMCO. For instance, to send a line to the "Tells" tab, you would use

```lua
demonnic.chat:append("Tells")
```

If you want to send lines to the EMCO in code yourself, you can use `demonnic.chat:cecho("OOC", "This is an OOC message\n")`. There is also decho and hecho available the same way.

### Available aliases for the prebuilt EMCO package

* `emco addtab <tabname>`
  * adds a tab to your EMCO
* `emco blankLine <true|false>`
  * turn inserting a blank line between messages on/off
* `emco blink <true|false>`
  * turn blinking on/off
* `emco color <option> <value>`
  * used to change the colors for the active/inactive tab, and the background color for the consoles. 'emco color' with no options will print out available options
* `emco font`
  * set the font to use for the consoles
* `emco fontSize`
  * set the font size for the consoles
* `emco gag <pattern>`
  * add a gag pattern
* `emco gaglist`
  * prints out the list of gag patterns
* `emco hide`
  * hide the EMCO
* `emco load`
  * loads your config from disk
* `emco lock`
  * locks the EMCO in place
* `emco notify <tabName>`
  * turn on OS notifications for tabName
* `emco remtab <tabname>`
  * removes a tab from your EMCO
* `emco save`
  * saves your config to disk
* `emco show`
  * show the EMCO
* `emco timestamp <true|false>`
  * turn timestamps on/off
* `emco title <new title>`
  * Set the title at the top of the EMCO Chat window. "Tabbed Chat" is the default starting title.
* `emco unlock`
  * Unlocks the EMCO window so you can move and resize it again
* `emco ungag <pattern>`
  * remove a gag pattern
* `emco unnotify <tabName>`
  * turn off OS notifications for tabName
* `emco update`
  * (re)install the latest version of the package
