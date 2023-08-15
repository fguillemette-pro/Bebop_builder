#!/bin/bash

# Variables
VERSION='0.1'

Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
NC='\033[0m'              # No Color

# Functions

display_message() {
    local message="$1"
    local color="$2"
    
    echo -e '###############'
    echo -e "${color}${message}${NC}"
    echo -e '###############'
}

check_root() {
    if [ "$EUID" -ne 0 ]; then
        display_message "Ce script doit être exécuté en tant que superutilisateur (root)." "$Red"
        exit 1
    fi
}

check_command_status() {
    local status=$?
    if [ $status -ne 0 ]; then
        display_message "La commande précédente a échoué avec le code d'erreur $status. Arrêt du script." "$Red"
        exit $status
    fi
}

# Main

clear

display_message "Bebop Builder init" "$Blue"

display_message "Check root user ..." "$Yellow"

check_root

display_message "Root detected !" "$Green"

display_message "Update system ... " "$Yellow"

apt update -y
check_command_status

display_message "Update done !" "$Green"