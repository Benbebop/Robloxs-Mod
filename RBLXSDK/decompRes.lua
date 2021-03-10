local http = game:GetService("HttpService")

local plugin = require(script.Parent.getPlugin)

return function(str, configWidget)
	configWidget.Title = "Convert Resource File"
	configWidget:ClearAllChildren()

	Instance.new("UIListLayout", configWidget)
	local tmp = Instance.new("TextLabel", configWidget)
	tmp.Name = "convertOffset"
	tmp.LayoutOrder = 0
	tmp.Text = "convertOffset"
	tmp.Size = UDim2.new(1, -24, 0, 24)
	tmp.BackgroundTransparency = 1
	tmp.BorderColor3 = Color3.new(0.9, 0.9, 0.9)
	local convertOffset = Instance.new("ImageButton", tmp)
	convertOffset.Size = UDim2.new(0, 16, 0, 16)
	convertOffset.Position = UDim2.new(1, -8, 0, 4)
	convertOffset.BackgroundColor3 = Color3.new(0, 0.6, 1)
	convertOffset.BorderColor3 = Color3.new(0.8, 0.8, 0.8)
	convertOffset.AutoButtonColor = false
	convertOffset.Image = "rbxasset://textures/DeveloperFramework/checkbox_checked_light.png"
	convertOffset:SetAttribute("value", true)
	convertOffset.MouseButton1Click:Connect(function()
		local value = not convertOffset:GetAttribute("value")
		if value then
			convertOffset.BackgroundColor3 = Color3.new(0, 0.6, 1)
			convertOffset.Image = "rbxasset://textures/DeveloperFramework/checkbox_checked_light.png"
		else
			convertOffset.BackgroundColor3 = Color3.new(1, 1, 1)
			convertOffset.Image = ""
		end
		convertOffset:SetAttribute("value", value)
	end)
	local done = Instance.new("TextButton", configWidget)
	done.Size = UDim2.new(0, 72, 0, 24)
	done.Name = "zzzzzzzzzz"
	done.Text = "Done"
	done.MouseButton1Click:Wait()
	local config = {["configOffset"] = convertOffset:GetAttribute("value")}
	
	str = string.gsub(str, "\\\\", "--")
	local lines = string.split(str, "\n")
	for i,v in ipairs(lines) do
		local _, b = string.find(v, "\".-\"")
		if b then
			lines[i] = string.sub(v, 1, b) .. ":" .. string.sub(v, b + 1)
		end
		local _, c = string.gsub(v, "\"", "")
		local _, d = string.gsub(v, "}", "")
		local e = 0
		if lines[i + 1] ~= nil then
			_, e = string.gsub(lines[i + 1], "}", "")
		end
		if (c >= 4 or d >= 1) and not (e >= 1) then
			lines[i] = lines[i] .. ","
		end
	end
	local result = ""
	for i,v in ipairs(lines) do
		result = result .. v
	end
	local guiTable = http:JSONDecode("{" .. string.sub(result, 1, -2) .. "}")
	print(guiTable)
	return
end
