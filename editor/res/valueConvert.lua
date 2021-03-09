return {setmetatable({}, {__call = function(_, str)
		local r, g, b, a = seperateValues(str)
		return {["Color"] = Color3.fromRGB(r, g, b), ["Alpha"] = a}
	end,}), setmetatable({}, {__call = function(_, x, y)
		local pos = UDim2.new()
		local function strToScale(str)
			if str == "r" then
				return 1, -1
			elseif str == "l" then
				return 0, 1
			elseif str == "b" then
				return 1, -1
			elseif str == "t" then
				return 0, 1
			else
				return nil
			end
		end
		if resLibrary.convOff then
			
		else
			local scale, sign = strToScale(string.match(x, "^%w?"))
			pos.X.Offset = tonumber(string.gsub(x, "[%D*%.*]", "")) * sign
			pos.X.Scale = scale
			local scale, sign = strToScale(string.match(y, "^%w?"))
			pos.Y.Offset = tonumber(string.gsub(y, "[%D*%.*]", "")) * sign
			pos.Y.Scale = scale
		end
		return pos
	end,}), setmetatable({}, {__call = function(_, val)
		if val >= 1 then
			return true
		else
			return false
		end
	end,})}
