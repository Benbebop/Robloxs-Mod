local http = game:GetService("HttpService")

return function(str)
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
	return http:JSONDecode("{" .. string.sub(result, 1, -2) .. "}")
end
