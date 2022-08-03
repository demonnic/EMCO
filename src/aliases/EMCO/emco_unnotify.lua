local tabName = matches[2]:title()
local echo = demonnic.helpers.echo
local ok = demonnic.chat:removeNotifyTab(tabName)

if ok then
  echo(f"Disabled OS notifications for tab {tabName}")
elseif ok == false then
  echo(f"Tab {tabName} already had notifications disabled!")
else
  echo(f"Tab {tabName} does not exist")
end