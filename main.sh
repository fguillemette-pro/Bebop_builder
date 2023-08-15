#!/bin/bash

# Variables
VERSION='0.1'

# Functions

check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Ce script doit être exécuté en tant que superutilisateur (root)." >&2
        exit 1
    fi
}

# Main

clear
echo -e '##################'
echo -e 'Bebop Builder init'
echo -e '##################'

check_root
echo "OK ROOT"
