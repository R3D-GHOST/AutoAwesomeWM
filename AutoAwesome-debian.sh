echo "Iniciando script"
clear
#banner 
function banner(){

        echo " █████╗ ██╗   ██╗████████╗ ██████╗  █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗"
        echo "██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝"
        echo "███████║██║   ██║   ██║   ██║   ██║███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗     (R3D-GH0ST)"
        echo "██╔══██║██║   ██║   ██║   ██║   ██║██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  "
        echo "██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗"
        echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"

}

function depe(){
    
    clear
    # Actualizar e instalar dependencias
    sudo apt update
    sudo apt upgrade -y

    # Instalación de dependencias
    sudo apt install -y git build-essential curl wget unzip feh \
    awesome picom alacritty rofi acpi acpid wireless-tools jq \
    inotify-tools policykit-1-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm-sensors \
    mpd mpc mpdris2 ncmpcpp playerctl kitty zsh zsh-syntax-highlighting \
    zsh-autosuggestions zsh-autocomplete

    # Habilitar y iniciar servicios
    sudo systemctl enable mpd.service
    sudo systemctl start mpd.service
    sudo systemctl enable acpid.service
    sudo systemctl start acpid.service
}

function awesome(){

    sudo apt install -y awesome

}

function fonts(){
    # Instalar fuentes
    sudo apt install -y fonts-font-awesome fonts-iosevka

    sleep 1

    sudo unzip config.zip

    cp config/.Xresources $HOME
    cp config/.profile $HOME
    cp -r config/* "$HOME"/.config

    sleep 1

    clear

    sudo unzip files/iconmoon.zip
    cd files/
    sudo mv icomoon/*.ttf /usr/share/fonts
    cd ../
    sudo cp -r Hack.zip /usr/share/fonts
    cd /usr/share/fonts/
    clear
    sudo unzip Hack.zip
    cd
}

function config(){

    # Instalando p10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    
    # Instalando p10k root
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
    clear
    
    # kitty conf
    sudo cp -r /kitty /opt/
    sudo cp -r /config/kitty /root/.config/
    # zsh
    rm -rf ~/.zshrc
    cp -r .zshrc ~/
    
    # zsh root
    cp -r .p10k.zsh ~/.
    sudo cp -r .p10k.zsh-root /root/

    # Plugins
    sudo mkdir /usr/share/zsh-sudo

    cd /usr/share/zsh-sudo

    sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

    chsh -s /usr/bin/zsh
    sudo usermod --shell /usr/bin/zsh root
    sudo ln -s -fv ~/.zshrc /root/.zshrc

}

banner
depe
awesome
fonts
config
