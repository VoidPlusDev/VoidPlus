#!/data/data/com.termux/files/usr/bin/bash

set -e

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

clear

echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║        VoidPlus Repository          ║"
echo "║          Official Installer         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${RESET}"

echo -e "${WHITE}[*] Updating package list...${RESET}"
pkg update -y

echo -e "${WHITE}[*] Installing dependencies...${RESET}"
pkg install -y wget gnupg

mkdir -p "$PREFIX/etc/apt/keyrings"
mkdir -p "$PREFIX/etc/apt/sources.list.d"
mkdir -p "$PREFIX/tmp"

echo -e "${WHITE}[*] Downloading GPG key...${RESET}"

wget -O "$PREFIX/tmp/VoidPlus.key" \
https://raw.githubusercontent.com/VoidPlusDev/VoidPlus/main/VoidPlus.key

echo -e "${WHITE}[*] Installing GPG key...${RESET}"

gpg --batch --yes --dearmor \
-o "$PREFIX/etc/apt/keyrings/voidplus.gpg" \
"$PREFIX/tmp/VoidPlus.key"

echo -e "${WHITE}[*] Adding repository...${RESET}"

cat > "$PREFIX/etc/apt/sources.list.d/voidplus.list" <<EOF
deb [signed-by=$PREFIX/etc/apt/keyrings/voidplus.gpg] https://raw.githubusercontent.com/VoidPlusDev/VoidPlus/main voidplus main
EOF

rm -f "$PREFIX/tmp/VoidPlus.key"

echo -e "${WHITE}[*] Updating repositories...${RESET}"
apt update

clear

echo -e "${GREEN}"
echo "======================================"
echo "     VoidPlus Installed Successfully"
echo "======================================"
echo -e "${RESET}"
# Add repository
curl -sL https://github.com/termuxvoid/repo/raw/main/install.sh | bash
echo
echo -e "${CYAN}You can now install packages:${RESET}"
echo
echo "apt install <package-name>"
echo
