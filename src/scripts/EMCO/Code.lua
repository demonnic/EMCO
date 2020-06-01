if not EMCO then
	local path = package.path
	local home_dir = getMudletHomeDir() .. "/@PKGNAME@"
	local lua_dir = string.format( "%s/%s", home_dir, [[?.lua]] )
	local init_dir = string.format( "%s/%s", home_dir, [[?/init.lua]] )
	package.path = string.format( "%s;%s;%s", path, lua_dir, init_dir )

	local okay, content = pcall( require, "EMCO" )
	package.path = path
	if okay then
		EMCO = content
	else
		error(string.format("EMCO: Error loading module: %s\n", content))
	end
end
