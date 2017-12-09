#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-03
# Description: Core file - All functions and Menus.

samba_menu() {

   localpath=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")  
   
   option=0
   until [ "$option" = "M" ]; 
   do
      clear 
      echo "  [1] Install Samba4 (From repository)"
      echo "  [2] Install Samba4 (From source)"
      echo "  [3] Run Basic tests"
      echo "  [4] Backup Samba4 files"
      echo "  [5] Restore Samba4 files"
      echo "  [6] Remove Samba4"
      echo "  [M] Return to Main Menu"

      echo -n "Please Select a Number [1-6] or [M] to Main Menu: "
      read option
      echo ""
   
      case $option in
         1 ) source $localpath/install.sh;
            sambarepo;;
         2 ) source $localpath/install.sh;
            sambasource;;
         3 ) source $localpath/install.sh;
            basictests;;
         4 ) source $localpath/backup.sh;
            backupsamba;;
         5 ) source $localpath/restore.sh;
            restoresamba;;
         6 ) source $localpath/remove.sh;
            removesamba;;
         [mM]* ) main_menu;;
         * ) tput setf m;echo "Please enter [1-6] or [M]";tput setf m; 
      esac
   done
}

main_menu() {

   localpath=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

   option=0
   until [ "$option" = "q" ]; 
   do
      clear
      echo "  [1] Fix Locale"
      echo "  [2] Configure Network"
      echo "  [3] Configure ACL & Quota at /home"
      echo "  [4] Install NTP"
      echo "  [5] Samba Options"
      echo "  [Q] Exit"

      echo -n "Please Select a Number [1-5] or [Q] to Exit: "
      read option
      echo ""

      case $option in
         1 ) source $localpath/locale.sh;
               fixlocale;;
            2 ) source $localpath/network.sh;
               networksettings;;
            3 ) source $localpath/diskquota.sh;
               aclquota;;
            4 ) source $localpath/ntp.sh;
               installntp;;
            5 ) samba_menu;;
            [qQ]* ) exit;;
            * ) tput setf q;echo "Please enter 1, 2, 3, 5 or Q";tput setf q;
      esac
   done
}

main_menu
