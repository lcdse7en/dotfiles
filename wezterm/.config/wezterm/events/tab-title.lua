-- local wezterm = require("wezterm")
--
-- -- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614
--
-- local GLYPH_SEMI_CIRCLE_LEFT = "" -- nf.ple_left_half_circle_thick
-- local GLYPH_SEMI_CIRCLE_RIGHT = "" -- nf.ple_right_half_cirlce_thick
-- local GLYPH_CIRCLE = "" -- nf.fa_circle
-- local GLYPH_ADMIN = "󰞀" -- nf.md_shield_half_full
--
-- local M = {}
--
-- local __cells__ = {}
--
-- local colors = {
-- 	default = { bg = "#45475a", fg = "#1c1b19" },
-- 	is_active = { bg = "#7FB4CA", fg = "#11111b" },
-- 	hover = { bg = "#587d8c", fg = "#1c1b19" },
-- }
--
-- local _set_process_name = function(s)
-- 	local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
-- 	return a:gsub("%.exe$", "")
-- end
--
-- local _set_title = function(process_name, base_title, max_width, inset)
-- 	local title
-- 	inset = inset or 6
--
-- 	if process_name:len() > 0 then
-- 		title = process_name .. " ~ " .. base_title
-- 	else
-- 		title = base_title
-- 	end
--
-- 	if title:len() > max_width - inset then
-- 		local diff = title:len() - max_width + inset
-- 		title = wezterm.truncate_right(title, title:len() - diff)
-- 	end
--
-- 	return title
-- end
--
-- local _check_if_admin = function(p)
-- 	if p:match("^Administrator: ") then
-- 		return true
-- 	end
-- 	return false
-- end
--
-- ---@param fg string
-- ---@param bg string
-- ---@param attribute table
-- ---@param text string
-- local _push = function(bg, fg, attribute, text)
-- 	table.insert(__cells__, { Background = { Color = bg } })
-- 	table.insert(__cells__, { Foreground = { Color = fg } })
-- 	table.insert(__cells__, { Attribute = attribute })
-- 	table.insert(__cells__, { Text = text })
-- end
--
-- M.setup = function()
-- 	wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, hover, max_width)
-- 		__cells__ = {}
--
-- 		local bg
-- 		local fg
-- 		local process_name = _set_process_name(tab.active_pane.foreground_process_name)
-- 		local is_admin = _check_if_admin(tab.active_pane.title)
-- 		local title = _set_title(process_name, tab.active_pane.title, max_width, (is_admin and 8))
--
-- 		if tab.is_active then
-- 			bg = colors.is_active.bg
-- 			fg = colors.is_active.fg
-- 		elseif hover then
-- 			bg = colors.hover.bg
-- 			fg = colors.hover.fg
-- 		else
-- 			bg = colors.default.bg
-- 			fg = colors.default.fg
-- 		end
--
-- 		local has_unseen_output = false
-- 		for _, pane in ipairs(tab.panes) do
-- 			if pane.has_unseen_output then
-- 				has_unseen_output = true
-- 				break
-- 			end
-- 		end
--
-- 		-- Left semi-circle
-- 		_push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)
--
-- 		-- Admin Icon
-- 		if is_admin then
-- 			_push(bg, fg, { Intensity = "Bold" }, " " .. GLYPH_ADMIN)
-- 		end
--
-- 		-- Title
-- 		_push(bg, fg, { Intensity = "Bold" }, " " .. title)
--
-- 		-- Unseen output alert
-- 		if has_unseen_output then
-- 			_push(bg, "#FFA066", { Intensity = "Bold" }, " " .. GLYPH_CIRCLE)
-- 		end
--
-- 		-- Right padding
-- 		_push(bg, fg, { Intensity = "Bold" }, " ")
--
-- 		-- Right semi-circle
-- 		_push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)
--
-- 		return __cells__
-- 	end)
-- end
--
-- return M

local wezterm = require("wezterm")

-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614

local GLYPH_SEMI_CIRCLE_LEFT = ""
-- local GLYPH_SEMI_CIRCLE_LEFT = utf8.char(0xe0b6)
local GLYPH_SEMI_CIRCLE_RIGHT = ""
-- local GLYPH_SEMI_CIRCLE_RIGHT = utf8.char(0xe0b4)
local GLYPH_CIRCLE = ""
-- local GLYPH_CIRCLE = utf8.char(0xf111)
local GLYPH_ADMIN = "ﱾ"
-- local GLYPH_ADMIN = utf8.char(0xfc7e)

