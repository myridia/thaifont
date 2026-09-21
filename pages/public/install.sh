#!/bin/sh
# ThaiFont installer — installs Myridia-Normal.otf for the current user.
set -e

VERSION="main"
URL="https://github.com/myridia/thaifont/releases/download/${VERSION}/Myridia-Normal.otf"

case "$(uname -s)" in
  Linux|FreeBSD)
    DIR="$HOME/.local/share/fonts"
    mkdir -p "$DIR"
    curl -fsSL "$URL" -o "$DIR/Myridia-Normal.otf"
    command -v fc-cache >/dev/null 2>&1 && fc-cache -f "$DIR" >/dev/null 2>&1 || true
    echo "Installed Myridia to $DIR"
    ;;
  Darwin)
    DIR="$HOME/Library/Fonts"
    mkdir -p "$DIR"
    curl -fsSL "$URL" -o "$DIR/Myridia-Normal.otf"
    echo "Installed Myridia to $DIR"
    ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    echo "See INSTALL.md for manual options or use install.ps1 on Windows." >&2
    exit 1
    ;;
esac