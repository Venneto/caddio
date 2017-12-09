#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Restore all configuration files from a previous samba4 installation.

USERPROFILE=$USER
BACKUPFROM="/home/$USERPROFILE/samba/backups"

systemctl stop samba-ad-dc.service

cp -rfvp $BACKUPFROM/smb.conf /etc/samba

cp -rfvp $BACKUPFROM/samba /var/lib

cp -rfvp $BACKUPFROM/krb5.conf /etc/krb5.conf

cp -rfvp $BACKUPFROM/passwd /etc/passwd 

cp -rfvp $BACKUPFROM/group /etc/group 

cp -rfvp $BACKUPFROM/shadow /etc/shadow

cp -rfvp $BACKUPFROM/interfaces /etc/network/interfaces

cp -rfvp $BACKUPFROM/resolv.conf /etc/resolv.conf

cp -rfvp $BACKUPFROM/hostname /etc/hostname

cp -rfvp $BACKUPFROM/hosts /etc/hosts

systemctl start samba-ad-dc.service
