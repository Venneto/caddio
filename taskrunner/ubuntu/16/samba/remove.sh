#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Remove Samba 4

systemctl stop samba-ad-dc.service

apt remove --purge -y samba samba-common

rm -rf /etc/apparmor.d/abstractions/samba

rm -rf /usr/lib/x86_64-linux-gnu/samba

rm -rf /usr/lib/x86_64-linux-gnu/ldb/modules/ldb/samba

rm -rf /usr/lib/python2.7/dist-packages/samba

rm -rf /etc/samba

rm -rf /run/samba

rm -rf /usr/bin/samba-regedit

rm -rf /usr/bin/samba-tool

rm -rf /usr/lib/samba

rm -rf /usr/sbin samba

rm -rf /usr/sbin samba_dnsupdate

rm -rf /usr/sbin/samba_kcc

rm -rf /usr/sbin/samba_spnupdate

rm -rf /usr/sbin/samba_upgrade

rm -rf /usr/share/samba

rm -rf /var/cache/samba

rm -rf /var/lib/samba

rm -rf /var/spool/samba
