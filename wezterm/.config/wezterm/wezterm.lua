local wezterm = require 'wezterm'
local config = {}

-- Use the config_builder if possible
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_domain = 'WSL:archlinux'

config.wsl_domains = {
    {
        name = 'WSL:archlinux',
        distribution = 'archlinux', -- This must match the name in 'wsl -l -v'
        default_cwd = '~',
    },
}

config.use_fancy_tab_bar = false

config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false

config.colors = {
    tab_bar = {
        background = 'rgba(0, 0, 0, 0)',
        active_tab = {
            bg_color = 'none',
            fg_color = 'none',
        },
        inactive_tab = {
            bg_color = 'none',
            fg_color = 'none',
        },
    },
}

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    return ""
end)

config.font = wezterm.font("MesloLGS NF")
config.font_size = 12

config.window_decorations = "RESIZE"

config.color_scheme = 'nord'

config.window_background_opacity = 0.92

config.audible_bell = "Disabled"

return config
