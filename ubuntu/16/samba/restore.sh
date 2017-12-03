#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Restore all configuration files from a previous samba4 installation.

USERPROFILE=$USER
BACKUPFROM="/home/$USERPROFILE/samba/backups"

sudo systemctl stop samba-ad-dc.service

sudo cp -rfvp $BACKUPFROM/smb.conf /etc/samba

sudo cp -rfvp $BACKUPFROM/samba /var/lib

sudo cp -rfvp $BACKUPFROM/krb5.conf /etc/krb5.conf

sudo cp -rfvp $BACKUPFROM/passwd /etc/passwd 

sudo cp -rfvp $BACKUPFROM/group /etc/group 

sudo cp -rfvp $BACKUPFROM/shadow /etc/shadow

sudo cp -rfvp $BACKUPFROM/interfaces /etc/network/interfaces

sudo cp -rfvp $BACKUPFROM/resolv.conf /etc/resolv.conf

sudo cp -rfvp $BACKUPFROM/hostname /etc/hostname

sudo cp -rfvp $BACKUPFROM/hosts /etc/hosts

sudo systemctl start samba-ad-dc.service