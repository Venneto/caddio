#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Install Samba4 AD DC

# Install Samba 4 from a repository

sambarepo() {}

# Install Samba 4 from source

sambasource() {}

# Create all shared folders inside: /home/$USER/share/shared-folder-name

sharedfolder() {}

# Run some basic test against Samba4 AD DC

basictests() {}

# Backup all important data and set a cron job

backupsamba() {}

# Restore a previous Samba4 backup

restoresamba() {}

# Completely remove Samba4 - There's no backup before remove - CAREFUL!

removesamba() {}



# Installing Samba4

#sudo apt update && sudo apt install -y samba krb5-user krb5-config winbind libpam-winbind libnss-winbind smbclient ldap-utils acl attr quota

#sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service

#sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service

#sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig

#sudo samba-tool domain provision --use-rfc2307 --interactive

#sudo mv /etc/krb5.conf /etc/krb5.conf.orig

#sudo systemctl start samba-ad-dc.service

#sudo systemctl status samba-ad-dc.service



