#!/bin/bash

#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-03
# Description: Core file - All functions and Menus.

samba_menu() {

   localpath=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")  
   
   option=0
   until [ "$option" = "0" ]; 
   do
      clear 
      echo "  [1] Install Samba4 (From repository)"
      echo "  [2] Install Samba4 (From source)"
      echo "  [3] Run basic tests"
      echo "  [4] Backup Samba4 files"
      echo "  [5] Restore Samba4 files"
      echo "  [6] Remove Samba4"
      echo "  [0] Return to Main Menu"

      echo -n "Please Select a Number [1-6] or [0] to Main Menu: "
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
         0 ) main_menu;;
         * ) tput setf 0;echo "Please enter [0-6]";tput setf 0; 
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













































mainmenu() {

 # localpath=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

 # localpath="/usr/src/process/taskrunner/ubuntu/16/samba"

 clear
 echo "-------------------------------------------------"
 echo "                Samba Task Runner                "
 echo "-------------------------------------------------"
 echo "[1] Fix Locale"
 echo "[2] Configure Network"
 echo "[3] Activate ACL & Quota at /home"
 echo "[4] Install NTP"
 echo "[5] Install Samba4 (From repository)"
 echo "[6] Install Samba4 (From source)"
 echo "[7] Run basic tests"
 echo "[8] Backup Samba4 files"
 echo "[9] Restore Samba4 files"
 echo "[0] Remove Samba4"
 echo "[Q] Exit"
 echo "-------------------------------------------------"

 read -p "Please Select a Number [0-9]: " menuoption
 return $menuoption

 while [[ "$menuoption" != "q" ]]
 do
    if [[ "$menuoption" == "1" ]]; then
       source $localpath/locale.sh
       fixlocale
       fi 
       if [[ "$menuoption" == "2" ]]; then
          source $localpath/network.sh
          networksettings
       fi 
       if [[ "$menuoption" == "3" ]]; then
          source $localpath/diskquota.sh
          aclquota
       fi 
       if [[ "$menuoption" == "4" ]]; then
          source $localpath/ntp.sh
          installntp
       fi    
       if [[ "$menuoption" == "5" ]]; then
          source $localpath/install.sh
          sambarepo    
       fi
       if [[ "$menuoption" == "6" ]]; then
       source $localpath/install.sh
       sambasource
    fi    
    if [[ "$menuoption" == "7" ]]; then
       source $localpath/install.sh
       basictests
    fi
    if [[ "$menuoption" == "8" ]]; then
       source $localpath/backup.sh
       backupsamba
    fi
    if [[ "$menuoption" == "9" ]]; then
       source $localpath/restore.sh
       restoresamba
    fi
    if [[ "$menuoption" == "0" ]]; then
       source $localpath/remove.sh
       removesamba
    fi
       mainmenu
       menuoption=$?
 done

 exit 0;
}

mainmenu













































while :
do
clear
echo "=================================================================================================== ===="
banner " ATP MENU"
echo "                    1. Check all running processes"
echo "                    2. Start all processes"
echo "                    3. Kill  all processes"
echo "                    Q. Quit"
echo "=================================================================================================== ===="
echo "Enter your menu choice [1-3 or q]: "

read userinput
case $userinput in

1) echo "Check all option selected\n\n"
   CHECKATP
while :
do
clear
echo "=================================================================================================== ===="
banner " ATP SubMENU"
echo "                    1. ATP"
echo "                    2. BILLING"
echo "                    Q. Return Back to Main Menu"
echo "=================================================================================================== ===="
echo "Enter your menu choice [1, 2 or q]: "

read userinput
case $userinput in

1) echo "ATP Submenu option selected\n\n"
   ATP
   echo "Press any key to continue" ; read ;;
2) echo "Billing option selected\n\n"
   BILLING
   echo "Press any key to continue" ; read ;;
[qQ]*) exit 0 ;;
*) echo "Please select choice 1,2 or q";
   echo "Press any key to continue" ; read ;;
esac
done
  
   echo "Press any key to continue" ; read ;;
2) echo "Start all option selected\n\n"
   STARTATP
while :
do
clear
echo "=================================================================================================== ===="
banner " ATP SubMENU"
echo "                    1. ATP"
echo "                    2. BILLING"
echo "                    Q. Return Back to Main Menu"
echo "=================================================================================================== ===="
echo "Enter your menu choice [1, 2 or q]: "

read userinput
case $userinput in

1) echo "ATP Submenu option selected\n\n"
   ATP
   echo "Press any key to continue" ; read ;;
2) echo "Billing option selected\n\n"
   BILLING
   echo "Press any key to continue" ; read ;;
[qQ]*) exit 0 ;;
*) echo "Please select choice 1,2 or q";
   echo "Press any key to continue" ; read ;;
esac
done

   echo "Press any key to continue" ; read ;;
3) echo "Kill all option selected"
   echo "Press any key to continue" ; read ;;
[qQ]*) exit 0 ;;
*) echo "Please select choice 1,2,3 or q";
   echo "Press any key to continue" ; read ;;
esac
done