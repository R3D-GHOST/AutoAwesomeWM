clear
echo "Iniciando script"
sleep 1 
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
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    # yay depencias
    yay -S picom-ibhagwan-git todo-bin alacritty rofi todo-bin acpi acpid \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
    mpd mpc mpdris2 ncmpcpp playerctl zsh-autosuggestions zsh-syntax-highlighting --needed --noconfirm
    # kitty
    sudo pacman -S kitty
    # zip
    sudo pacman -S unzip 
    # wget
    sudo pacman -S wget

    # systemctl enable
    systemctl enable mpd.service
    systemctl start mpd.service
    sudo systemctl enable acpid.service
    sudo systemctl start acpid.service
}

function awesome(){
    # Awesome
    yay -S awesome-git --needed --noconfirm

}

function fonts(){
    # fonts
    yay -S ttf-material-design-icons nerd-fonts-complete --needed --noconfirm

    sleep 1

    sudo unzip config.zip

    sudo unzip kitty.zip

    sleep 3

    clear

    sudo unzip files/iconmoon.zip
    sudo mv icomoon/*.ttf /usr/share/fonts

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
    # kitty conf
    cp -r  /config/* ~/.config/
    sudo cp -r /kitty /opt/
    sudo cp -r /config/kitty /root/.config/
    # zsh
    rm -rf ~/.zshrc
    cp -r /.zshrc ~/.zshrc
    
    # zsh root
    cp -r /.p10k.zsh ~/.p10k.zsh
    sudo cp -r /.p10k.zsh-root /root/.p10k.zsh

    # Plugins
    sudo yay -S zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete

    sudo mkdir /usr/share/zsh-sudo

    cd /usr/share/zsh-sudo

    sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

    chsh -s /usr/bin/zsh
    sudo usermod --shell /usr/bin/zsh root
    sudo ln -s -fv ~/.zshrc /root/.zshrc



}

function menu(){
    clear
    banner
    sleep 1
    echo ""
    echo "1 --> Instalar Awesome WM"
    sleep 1
    echo ""
    echo "2 --> Salir"
    echo ""
    read -p "--> " menu
    
    if [ $menu == 1 ]; then
        depe
        awesome
        fonts
        config
fi        

}

menu
