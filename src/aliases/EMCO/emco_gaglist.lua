local lecho = demonnic.helpers.echo
local gaggedLines = table.keys(demonnic.chat.gags)
table.sort(gaggedLines)

lecho("<orange>Gagging report. Remember these are Lua patterns, not regex")
lecho()
lecho("<orange>Gagged lines")
for _,pattern in ipairs(gaggedLines) do
  lecho("  <purple>" .. pattern)
end
