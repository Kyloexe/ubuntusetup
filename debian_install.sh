# Welcome to my debian installation script!
# This script is meant for Debian systems only, to use the Ubuntu script see ubuntu_install.sh

# Updates the apt cache and then installs all pending updates

sudo apt update && sudo apt upgrade -y

# Installs the latest NVIDIA driver along with all dependancies (nvidia-smi, nvidia-settings)
# N.B: To set up the X Server see xserver-setup

sudo apt install nvidia-driver

# Installs all of my favourite programs, change this if you want!

# Explaination of software
# htop: a system monitor based in the terminal, similar to btop but more advanced
# neofetch: Prints out your system's info in the terminal, a must have for showing off on r/unixporn
# vlc: A media player that supports basically every media codec under the sun
# ranger: A file manager based in the terminal, is very powerful if you know vim shortcuts
# rhythmbox: An advanced music player made by GNOME
# python3-pip: A package manager with packages made exclusivly in Python
# tilix: A tiling terminal emulator (my favourite). Based on GNOME Terminal
# vim: (VI Improved) is based on the fossil that is the VI text editor. Vim is more modern but still very bare bones
# neovim: Is vim but on crack. Has all the modern luxuries of an IDE but still using the terminal
# audacity: An open source audio recording and editing software
# steam: The main program that allows you to play PC games
# gamemode: Also known as Feral Gamemode, this program uses system calls to make your system gaming ready
# gimp: Also known as GNU Image Manipulation Program, GIMP is the open-source equivilent of Adobe Photoshop
# transmission: is a torrenting program, basically a client for BitTorrent
# ffmpeg: Allows you to convert one media format to another (think .webm to .mp4)


sudo apt install htop neofetch vlc ranger rhythmbox python3-pip tilix vim neovim audacity steam gamemode gimp transmission ffmpeg spotify-client -y

# Sets up VSCodium (uses an external script)

bash vscodium_install

# Installs Microsoft fonts (They're basically a must have for the working world)

sudo apt-get -y install ttf-mscorefonts-installer

# Sets up a PATH variable to /home/$USER/.local/bin (required for running scripts after)

echo "export PATH=$PATH:/home/$USER/.local/bin" >> /home/$USER/.bashrc

# Sets up my media downloading kit (spotdl for music, yt-dlp for videos & audio files also)
# yt-dlp is installed as a dependency of spotdl
# N.B: Debian works differently from Ubuntu, pip3 CANNOT run external script without --break-system-packages being present
 
pip3 install spotdl --break-system-packages

# Changes the default terminal (needs user input)
# N.B: Only works if the distro in question does NOT have a option to select the prefered terminal via the GUI
# If your distro DOES have an option for choosing a terminal emulator graphically, use that method

sudo update-alternatives --config x-terminal-emulator

# Sets up my Razer peripherals using openrazer and polychromatic (frontend)
# OPENRAZER

sudo gpasswd -a $USER plugdev
sudo apt install openrazer-daemon

# POLYCHROMATIC

echo "deb [signed-by=/usr/share/keyrings/polychromatic.gpg] http://ppa.launchpad.net/polychromatic/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/polychromatic.list
curl -fsSL 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xc0d54c34d00160459588000e96b9cd7c22e2c8c5' | sudo gpg --dearmour -o /usr/share/keyrings/polychromatic.gpg
sudo apt-get update

# echoes the below string

echo "Your system is now configured fully"

# runs neofetch

neofetch

# echoes the below string

echo "Thanks for using my program. Take care and enjoy your new Linux install :)"

# program sleeps for 3 seconds

sleep 5

# exits the terminal instance that is currently running the script

exit

# end of script


