#!/bin/bash

# PREFACE: This is a script that I made to automate the process of configuring Ubuntu/Debian based distros
# This program is really meant for me but you can use it for your own install if you wish!

# Main function that run the other functions

function main {

    apt_install_apps
    vscodium_install
    spotdl_install
    razer_peripherals

    echo "Your system is now configured fully"

    neofetch
    echo "Thanks for using my program. Take care and enjoy your new Linux install :)"



}

function flatpak_install_apps {
    read -p "Would you like to install Flatpak apps? (Y/n): " flatpak_choice
    
    if [ $flatpak_install_apps == "Y" -o $flatpak_install_apps == "y" ];
    then
        # Installs graphical design software (Inkscape, Krita)

        flatpak install org.kde.krita org.inkscape.Inkscape -y

        # Installs my gaming suite (Prism Launcher, Lutris, steam is installed in the main script)

        flatpak install org.prismlauncher.PrismLauncher net.lutris.Lutris org.libretro.RetroArch net.davidotek.pupgui2 -y

    else
        continue
    fi
}


# Function that deals with VSCodium install

function vscodium_install {
    read -p "Would you like to install VSCodium? (Y/n): " vscodium_choice

    if [ $vscodium_choice == "Y" -o $vscodium_choice == "y" ];
    then
        wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \ | gpg --dearmor \ | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    
        echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \ | sudo tee /etc/apt/sources.list.d/vscodium.list
    
        sudo apt update && sudo apt install codium
    
    elif [ $vscodium_choice == "N" -o $vscodium_choice == "n" ];
    then
        continue
    else
        continue
    fi
}

# Function that deals with apt packages (upgrade/install)

function apt_install_apps {
    sudo apt update && sudo apt upgrade
    sudo apt install htop neofetch vlc ranger rhythmbox python3-pip tilix vim neovim audacity steam gamemode gimp transmission btop ffmpeg -y
    
    read -p "Would you like to install Microsoft Fonts? (Y/n): " microfonts_choice

    if [ $microfonts_choice == "Y" -o $microfonts_choice == "y" ]; then
        sudo apt-get -y install ttf-mscorefonts-installer
    
    elif [ $microfonts_choice == "N" -o $microfonts_choice == "n" ]; then
        continue
    else
        continue
    fi
}

# Installs and confihures spotdl and yt-dlp

function spotdl_install {
    # Sets up a PATH variable to /home/$USER/.local/bin (required for running scripts after)

    echo "export PATH=$PATH:/home/$USER/.local/bin" >> /home/$USER/.bashrc

    #Sets up my media downloading kit (spotdl for music, yt-dlp for videos & audio files also)
    #yt-dlp is installed as a dependency of spotdl
 
    pip3 install spotdl 
}

# Sets up Razer software (openrazer, polychromatic)

function razer_peripherals {
    # OPENRAZER

    sudo gpasswd -a $USER plugdev
    sudo add-apt-repository ppa:openrazer/stable
    sudo apt update
    sudo apt install openrazer-meta -y

    # POLYCHROMATIC

    sudo add-apt-repository ppa:polychromatic/stable
    sudo apt update
    sudo apt install polychromatic -y
}

# main function is called

main









