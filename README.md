# :city_sunset: Dotfiles

We only need some few tools

## :diamonds: Requirements and tools

It will depend on where are u working (Windows/Linux)

- NodeJS & npm
- Nerd Fonts (Hack Nerd Font)
- C compiler (environment variables)
  - https://github.com/niXman/mingw-builds-binaries/releases

This ones will depend on where are you working (Windows/Linux)

- fd
- fzf
- ripgrep

## :crystal_ball: Neovim setup

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

## :rocket: Installation

Clone the repository.

```bash
https://github.com/WildKyuri/Dotfiles
```

Moves de files inside `Dotfiles/configs/LazyVim` into

Windows:
`Appdata\local\nvim\`

Linux:
`~/.config/nvim/`

Finally just run nvim normally

## Customization

- Dashboard (snacks)
  - https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text

![Workspace](./doc/img/LazyVim1.png)

![Workspace](./doc/img/LazyVim2.png)
