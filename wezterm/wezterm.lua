local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('CaskaydiaCove NF')
config.font_size = 14.0
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 4000 }
config.keys = {
    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action.ActivateCopyMode
    },
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
    {
        key    = 'h',
        mods   = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key    = 's',
        mods   = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '1',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(0)
    },
    {
        key = '2',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(1)
    },
    {
        key = '3',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(2)
    },
    {
        key = '4',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(3)
    },
    {
        key = '5',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(4)
    },
    {
        key = '6',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(5)
    },
    {
        key = '7',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(6)
    },
    {
        key = '8',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(7)
    },
    {
        key = '9',
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(8)
    },
    {
        key = 'LeftArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
        key = 'DownArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
        key = 'UpArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
        key = 'RightArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right'
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Left'
    },

    {
        key = 'x',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateCopyMode
    },
    {
        key = 't',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
    {
        key    = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key    = 's',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Right'
    },
}

return config
