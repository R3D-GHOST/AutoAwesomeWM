#!/bin/bash

echo "Iniciando script"
clear

# Function to display banner
function banner() {
    echo " █████╗ ██╗   ██╗████████╗ ██████╗  █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗"
    echo "██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝"
    echo "███████║██║   ██║   ██║   ██║   ██║███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗     (R3D-GH0ST)"
    echo "██╔══██║██║   ██║   ██║   ██║   ██║██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  "
    echo "██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗"
    echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
}

# Function to install dependencies
function depe() {
    clear
    # Install paru
    sudo pacman -S --needed base-devel git
    if [ ! -d "paru" ]; then
        git clone https://aur.archlinux.org/paru.git
    fi
    cd paru
    makepkg -si
    cd ..
    sleep 2
    clear

    # Install dependencies via paru
    paru -Sy --needed awesome-git picom-git alacritty rofi todo-bin acpi acpid \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
    mpd mpc mpdris2 ncmpcpp playerctl kitty unzip wget feh

    # Enable and start services
    sudo systemctl enable --now mpd.service
    sudo systemctl enable --now acpid.service
}

# Function to install awesome-git
function awesome() {
    paru -S --needed --noconfirm awesome-git
}

# Function to install fonts
function fonts() {
    # Install fonts
    paru -S --needed --noconfirm ttf-material-design-icons ttf-iosevka

    sleep 1

    sudo unzip config.zip

    cp config/.Xresources $HOME
    cp config/.profile $HOME
    cp -r config/* "$HOME"/.config

    sleep 1

    clear

    sudo unzip files/iconmoon.zip -d files/
    sudo mv files/icomoon/*.ttf /usr/share/fonts
    sudo cp -r Hack.zip /usr/share/fonts
    sudo unzip /usr/share/fonts/Hack.zip -d /usr/share/fonts/
    sudo fc-cache -fv
}

# Function to configure system
function config() {
    # Install p10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    
    # Install p10k for root
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
    clear
    
    # Kitty config
    sudo cp -r config/kitty /root/.config/
    sudo cp -r config/kitty /opt/
    
    # Zsh configuration
    cp .zshrc ~/
    sudo cp .zshrc /root/
    cp .p10k.zsh ~/
    sudo cp .p10k.zsh-root /root/

    # Install zsh plugins
    paru -S --needed --noconfirm zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete

    # Install and configure sudo plugin for zsh
    sudo mkdir -p /usr/share/zsh-sudo
    sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -O /usr/share/zsh-sudo/sudo.plugin.zsh

    # Set zsh as the default shell
    chsh -s /usr/bin/zsh
    sudo usermod --shell /usr/bin/zsh root
    sudo ln -s -fv ~/.zshrc /root/.zshrc
}

# Main script execution
banner
depe
awesome
fonts
config

echo "Script completed successfully."
