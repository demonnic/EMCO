local echo = demonnic.helpers.echo
local aliases = {
  ["emco save"] = "saves your config to disk",
  ["emco load"] = "loads your config from disk",
  ["emco addtab <tabname>"] = "adds a tab to your EMCO",
  ["emco remtab <tabname>"] = "removes a tab from your EMCO",
  ["emco fontSize"] = "set the font size for the consoles",
  ["emco font"] = "set the font to use for the consoles",
  ["emco blink <true|false>"] = "turn blinking on/off",
  ["emco blankLine <true|false>"] = "turn inserting a blank line between messages on/off",
  ["emco timestamp <true|false>"] = "turn timestamps on/off",
  ["emco show"] = "show the EMCO",
  ["emco hide"] = "hide the EMCO",
  ["emco gaglist"] = "prints out the list of gag patterns",
  ["emco gag <pattern>"] = "add a gag pattern",
  ["emco ungag <pattern>"] = "remove a gag pattern",
  ["emco notify <tabName>"] = "turn on OS notifications for tabName",
  ["emco unnotify <tabName>"] = "turn off OS notifications for tabName",
  ["emco color <option> <value>"] = "used to change the colors for the active/inactive tab, and the background color for the consoles. 'emco color' with no options will print out available options",
}

echo("\nAvailable aliases for the prebuilt EMCO package")
echo()
for name, desc in spairs(aliases) do
  echo(f"* {name}")
  echo(f"  * {desc}")
end
