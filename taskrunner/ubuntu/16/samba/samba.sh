#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-03
# Description: Core file - All functions and Menus.

# Samba menu options - Option number [5] on main menu

sambamenu() {

	clear
	echo "-------------------------------------------------"
	echo "                 Samba4 Tasks                    "
	echo "-------------------------------------------------"
	echo "[1] Install Samba4 (From repository)"
	echo "[2] Install Samba4 (From source)"
	echo "[4] Run basic tests"
	echo "[5] Backup Samba4 files"
	echo "[6] Restore Samba4 files"
	echo "[7] Remove Samba4"
	echo "[0] Return to Main Menu"
	echo "-------------------------------------------------"

	read -p "Please select a number [0-7]: " sambaoption
	return $sambaoption

	while [[ "$sambaoption" != "0" ]]
	do
		if [[ "$sambaoption" == "1" ]]; then
			source $(dirname "$0")/install.sh
			sambarepo
		fi		
		if [[ "$sambaoption" == "2" ]]; then
			source $(dirname "$0")/install.sh
			sambasource
		fi
		if [[ "$sambaoption" == "3" ]]; then
			source $(dirname "$0")/install.sh
			sharedfolder
		fi
		if [[ "$sambaoption" == "4" ]]; then
			source $(dirname "$0")/install.sh
			basictests
		fi
		if [[ "$sambaoption" == "5" ]]; then
			source $(dirname "$0")/backup.sh
			backupsamba
		fi
		if [[ "$sambaoption" == "6" ]]; then
			source $(dirname "$0")/restore.sh
			restoresamba
		fi
		if [[ "$sambaoption" == "7" ]]; then
			source $(dirname "$0")/remove.sh
			removesamba
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
	echo "                Samba Task Runner                "
	echo "-------------------------------------------------"
	echo "[1] Fix Locale"
	echo "[2] Configure Network"
	echo "[3] Activate ACL & Quota at /home"
	echo "[4] Install NTP"
	echo "[5] Samba4 Tasks"
	echo "[0] Exit"
	echo "-------------------------------------------------"

	read -p "Please Select a Number [0-5]: " menuoption
	return $menuoption
}

while [[ "$menuoption" != "0" ]]
do
    if [[ "$menuoption" == "1" ]]; then
    	source $(dirname "$0")/locale.sh
    	fixlocale
    fi	
    if [[ "$menuoption" == "2" ]]; then
    	source $(dirname "$0")/network.sh
    	network
    fi	
    if [[ "$menuoption" == "3" ]]; then
    	source $(dirname "$0")/diskquota.sh
    	aclquota
    fi	
    if [[ "$menuoption" == "4" ]]; then
    	source $(dirname "$0")/ntp.sh
        installntp
    fi    
    if [[ "$menuoption" == "5" ]]; then
    	sambamenu    
    fi
    mainmenu
    menuoption=$?
done

exit 0;