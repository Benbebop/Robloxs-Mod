local joinUI = Instance.new("Configuration", script)
joinUI.Name = "trackedUi"

return setmetatable({}, {
	__call = function(ui, addend)
		if ui.class == "panel" and addend.class == "panel" then
			
		elseif ui.class == "joinPanel" and addend.class == "panel" then
			
		else
			error("attempt to join " .. ui.class .. " with " .. addend.class)
		end
	end
})
