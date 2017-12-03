#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Backup your Samba4 configuration files

USERPROFILE=$USER

BACKUPTO="/home/$USERPROFILE/samba/backups"

mkdir -p $BACKUPTO

sudo net getlocalsid >$BACKUPTO/localsid.txt

sudo net getdomainsid >$BACKUPTO/domainsid.txt

sudo systemctl stop samba-ad-dc.service

sudo systemctl stop ntp.service

sudo cp -rfvp /etc/samba/smb.conf $BACKUPTO

sudo cp -rfvp /var/lib/samba $BACKUPTO

sudo cp -rfvp /etc/krb5.conf $BACKUPTO

sudo cp -rfvp /etc/passwd $BACKUPTO

sudo cp -rfvp /etc/group $BACKUPTO

sudo cp -rfvp /etc/shadow $BACKUPTO

sudo cp -rfvp /etc/network/interfaces $BACKUPTO

sudo cp -rfvp /etc/resolv.conf $BACKUPTO

sudo cp -rfvp /etc/hostname $BACKUPTO

sudo cp -rfvp /etc/hosts $BACKUPTO
