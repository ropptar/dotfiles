local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Visual
config.font = wezterm.font 'Hack Nerd Font Mono'
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- Programs
config.default_prog = { '/usr/bin/fish', '-l' }

return config
