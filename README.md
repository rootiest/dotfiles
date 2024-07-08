# Rootiest Dotfiles

```none
 ███████████                      █████     ███                    █████
░░███░░░░░███                    ░░███     ░░░                    ░░███
 ░███    ░███   ██████   ██████  ███████   ████   ██████   █████  ███████
 ░██████████   ███░░███ ███░░███░░░███░   ░░███  ███░░███ ███░░  ░░░███░
 ░███░░░░░███ ░███ ░███░███ ░███  ░███     ░███ ░███████ ░░█████   ░███
 ░███    ░███ ░███ ░███░███ ░███  ░███ ███ ░███ ░███░░░   ░░░░███  ░███ ███
 █████   █████░░██████ ░░██████   ░░█████  █████░░██████  ██████   ░░█████
░░░░░   ░░░░░  ░░░░░░   ░░░░░░     ░░░░░  ░░░░░  ░░░░░░  ░░░░░░     ░░░░░



 ██████████             █████       ██████   ███  ████
░░███░░░░███           ░░███       ███░░███ ░░░  ░░███
 ░███   ░░███  ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████
 ░███    ░███ ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░
 ░███    ░███░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████
 ░███    ███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███
 ██████████  ░░██████   ░░█████   █████     █████ █████░░██████  ██████
░░░░░░░░░░    ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░


                           █████████████
                       ████
                    █████
                  ███
                ███
               ███
              ███  █
             ███ █
             ████    █
            █████     ███
            ████        █████████
            ████           ████████████               ███
            ███                   █████████        █████
            ████   █           ███   ███████████  █████
             ███   █              █████████████    ███
             ███   █               █    ████████    ██
              ███  █                 █████████████  ██
               ██████                      ██████████
                 █████                        ██████
                  ██████                    ███████
                     █████                ███████
                        ████████ █████████████
                            ██████████████


```

The Rootiest dotfiles you will ever see!

## Installation

> **NOTE:** This configures a **complete** Linux environment.

It is strongly recommended to use a fresh install
or backup your existing configuration.

Accompanying tools and packages will be installed automatically.

No pre-requisites are required, just a working internet connection.

### Installation Steps

1. **Install** the Rootiest dotfiles 📜

   This command will both install chezmoi and apply the Rootiest dotfiles.

   ```bash
   sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply rootiest
   ```

2. Have a coffee ☕️ while the configuration installs.

3. **Enjoy!** 🎉

## Features

- Integrated [KDE Plasma Desktop](https://kde.org) profile
- Customized [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
  Configuration
- Customized [Neovim](https://neovim.io/) Configuration
- Customized [Fish Shell](https://fishshell.com/) Configuration
- Custom Rootiest [QMK](https://qmk.fm/) Fork
- Built for comfort and productivity
- [Catppuccin](https://github.com/catppuccin/catppuccin) theme used
  across all applications:
  - Frappe for night mode
  - Latte for day mode
- Other included themes: Tokyo Night, Ayu, and more
- KDE, VSCode, firefox, chromium, neovim, kitty, fish, and more
- Integrates seamlessly with my other repositories
- Neovim integrates with chezmoi, kitty, and fish
- Works with any Linux distribution
- Automatic package installation on Arch, SUSE, and Debian based distros
- Integrates with [BitWarden Password Manager](https://bitwarden.com/)
- SSH credential management
- Git credential management
- Git commit signing with GPG
- Encryption with AGE and GPG

## Screenshots

<details>
   <summary>KDE</summary>

Night Mode: (default)
![KDE Dark](https://raw.githubusercontent.com/rootiest/dotfiles/main/.screenshots/kde-night.png)

Day Mode:
![KDE Light](https://raw.githubusercontent.com/rootiest/dotfiles/main/.screenshots/kde-day.png)

</details>

<details>
   <summary>NeoVim</summary>

![NeoVim UI](https://raw.githubusercontent.com/rootiest/dotfiles/main/.screenshots/neovim.png)

</details>

<details>
   <summary>Kitty and Fish</summary>

![Kitty and Fish](https://raw.githubusercontent.com/rootiest/dotfiles/main/.screenshots/kitty-fish.png)

</details>

## Trying it out

If you want to try out the configuration without installing it,
you can use the following command:

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply rootiest --dry-run
```

This will show you what would be installed without actually installing it.

## Updating

To update the Rootiest dotfiles,
you can use the following command:

```bash
chezmoi update
```

This will update the configuration to the latest version.

## Companion Repositories

These are included in Rootiest dotfiles, but can be used independently.

[Rootiest Fish Configuration](https://github.com/rootiest/rootiest-fish) -
Fish shell configuration that pairs well with this configuration.

[Rootiest Neovim Configuration](https://github.com/rootiest/rootiest-nvim) -
A Neovim config built to work alongside this configuration.

## Credits

- [chezmoi](https://github.com/twpayne/chezmoi)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [kitty-scrollback](https://github.com/mikesmithgh/kitty-scrollback.nvim)
- [kitty-search](https://github.com/trygveaa/kitty-kitten-search)
- [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
