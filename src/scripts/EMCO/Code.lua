if not EMCO then
	local okay, content = pcall( require, "EMCO.EMCO" )
	if okay then
		EMCO = content
	else
		error(string.format("EMCO: Error loading module: %s\n", content))
	end
end
