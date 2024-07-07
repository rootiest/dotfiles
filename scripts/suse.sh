#!/usr/bin/env sh

set -o errexit -o nounset

ins="zypper install -y --no-recommends"

install_deps() {
    # install deps
    pkgs="gnupg pass xclip fish mpd base-devel
    wget curl fd fzf mpv imagemagick luarocks
    yt-dlp yay plasma ffmpegthumbnailer
    noto-fonts-emoji otf-monaspace-nerd
    ttf-firacode-nerd ttf-noto-nerd
    tailscale github-cli bw"
    sudo $ins $pkgs
}

install_nvim() {
    # install NeoVim
    pkgs="neovim"
    sudo $ins $pkgs
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
    sudo $ins github-cli
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
    "$EXTRA" && install_extra_deps
    exit 0
}

main "$@"
