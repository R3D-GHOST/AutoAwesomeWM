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
    yay -S picom-ibhagwan-git todo-bin alacritty rofi todo-bin acpi acpid \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
    mpd mpc mpdris2 ncmpcpp playerctl zsh-autosuggestions zsh-syntax-highlighting --needed --noconfirm
    
    sudo pacman -S kitty

    sudo pacman -S zip 

    sudo pacman -S wget

    mkdir /home/$USER/.todo/
    
    systemctl enable mpd.service
    systemctl start mpd.service
    sudo systemctl enable acpid.service
    sudo systemctl start acpid.service
}

function awesome(){

    yay -S awesome-git --needed --noconfirm

}

function fonts(){

    yay -S ttf-material-design-icons nerd-fonts-complete --needed --noconfirm

    sleep 1

    sudo unzip config.zip

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

    cp config-s4vi/.Xresources $HOME
    cp config-s4vi/.profile $HOME
    cp -r config-s4vi/* "$HOME"/.config

}


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

