local defaultConfig = {activeColor = "black", inactiveColor = "black", activeBorder = "green", activeText = "green", inactiveText = "grey", background = "black", windowBorder = "green"}
local emco = require("@PKGNAME@.emco")
emco.cmdLineStyleSheet = nil
demonnic = demonnic or {}
demonnic.helpers = demonnic.helpers or {}
demonnic.config = demonnic.config or defaultConfig
local baseStyle = Geyser.StyleSheet:new(f [[
  border-width: 2px; 
  border-style: solid; 
]])
local activeStyle = Geyser.StyleSheet:new(f [[
  border-color: {demonnic.config.activeBorder};
  background-color: {demonnic.config.activeColor};
]], baseStyle)
local inactiveStyle = Geyser.StyleSheet:new(f [[
  border-color: {demonnic.config.inactiveColor};
  background-color: {demonnic.config.inactiveColor};
]], baseStyle)
local adjLabelStyle = Geyser.StyleSheet:new(f[[
  background-color: rgba(0,0,0,100%);
  border: 4px double;
  border-color: {demonnic.config.windowBorder};
  border-radius: 4px;]])

  local default_constraints = {name = "EMCOPrebuiltChatContainer", x = "-25%", y = "-60%", width = "25%", height = "60%"}


local chatEMCO = demonnic.chat
local EMCOfilename = getMudletHomeDir() .. "/EMCO/EMCOPrebuiltChat.lua"
local confFile = getMudletHomeDir() .. "/EMCO/EMCOPrebuiltExtraOptions.lua"

function demonnic.helpers.echo(msg)
  msg = msg or ""
  cecho(f "<green>EMCO Chat: <reset>{msg}\n")
end

function demonnic.helpers.resetToDefaults()
  default_constraints.adjLabelstyle = adjLabelStyle:getCSS()
  demonnic.container = demonnic.container or Adjustable.Container:new(default_constraints)
  demonnic.config = defaultConfig
  demonnic.chat = emco:new({
    name = "EMCOPrebuiltChat",
    x = 0,
    y = 0,
    height = "100%",
    width = "100%",
    consoles = {"All", "Local", "City", "OOC", "Tells", "Group"},
    allTab = true,
    allTabName = "All",
    blankLine = true,
    blink = true,
    bufferSize = 10000,
    deleteLines = 500,
    timestamp = true,
    fontSize = 12,
    font = "Ubuntu Mono",
    consoleColor = demonnic.config.background,
    activeTabCSS = activeStyle:getCSS(),
    inactiveTabCSS = inactiveStyle:getCSS(),
    activeTabFGColor = demonnic.config.activeText,
    inactiveTabFGColor = demonnic.config.inactiveText,
    gap = 3,
    commandLine = true,
  }, demonnic.container)
  chatEMCO = demonnic.chat
  demonnic.helpers.retheme()
end

function demonnic.helpers.retheme()
  activeStyle:set("background-color", demonnic.config.activeColor)
  activeStyle:set("border-color", demonnic.config.activeBorder)
  inactiveStyle:set("background-color", demonnic.config.inactiveColor)
  inactiveStyle:set("border-color", demonnic.config.inactiveColor)
  adjLabelStyle:set("border-color", demonnic.config.windowBorder)
  local als = adjLabelStyle:getCSS()
  demonnic.container.adjLabelstyle = als
  demonnic.container.adjLabel:setStyleSheet(als)
  chatEMCO.activeTabCSS = activeStyle:getCSS()
  chatEMCO.inactiveTabCSS = inactiveStyle:getCSS()
  chatEMCO:setActiveTabFGColor(demonnic.config.activeText)
  chatEMCO:setInactiveTabFGColor(demonnic.config.inactiveText)
  chatEMCO:setConsoleColor(demonnic.config.background)
  chatEMCO:switchTab(chatEMCO.currentTab)
end

function demonnic.helpers.setConfig(cfg, val)
  local validOptions = table.keys(demonnic.config)
  if not table.contains(validOptions, cfg) then
    return nil, f"invalid option: valid options are {table.concat(validOptions, ', ')}"
  end
  demonnic.config[cfg] = val
  demonnic.helpers.retheme()
  return true
end

function demonnic.helpers.save()
  chatEMCO:save()
  table.save(confFile, demonnic.config)
  demonnic.container:save()
end

function demonnic.helpers.load()
  if io.exists(confFile) then
    local conf = {}
    table.load(confFile, conf)
    demonnic.config = table.update(demonnic.config, conf)
  end
  if io.exists(EMCOfilename) then
    chatEMCO:hide()
    chatEMCO:load()
    chatEMCO:show()
  end
  demonnic.container:load()
  demonnic.helpers.retheme()
end

local function startup()
  demonnic.helpers.resetToDefaults()
  demonnic.helpers.load()
end

registerNamedEventHandler("demonnicEMCO", "EMCOprebuilt startup", "sysLoadEvent", startup)
