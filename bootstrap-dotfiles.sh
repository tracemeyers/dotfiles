#!/bin/bash -e

DOTFILES_DIR=~/.config/dotfiles.git

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

function clone_dotfiles_if_missing {
	if [ ! -d "$DOTFILES_DIR" ]; then
		git clone https://github.com/tracemeyers/dotfiles "$DOTFILES_DIR"
	fi
}

install_if_missing ansible
install_if_missing git

clone_dotfiles_if_missing

cd "$DOTFILES_DIR"/ansible
ansible-playbook --ask-become-pass install-*.yaml
ansible-playbook configure-*.yaml
