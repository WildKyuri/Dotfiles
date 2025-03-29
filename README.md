# :city_sunset: Dotfiles

Here you will find many configs for:

- Tools

  - nvim
  - zsh
  - powerlevel10k
  - fastfetch

- Terminals

  - kitty
  - wezterm
  - Windows Powershell

- Tiling Windows Manager
  - GlazeWM (Windows)
  - Hyprland (Arch)

## Hyprland

All configs for: (pc/laptop)

- waybar
- hyprlock
- hyprpaper
- hypridle
- swaync

## Neovim

### :diamonds: Requirements and tools

- NodeJS & npm
- C compiler (environment variables Win)
  - https://github.com/niXman/mingw-builds-binaries/releases
- fd
- fzf
- ripgrep

## :crystal_ball: Neovim files structure

```
📂 LOCATION
├───📂lua/
|     └──📂config/
|     |  └──🔰autocmds.lua
|     |  └──🔰keymaps.lua
|     |  └──🔰lazy.lua
|     |  └──🔰options.lua
|     └──📂plugins/
├───🔰init.lua
├───🔰lazy-lock.json
├───🔰Lazyvim.json
└───🔰stylua.toml
```

### :rocket: Installation

Clone the repository.

```bash
https://github.com/WildKyuri/Dotfiles
```

Moves the configs files into:

Windows:
`Appdata\local\nvim\`

Linux:
`~/.config/nvim/`

Finally just run nvim normally

## Customization

- Dashboard (snacks)
  - https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text
