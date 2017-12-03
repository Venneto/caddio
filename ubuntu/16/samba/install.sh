#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Install Samba4 AD DC

sudo apt update && sudo apt install -y samba krb5-user krb5-config winbind libpam-winbind libnss-winbind smbclient ldap-utils acl attr quota

sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service

sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service

sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig

