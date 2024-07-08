#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type bw >/dev/null 2>&1 && exit

case "$(uname -s)" in
Linux)
  # If pacman is installed
  if type pacman >/dev/null 2>&1; then
    sudo pacman -S --noconfirm --needed bitwarden-cli
  elseif type apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y bitwarden-cli
  elseif type zypper >/dev/null 2>&1; then
    sudo zypper install -y bitwarden-cli
  else
    echo "unsupported OS"
    exit 1
  fi
  ;;
*)
  echo "unsupported OS"
  exit 1
  ;;
esac
