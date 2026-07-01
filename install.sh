#!/data/data/com.termux/files/usr/bin/bash

#mkdir -p $PREFIX/etc/apt/sources.list.d

echo "deb [trusted=yes] https://raw.githubusercontent.com/VoidPlusDev/VoidPlus/refs/heads/main  voidplus main" > $PREFIX/etc/apt/sources.list
yes | apt install wget 
wget https://github.com/VoidPlusDev/VoidPlus/blob/main/VoidPlus.key

apt-key add VoidPlus.key 

mv /data/data/com.termux/files/usr/etc/apt/trusted.gpg /data/data/com.termux/files/usr/etc/apt/trusted.gpg.d

apt update

echo "VoidPlus repository installed!"
