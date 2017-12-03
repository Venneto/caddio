#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Remove Samba 4

sudo systemctl stop samba-ad-dc.service

sudo apt remove --purge -y samba samba-common

sudo rm -rf /etc/apparmor.d/abstractions/samba

sudo rm -rf /usr/lib/x86_64-linux-gnu/samba

sudo rm -rf /usr/lib/x86_64-linux-gnu/ldb/modules/ldb/samba

sudo rm -rf /usr/lib/python2.7/dist-packages/samba

sudo rm -rf /etc/samba

sudo rm -rf /run/samba

sudo rm -rf /usr/bin/samba-regedit

sudo rm -rf /usr/bin/samba-tool

sudo rm -rf /usr/lib/samba

sudo rm -rf /usr/sbin samba

sudo rm -rf /usr/sbin samba_dnsupdate

sudo rm -rf /usr/sbin/samba_kcc

sudo rm -rf /usr/sbin/samba_spnupdate

sudo rm -rf /usr/sbin/samba_upgrade

sudo rm -rf /usr/share/samba

sudo rm -rf /var/cache/samba

sudo rm -rf /var/lib/samba

sudo rm -rf /var/spool/samba