local M = {}

M.cells = {}

M.colors = {
	default = {
		bg = "#8C246F",
		fg = "#0F2536",
	},
	is_active = {
		bg = "#248C6E",
		fg = "#0F2536",
	},

	hover = {
		bg = "#786D22",
		fg = "#0F2536",
	},
}

M.set_process_name = function(s)
	local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
	return a:gsub("%.exe$", "")
end

M.set_title = function(process_name, static_title, active_title, max_width, inset)
	local title
	inset = inset or 6

	if process_name:len() > 0 and static_title:len() == 0 then
		title = "󰣇  " .. process_name .. " ~ " .. " "
	elseif static_title:len() > 0 then
		title = "󰴈  " .. static_title .. " ~ " .. " "
	else
		title = "󰌽  " .. active_title .. " ~ " .. " "
	end

	if title:len() > max_width - inset then
		local diff = title:len() - max_width + inset
		title = wezterm.truncate_right(title, title:len() - diff)
	end

	return title
end

M.check_if_admin = function(p)
	if p:match("^Administrator: ") then
		return true
	end
	return false
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
M.push = function(bg, fg, attribute, text)
	table.insert(M.cells, { Background = { Color = bg } })
	table.insert(M.cells, { Foreground = { Color = fg } })
	table.insert(M.cells, { Attribute = attribute })
	table.insert(M.cells, { Text = text })
end

M.setup = function()
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		M.cells = {}

		local bg
		local fg
		local process_name = M.set_process_name(tab.active_pane.foreground_process_name)
		local is_admin = M.check_if_admin(tab.active_pane.title)
		local title = M.set_title(process_name, tab.tab_title, tab.active_pane.title, max_width, (is_admin and 8))

		if tab.is_active then
			bg = M.colors.is_active.bg
			fg = M.colors.is_active.fg
		elseif hover then
			bg = M.colors.hover.bg
			fg = M.colors.hover.fg
		else
			bg = M.colors.default.bg
			fg = M.colors.default.fg
		end

		local has_unseen_output = false
		for _, pane in ipairs(tab.panes) do
			if pane.has_unseen_output then
				has_unseen_output = true
				break
			end
		end

		-- Left semi-circle
		M.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)

		-- Admin Icon
		if is_admin then
			M.push(bg, fg, { Intensity = "Bold" }, " " .. GLYPH_ADMIN)
		end

		-- Title
		M.push(bg, fg, { Intensity = "Bold" }, " " .. title)

		-- Unseen output alert
		if has_unseen_output then
			M.push(bg, "#FF3B8B", { Intensity = "Bold" }, " " .. GLYPH_CIRCLE)
		end

		-- Right padding
		M.push(bg, fg, { Intensity = "Bold" }, " ")

		-- Right semi-circle
		M.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

		return M.cells
	end)
end

return M

-- local CMD_ICON = utf8.char(0xe62a)
-- local NU_ICON = utf8.char(0xe7a8)
-- local PS_ICON = utf8.char(0xe70f)
-- local ELV_ICON = utf8.char(0xfc6f)
-- local WSL_ICON = utf8.char(0xf83c)
-- local YORI_ICON = utf8.char(0xf1d4)
-- local NYA_ICON = utf8.char(0xf61a)
--
-- local VIM_ICON = utf8.char(0xe62b)
-- local PAGER_ICON = utf8.char(0xf718)
-- local FUZZY_ICON = utf8.char(0xf0b0)
-- local HOURGLASS_ICON = utf8.char(0xf252)
-- local SUNGLASS_ICON = utf8.char(0xf9df)
--
-- local PYTHON_ICON = utf8.char(0xf820)
-- local NODE_ICON = utf8.char(0xe74e)
-- local DENO_ICON = utf8.char(0xe628)
-- local LAMBDA_ICON = utf8.char(0xfb26)
--
-- local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
-- local SOLID_LEFT_MOST = utf8.char(0x2588)
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)
-- local ADMIN_ICON = utf8.char(0xf49c)
