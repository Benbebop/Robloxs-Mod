local http = game:GetService("HttpService")

local joinUI

if script.trackedUi == "nil" then
	joinUI = Instance.new("Folder", script)
	joinUI.Name = "trackedUi"
	Instance.new("Configuration", joinUI).Name = "active"
	Instance.new("Configuration", joinUI).Name = "inactive"
else
	joinUI = script.trackedUi
end

return setmetatable({}, {
	__call = function(ui, addend)
		if ui.class == "panel" and addend.class == "panel" then
			local items = joinUI.inactive:GetChildren()
			local id = http:GenerateGUID(false)
			local joinWindow, windowRef = nil, nil
			if #items == 0 then
				joinWindow = plugin:CreateDockWidgetPluginGui(id, DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 200, 100, 200, 100))
				windowRef = Instance.new("ObjectValue", joinUI.active)
				windowRef.Name = id
				windowRef.Value = joinWindow
			else
				windowRef = items[1]
				joinWindow = windowRef.Value
				id = windowRef.Name
			end
		elseif ui.class == "joinPanel" and addend.class == "panel" then
			
		else
			error("attempt to join " .. ui.class .. " with " .. addend.class)
		end
	end
})
