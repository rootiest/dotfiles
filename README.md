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

> **Note:** This configures a complete Linux environment.  
> It is recommended to use a fresh install or backup your existing configuration.

1. Install the Rootiest dotfiles

   This command will both install chezmoi and apply the Rootiest dotfiles.

   ```bash
   sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply rootiest
   ```

   Accompanying tools and packages will be installed automatically.

   No pre-requisites are needed.

2. Answer the prompts:

   - **Username**: Your git username
   - **Email**: Your git email
   - **Using GUI**: y/n Does the system use GUIs?

   Additional prompts may be required depending on your configuration.

3. Have a coffee ☕️ while the installation completes.

4. **Enjoy!** 🎉

## Features

- Integrated [KDE Plasma Desktop](https://kde.org) profile
- Customized [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) Configuration
- Customized [Neovim](https://neovim.io/) Configuration
- Customized [Fish Shell](https://fishshell.com/) Configuration
- Built for comfort and productivity
- Works with any Linux distribution
- Automatic package installation on Arch, SUSE, and Debian based distros
- Integrates with [BitWarden Password Manager](https://bitwarden.com/)
- SSH credential management
- Git credential management
- Git commit signing with GPG
- Encryption with AGE and GPG

## Companion Repositories

These are included in Rootiest dotfiles, but can be used independently.

[Rootiest Fish Configuration](https://github.com/rootiest/rootiest-fish) -
Fish shell configuration that pairs well with this configuration.

[Rootiest Neovim Configuration](https://github.com/rootiest/rootiest-nvim) -
A neovim config built to work alongside this configuration.

## Credits

- [kitty](https://sw.kovidgoyal.net/kitty/)
- [kitty-scrollback](https://github.com/mikesmithgh/kitty-scrollback.nvim)
- [kitty-search](https://github.com/trygveaa/kitty-kitten-search)
- [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
