local gGlobals = {
	["client"] = function(scr)
		return scr.ClassName == "LocalScript"
	end,
	["clientdll"] = function(scr)
		return scr.ClassName == "LocalScript"
	end,
	["gamemode"] = function(scr)
		return "_G.CurrentGamemode"
	end,
	["gm"] = function(scr)
		return "_G.CurrentGamemode"
	end, 
	["ent"] = function(scr)
		return "_G.CurrentGamemode"
	end,
	["swep"] = function(scr)
		return "_G.CurrentGamemode"
	end,
	["_modules"] = function(scr)
		return "_G.LoadedModules"
	end
}

local gFunctions = {}

return gGlobals, gFunctions
