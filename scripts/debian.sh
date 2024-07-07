#!/usr/bin/env sh

set -o errexit -o nounset

ins="apt install -y --no-install-recommends"

install_deps() {
  # install deps
  pkgs="gnupg pass xclip fish mpd base-devel
      wget curl fd fzf mpv imagemagick luarocks
      yt-dlp yay plasma ffmpegthumbnailer
      noto-fonts-emoji otf-monaspace-nerd
      ttf-firacode-nerd ttf-noto-nerd
      tailscale"
  sudo $ins $pkgs
}

install_nvim() {
  # install latest nvim appimage
  # because the debian version is too old
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage
  mkdir -p /opt/nvim
  mv nvim.appimage /opt/nvim/nvim
}

install_kitty() {
  # install kitty
  pkgs="kitty"
  sudo $ins $pkgs
}

install_browser() {.
  # install firefox
  pkgs="firefox"
  sudo $ins $pkgs
}

install_extra_deps() {
  # install github-cli
  (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
    sudo mkdir -p -m 755 /etc/apt/keyrings &&
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
    sudo apt update &&
    sudo apt install gh -y
}

usage() {
  printf "\nUsage:\n"
  echo " --deps         Install dependencies"
  echo " --browser      Install deps for Firefox"
  echo " --nvim         Install deps for NeoVim"
  echo " --kitty        Install deps for Kitty"
  echo " --extra-deps   Install other dependencies"
}

## CLI options
DEPS=false
BROWSER=false
NVIM=false
KITTY=false
EXTRA=false

if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi

while [ "$#" -gt 0 ]; do
  case "$1" in
  --deps) DEPS=true ;;
  --browser) BROWSER=true ;;
  --nvim) NVIM=true ;;
  --kitty) KITTY=true ;;
  --extra-deps) EXTRA=true ;;
  *)
    usage
    exit 1
    ;;
  esac
  shift
done

main() {
  sudo apt update
  "$DEPS" && install_deps
  "$BROWSER" && install_browser
  "$NVIM" && install_nvim
  "$KITTY" && install_kitty
  "$EXTRA" && install_extra_deps
  exit 0
}

main "$@"
