local http = game:GetService("HttpService")

return function(str)
	local str = [["//PLATFORM/resource/colorpickerframe.res"
{
	"ColorPickerFrame"
	{
		"ControlName"	"CColorPickerFrame"
		"fieldName"		"ColorPickerFrame"
		"xpos"			"147"
		"ypos"			"128"
		"wide"			"450"
		"tall"			"375"
		"AutoResize"	"0"
		"PinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"settitlebarvisible"	"1"
		"title"		"Select Color"
		
		"OkButton"
		{
			"ControlName"		"Button"
			"fieldName"		"OkButton"
			"xpos"		"10"
			"ypos"		"335"
			"wide"		"130"
			"tall"		"24"
			"autoResize"		"0"
			"pinCorner"		"2"
			"visible"		"1"
			"enabled"		"1"
			"tabPosition"		"2"
			"labelText"		"Ok"
			"textAlignment"		"center"
			"dulltext"		"0"
			"brighttext"		"0"
			"Default"		"1"
		}

		"CancelButton"
		{
			"ControlName"		"Button"
			"fieldName"		"CancelButton"
			"xpos"		"160"
			"ypos"		"335"
			"wide"		"130"
			"tall"		"24"
			"autoResize"	"0"
			"pinCorner"		"2"
			"visible"		"1"
			"enabled"		"1"
			"tabPosition"	"3"
			"labelText"		"Cancel"
			"textAlignment"	"center"
			"dulltext"		"0"
			"brighttext"		"0"
			"Default"		"0"
		}
		
		"ColorPicker"
		{
			"ControlName"	"CColorPicker"
			"fieldName"		"ColorPicker"
			"xpos"			"0"
			"ypos"			"28"
			"wide"			"450"
			"tall"			"300"
			"AutoResize"	"3"
			"PinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"tabPosition"	"1"
			"settitlebarvisible"	"1"
			"title"		"#Frame_Untitled"
		}
	}
}
]]
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
