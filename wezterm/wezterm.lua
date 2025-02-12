local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
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
        key    = "-",
        mods   = "LEADER",
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key    = "=",
        mods   = "LEADER",
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
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right'
    },
}

return config
