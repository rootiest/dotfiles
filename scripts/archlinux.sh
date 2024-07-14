#!/usr/bin/env sh

set -o errexit -o nounset

ins="pacman -S --noconfirm --needed"
pkgs_aur="nerd-fonts-git"

install_deps() {
  pkgs="gnupg pass xclip fish mpd base-devel
        wget curl fd fzf mpv imagemagick
        yt-dlp yay plasma ffmpegthumbnailer
        noto-fonts-emoji
        otf-monaspace-nerd
        ttf-firacode-nerd
        ttf-noto-nerd
        ttf-nerd-fonts-symbols
        ttf-cascadia-code-nerd
        ttf-iosevkaterm-nerd
        tailscale bw pipx github-cli lazygit"
}

install_browser() {
  pkgs="$pkgs firefox"
}

install_nvim() {
  pkgs="$pkgs ripgrep nvim jq lazygit luarocks"
}

install_kitty() {
  pkgs="$pkgs kitty"
}

install_extra_deps() {
  # install extra deps
  pkgs="pre-commit github-cli"
  sudo $ins $pkgs
  # install aur packages
  for pkg in $pkgs_aur; do
    yay -S --noconfirm --needed "$pkg"
  done
  # install python deps
  pipx install ggshield pre-commit
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
  "$DEPS" && install_deps
  "$BROWSER" && install_browser
  "$NVIM" && install_nvim
  "$KITTY" && install_kitty
  sudo pacman -Syy
  sudo $ins $pkgs

  "$EXTRA" && install_extra_deps

  exit 0
}

main "$@"
