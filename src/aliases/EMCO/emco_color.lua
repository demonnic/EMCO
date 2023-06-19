local echo = demonnic.helpers.echo
local ok, err = demonnic.helpers.setConfig(matches[2], matches[3])

if not ok then
  echo(err)
  return
end
echo(f"Set color for {matches[2]} to {matches[3]}")