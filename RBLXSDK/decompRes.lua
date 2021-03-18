local http = game:GetService("HttpService")

--[[big mc thankies from mc spankies to nobody cause I had to write this myself]]

local function parse(str)
	local tbl = {}
	local cursor = 0
	repeat
		-- KEY --
		
		local _, entryStart = string.find(str, "%s*", cursor) 
		-- the character before the key
		
		local key, keyStart, keyEnd = nil, nil, nil
		keyStart = entryStart + 1
		-- start of key
		
		if string.sub(str, keyStart, keyStart) == "\""  then -- if first character of the key is a quote
			_, keyEnd = string.find(str, "[^\\]\"", keyStart + 1)
			-- end of key
			
			key = string.sub(str, keyStart + 1, keyEnd - 1)
			-- the key name
		else
			_, keyEnd = string.find(str, "%s", keyStart)
			keyEnd = keyEnd - 1
			-- end of key
			
			key = string.sub(str, keyStart, keyEnd):gsub("+", " ")
			-- the key name
		end
		
		-- VALUE --
		
		local _, entryStart = string.find(str, "%s*", keyEnd + 1)
		-- the character before the value
		
		local value, valueStart, valueEnd, valueType = nil, nil, nil, nil
		valueStart = entryStart + 1
		-- start of value
		
		if string.sub(str, entryStart + 1, entryStart + 1) == "\"" then -- if first character of the value is a quote
			valueType = "string"
			-- type of the value
			
			_, valueEnd = string.find(str, "[^\\]\"", valueStart)
			-- end of value
			
			value = string.sub(str, valueStart + 1, valueEnd - 1)
			-- the value content
		else
			_, valueEnd = string.find(str, "%s", valueStart + 1)
			valueEnd = valueEnd - 1
			-- end of value
			
			value = string.sub(str, valueStart, valueEnd)
			-- the value content
			
			if value:match("/") then -- if the value contains a slash
				valueType = "directory"
				-- type of the value
				
			elseif value:match("^[%d%.]*$") then -- if the value is entirely didgets
				valueType = "number"
				-- type of the value
				
				value = tonumber(value)	
				-- the value content
			elseif value == "{" then -- if the values is the start of a table
				valueType = "table"
				-- type of the value
				
				local tblCursor, bracketRatio, i = 0, 0, 0
				tblCursor = valueStart + 1
				-- first character of the key name
				
				repeat
					i = i + 1
					local _, t = string.find(str, ".-[{}]", tblCursor)
					-- next open or closed bracket
					
					if str:sub(t, t) == "{" then -- if the bracket is open
						bracketRatio = bracketRatio + 1
						-- increase the ratio by 1
						
					elseif str:sub(t, t) == "}" then -- if the bracket is closed
						bracketRatio = bracketRatio - 1
						-- decrease the ratio by 1
						
					end
					tblCursor = t + 1
					-- one character after the current bracket
					
				until bracketRatio <= 0 or i > 20000 or t == nil
				
				value = parse(string.sub(str, valueStart + 1, tblCursor - 1))
				-- the value content
			else
				valueType = "string"
			end
		end
		cursor = valueEnd
		print("keyvalue : " .. tostring(key) .. ", " .. tostring(value))
		tbl[key] = value:gsub("\n", "")
		local _, nextEntry = string.find(str, "%s*", cursor)
	until nextEntry >= #str
	return tbl
end

function run(str)
	local tbl = parse(str)
	return tbl
end

return run
