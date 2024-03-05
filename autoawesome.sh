clear
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
    # Instalacion de yay
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si
    cd ../
    # yay depencias
    yay -Sy awesome-git picom-git alacritty rofi todo-bin acpi acpid \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
    mpd mpc mpdris2 ncmpcpp playerctl --needed 
    # kitty
    sudo pacman -S kitty
    # zip
    sudo pacman -S unzip 
    # wget
    sudo pacman -S wget
    # feh
    sudo pacman -S feh
    

    # systemctl enable
    systemctl enable mpd.service
    systemctl start mpd.service
    sudo systemctl enable acpid.service
    sudo systemctl start acpid.service
}

function awesome(){

    yay -S awesome-git --needed --noconfirm


}

function fonts(){
    # fonts
    yay -S ttf-material-design-icons --needed --noconfirm

    yay -S ttf-iosevka

    yay -S ttf-material-design-icons

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
    yay -S zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete

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

