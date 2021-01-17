#!/bin/bash

function install_pkg {
        name="$1"
        OS="$(grep ID_LIKE /etc/os-release | sed 's/.*=//')"
        case "$OS" in
                debian)
                        echo "Installing '"$name"' via apt"
                        sudo apt install "$name"
                        ;;
                arch)
                        echo "Installing '"$name"' via pacman"
                        sudo pacman -S --needed "$name"
                        ;;
                *)
                        echo "Unknown OS $OS...exiting"
                        ;;
        esac
}

function install_if_missing {
        cmd="$1"
        pkg="${2:-$cmd}"
        echo -n "Checking for $pkg..."
        which "$cmd" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
                echo found
        else
                echo "installing"
                install_pkg "$pkg"
        fi
}

install_if_missing ansible
install_if_missing git

git clone https://github.com/tracemeyers/dotfiles ~/.config/dotfiles.git
