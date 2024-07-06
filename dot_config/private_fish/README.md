# Rootiest Fish Configuration

```none
 ██▀███   ▒█████   ▒█████  ▄▄▄█████▓ ██▓▓█████   ██████ ▄▄▄█████▓
▓██ ▒ ██▒▒██▒  ██▒▒██▒  ██▒▓  ██▒ ▓▒▓██▒▓█   ▀ ▒██    ▒ ▓  ██▒ ▓▒
▓██ ░▄█ ▒▒██░  ██▒▒██░  ██▒▒ ▓██░ ▒░▒██▒▒███   ░ ▓██▄   ▒ ▓██░ ▒░
▒██▀▀█▄  ▒██   ██░▒██   ██░░ ▓██▓ ░ ░██░▒▓█  ▄   ▒   ██▒░ ▓██▓ ░ 
░██▓ ▒██▒░ ████▓▒░░ ████▓▒░  ▒██▒ ░ ░██░░▒████▒▒██████▒▒  ▒██▒ ░ 
░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░▒░▒░   ▒ ░░   ░▓  ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░   
  ░▒ ░ ▒░  ░ ▒ ▒░   ░ ▒ ▒░     ░     ▒ ░ ░ ░  ░░ ░▒  ░ ░    ░    
  ░░   ░ ░ ░ ░ ▒  ░ ░ ░ ▒    ░       ▒ ░   ░   ░  ░  ░    ░      
   ░         ░ ░      ░ ░            ░     ░  ░      ░           
                  █████▒██▓  ██████  ██░ ██ 
                  ▓██   ▒▓██▒▒██    ▒ ▓██░ ██▒
                  ▒████ ░▒██▒░ ▓██▄   ▒██▀▀██░
                  ░▓█▒  ░░██░  ▒   ██▒░▓█ ░██ 
                  ░▒█░   ░██░▒██████▒▒░▓█▒░██▓
                  ▒ ░   ░▓  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒
                  ░      ▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░
                  ░ ░    ▒ ░░  ░  ░   ░  ░░ ░
                        ░        ░   ░  ░  ░
```

The rootiest fish configuration you will ever see!

## Installation

1. Install [fish](https://fishshell.com/)
2. Set it as your default shell

   ```bash
   chsh -s /usr/bin/fish
   ```

3. Install pre-requisites

   - Required
      - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/) - 
      You must use a terminal/font that provides these glyphs
   - Optional
     - [lsd](https://github.com/lsd-rs/lsd) -
        Enhanced ls functionality
     - [kitty](https://sw.kovidgoyal.net/kitty/) -
        A fast, featureful, GPU based terminal emulator
     - [ripgrep](https://github.com/BurntSushi/ripgrep) -
        A faster grep
     - [fzf](https://github.com/junegunn/fzf) -
        A command-line fuzzy finder
     - [fd](https://github.com/sharkdp/fd) -
        A simple, fast and user-friendly alternative to 'find'
     - [lazygit](https://github.com/jesseduffield/lazygit) -
        A simple terminal UI for git commands

4. Install Oh-my-fish

   ```bash
   curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
   ```

5. Install the plugins and theme

   ```bash
   omf install cd colorman fish-spec fzf sudope weather battery colored-man-pages fuck grc spark tab zsh-aliases-lsd bobthefish
   ```

6. Backup your current fish configuration (if you have one)

   ```bash
   mv ~/.config/fish ~/.config/fish.bak
   ```

7. Clone the repository

   ```bash
   git clone https://github.com/rootiest/rootiest-fish.git ~/.config/fish
   ```

8. **Enjoy!** 🎉

## Notes

Nerd Font glyphs are ***required***.
Please use a terminal and font that provide them.

If you chose not to install `lsd` please
execute the following to remove the associated aliases:

   ```bash
      sh ~/.config/fish/rm-lsd-alias.sh
   ```

Failing to do so will cause the `ls` command to malfunction.

## Features

- Clean, beautiful Powerline-style prompt
- Catppuccin theme by default
- Git, environment, container, etc info on the prompt
- VIM motions and a clear mode indicator
- Colors wherever we can get them
- Integrates cleanly with other Rootiest projects

## Companion Tools

[Rootiest Kitty Conf](https://github.com/rootiest/rootiest-kitty) - A kitty configuration that is designed to work with this neovim configuration

[Rootiest Neovim](https://github.com/rootiest/rootiest-nvim) - A neovim config built to work alongside this and the kitty config.

[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/) - A collection of fonts that include many icons and glyphs that are used in this configuration. The default font is Monaspace Krypton and kitty uses the Symbols Only Nerd Font.

## Credits

- [fish shell](https://fishshell.com/)
- [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish)
