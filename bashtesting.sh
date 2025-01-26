function vscodium_install {
    read -p "Would you like to install VSCodium?: " vscodium_choice

    if [ $vscodium_choice == "Y" -o $vscodium_choice == "y" ];
    then
        echo "-------------------"
        ip r
        echo "-------------------"
    elif [ $vscodium_choice == "N" -o $vscodium_choice == "n" ];
    then
        echo No
    
    fi
}

vscodium_install