# ❄️ Dotfiles — Ice Cold

A personal collection of dotfiles for a translucent, Nord-themed development environment.
Built for **Arch Linux (WSL2)** and **Windows 11**, with a single configuration source across platforms.

<p align="center">
  <img src="./assets/showcase.png" alt="Neovim + Tmux + WezTerm on WSL2" width="85%">
  <br>
  <em>Neovim · Tmux · WezTerm — running on WSL2</em>
</p>

---

## ✨ Design Philosophy

- **Cold & Minimal** — Nord palette, restrained contrast, no visual clutter
- **Translucent** — Opacity and blur that add depth without harming readability
- **Unified** — One setup for Windows UI and Linux CLI
- **Fast** — Lazy-loaded editor and lightweight shell

The goal is an environment that stays out of the way while still feeling intentional.

## 🎨 Theme & Aesthetic

- **Color Palette:** [Nord](https://www.nordtheme.com/) (Arctic Ice Studio)
- **Font:** JetBrains Mono Nerd Font
- **Style:** Minimalist · Translucent · “Ice Cold”

## 🧰 Tooling Stack

| Tool        | Purpose                                 | Config Location   |
| :---------- | :-------------------------------------- | :---------------- |
| **Neovim**  | Primary editor (Lua-based, lazy-loaded) | `.config/nvim`    |
| **Tmux**    | Terminal multiplexer                    | `.config/tmux`    |
| **WezTerm** | GPU-accelerated terminal + transparency | `.config/wezterm` |
| **Zsh**     | Interactive shell                       | `.zshrc`          |

## ⚙️ Requirements

- WSL2 with Arch Linux
- GNU Stow
- Neovim ≥ 0.9
- Tmux
- WezTerm (Windows)
- JetBrains Mono Nerd Font

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles
cd ~/dotfiles
```

### 2. Symlink Configurations (Linux / WSL)
This repository uses GNU Stow to manage symlinks.

```Bash
stow nvim tmux zsh wezterm
```
This links all configurations directly into $HOME.

### 3. Windows ↔ WSL Bridge (WezTerm)
WezTerm runs on Windows but reads its configuration from WSL. Run PowerShell as Administrator:

```PowerShell
# Remove existing config
Remove-Item "C:\Users\YOUR_USER\.config\wezterm" -Recurse -Force

# Create directory structure
New-Item -ItemType Directory -Path "C:\Users\YOUR_USER\.config\wezterm" -Force

# Link Windows path to WSL file
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\YOUR_USER\.config\wezterm\wezterm.lua" `
  -Target "\\wsl$\archlinux\home\tommy\dotfiles\wezterm\.config\wezterm\wezterm.lua"
```
This keeps the terminal UI on Windows and CLI tooling in Linux fully synchronized.

## 🧊 Key Features

- **Translucency:** WezTerm is configured with ~0.85 opacity and background blur.
- **Single Source of Truth:** One repository drives both Windows and Linux behavior.
- **Fast Startup:** Neovim plugins are loaded on demand.
- **Consistent Nord Styling:** Editor, terminal, tmux, and shell share the same palette.

## 📸 Screenshot Details

The screenshot above reflects an actual working session:
- **Neovim** editing a Rails controller
- **Tmux** managing logs, calendar, and task panes
- **WezTerm** providing translucency over a cool-toned wallpaper

## 🧠 Notes

- These dotfiles are opinionated and tailored to my workflow.
- They assume familiarity with Neovim, Tmux, and WSL.
- Feel free to fork or borrow ideas if anything here is useful.

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-Nord-88C0D0?style=for-the-badge&logo=arcticicestudio&logoColor=2E3440">
  <img src="https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white">
  <img src="https://img.shields.io/badge/WSL-0078D6?style=for-the-badge&logo=windows&logoColor=white">
</p>
