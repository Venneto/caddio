#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-03
# Description: Use this file to import all tasks.

# Samba menu options - Option number [5] on main menu

sambamenu() {

	clear
	echo "-------------------------------------------------"
	echo "                 Samba4 Tasks                    "
	echo "-------------------------------------------------"
	echo "[1] Install Samba4 (From repository)"
	echo "[2] Install Samba4 (From source)"
	echo "[3] Create shared folders (/home/$USER/share)"
	echo "[4] Run basic tests"
	echo "[5] Backup Samba4 files"
	echo "[6] Restore Samba4 files"
	echo "[7] Remove Samba4"
	echo "[8] Return to Main Menu"
	echo "[0] Exit"
	echo "-------------------------------------------------"

	read -p "Please select a number [0-8]: " sambaoption
	return $sambaoption

	while [[ "$sambaoption" != "0" ]]
	do
		if [[ "$sambaoption" == "1" ]]; then
			installsamba
		elif [[ "$sambaoption" == "2" ]]; then
			echo ""
		fi

		sambamenu
		sambaoption=$?
	done

	exit 0;

}

# Main menu options - First menu to show up

mainmenu() {

	clear
	echo "-------------------------------------------------"
	echo "                    Samba4                       "
	echo "-------------------------------------------------"
	echo "[1] Fix Locale"
	echo "[2] Configure Network"
	echo "[3] Activate ACL & Quota at /home"
	echo "[4] Install NTP"
	echo "[5] Samba4 Tasks"
	echo "[0] Exit"
	echo "-------------------------------------------------"

read -p "Please Select a Number [0-7]: " menuoption
return $menuoption
}


while [[ "$menuoption" != "0" ]]
do
    if [[ "$menuoption" == "1" ]]; then
        echo "hello"

    elif [[ "$menuoption" == "2" ]]; then
        echo "bye"
    fi
    mainmenu
    menuoption=$?
done

exit 0;