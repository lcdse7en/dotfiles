local wezterm = require("wezterm")
local platform = require("utils.platform")()
local backdrops = require("utils.backdrops")
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
	mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = "ALT|CTRL"
end

local w = require("wezterm")
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
local function is_vim(pane)
	-- This gsub is equivalent to POSIX basename(3)
	-- Given "/foo/bar" returns "bar"
	-- Given "c:\\foo\\bar" returns "bar"
	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- stylua: ignore
local keys = {
   -- misc/useful --
   { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
   { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
   { key = 'F4', mods = 'NONE', action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },
   -- { key = 'F5', mods = 'NONE', action = act.ActivateCommandPalette },
   -- {
   --    key = 'F5',
   --    mods = 'NONE',
   --    action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
   -- },
   -- toggle fullscreen
   { key = 'F11', mods = 'NONE',    action = act.ToggleFullScreen },
   { key = 'F12', mods = 'NONE',    action = act.ShowDebugOverlay },
   { key = 'f',   mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
   {
      key = 'u',
      mods = mod.SUPER,
      action = wezterm.action.QuickSelectArgs({
         label = 'open url',
         patterns = {
            'https?://\\S+',
         },
         action = wezterm.action_callback(function(window, pane)
            local url = window:get_selection_text_for_pane(pane)
            wezterm.log_info('opening: ' .. url)
            wezterm.open_with(url)
         end),
      }),
   },

   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT',  action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT',  action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't', mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
   { key = 't', mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = 'WSL:Ubuntu' }) },
   { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[', mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
   { key = ']', mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
   { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
   { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n', mods = mod.SUPER,     action = act.SpawnWindow },

   -- background controls --
   {
      key = [[/]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:random(window)
      end),
   },
   {
      key = [[,]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = [[.]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = [[/]],
      mods = mod.SUPER_REV,
      action = act.InputSelector({
         title = 'Select Background',
         choices = backdrops:choices(),
         fuzzy = true,
         fuzzy_description = 'Select Background: ',
         action = wezterm.action_callback(function(window, _pane, idx)
            ---@diagnostic disable-next-line: param-type-mismatch
            backdrops:set_img(window, tonumber(idx))
         end),
      }),
   },

   -- panes --
   -- panes: split panes
   {
      key = [[-]],
      mods = mod.SUPER,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[-]],
      mods = mod.SUPER_REV,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
   -- panes: zoom+close pane
   { key = 'z', mods = mod.SUPER_REV,     action = act.TogglePaneZoomState },
   { key = 'w',     mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation
   { key = 'K',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Up') },
   { key = 'J',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Down') },
   { key = 'H',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Left') },
   { key = 'L',     mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Right') },
   {
      key = 'p',
      mods = mod.SUPER_REV,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },

   -- panes: resize
   { key = 'UpArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Up', 1 }) },
   { key = 'DownArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Down', 1 }) },
   { key = 'LeftArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Left', 1 }) },
   { key = 'RightArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Right', 1 }) },

   -- fonts --
   -- fonts: resize
   { key = 'UpArrow', mods = mod.SUPER, action = act.IncreaseFontSize },
   { key = 'DownArrow', mods = mod.SUPER, action = act.DecreaseFontSize },
   { key = 'r', mods = mod.SUPER, action = act.ResetFontSize },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'p',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- rename tab bar
   {
      key = 'R',
      mods = 'CTRL|SHIFT',
      action = act.PromptInputLine ({
         description = 'Enter new name for tab',
         action = wezterm.action_callback(function(window, pane, line)
            -- line will be `nil` if they hit escape without entering anything
            -- An empty string if they just hit enter
            -- Or the actual line of text they wrote
            if line then
               window:active_tab():set_title(line)
            end
         end),
      }),
   },
}

-- stylua: ignore
local key_tables = {
   resize_font = {
      { key = 'k',      action = act.IncreaseFontSize },
      { key = 'j',      action = act.DecreaseFontSize },
      { key = 'r',      action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

return {
	disable_default_key_bindings = true,
	leader = { key = "Space", mods = mod.SUPER_REV },
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
