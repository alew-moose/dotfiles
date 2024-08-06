#!/usr/bin/env lua

local function get_layout()
	local setxkbmap = io.popen("setxkbmap -query")
	local layout = string.match(setxkbmap:read("*a"), "layout%:%s*([^,]+),ru")
	setxkbmap:close()
	return layout
end

local function set_layout(layout)
	os.execute("setxkbmap -option grp:alt_shift_toggle,grp_led:scroll " ..
	             layout ..",ru")
end

local layout = get_layout()
if layout == "us(workman)" then
	set_layout("us")
elseif layout == "us" then
	set_layout("us\\(workman\\)")
end
