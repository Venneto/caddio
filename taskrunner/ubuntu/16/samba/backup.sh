#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Backup your Samba4 configuration files

USERPROFILE=$USER

BACKUPTO="/home/$USER/samba/backups"

mkdir -p $BACKUPTO

net getlocalsid >$BACKUPTO/localsid.txt

net getdomainsid >$BACKUPTO/domainsid.txt

systemctl stop samba-ad-dc.service

systemctl stop ntp.service

cp -rfvp /etc/samba/smb.conf $BACKUPTO

cp -rfvp /var/lib/samba $BACKUPTO

cp -rfvp /etc/krb5.conf $BACKUPTO

cp -rfvp /etc/passwd $BACKUPTO

cp -rfvp /etc/group $BACKUPTO

cp -rfvp /etc/shadow $BACKUPTO

cp -rfvp /etc/network/interfaces $BACKUPTO

cp -rfvp /etc/resolv.conf $BACKUPTO

cp -rfvp /etc/hostname $BACKUPTO

cp -rfvp /etc/hosts $BACKUPTO
