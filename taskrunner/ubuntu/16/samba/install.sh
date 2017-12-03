#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Install Samba4 AD DC

# Better safe than sorry!

# Backup original Network Configuration

fixlocale() {

	sudo dpkg-reconfigure locales

}

network() {

	# Backup original interfaces file

	sudo cp /etc/network/interfaces /etc/network/interfaces.orig

	# Ask the user for the network settings

	read -p 'IP address: ' serverip
	read -p 'Netmask: ' netmask
	read -p 'Network: ' network
	read -p 'Broadcast: ' broadcast
	read -p 'Gateway: ' gateway
	read -p 'DNS Nameservers 1: ' dnsnameserversp
	read -p 'DNS Nameservers 2: ' dnsnameserverss
	read -p 'DNS Search: ' dnssearch

	# Get the ethernet interface name

	netcard=$(pci=`lspci  | awk '/Ethernet/{print $1}'`; find /sys/class/net ! -type d | xargs --max-args=1 realpath  | awk -v pciid=$pci -F\/ '{if($0 ~ pciid){print $NF}}')

	# Define all network settings

	sudo sed -i '/auto '$netcard'/G' /etc/network/interfaces
	sudo sed -i '/iface '$netcard' inet dhcp/i # Custom Settings' /etc/network/interfaces
	sudo sed -i '/Custom Settings/G' /etc/network/interfaces
	sudo sed -i -e 's/iface '$netcard' inet dhcp/iface '$netcard' inet static/g ' /etc/network/interfaces
	sudo sed -i '/iface '$netcard' inet static/a address '$serverip'' /etc/network/interfaces
	sudo sed -i '/address '$serverip'/a netmask '$netmask'' /etc/network/interfaces
	sudo sed -i '/netmask '$netmask'/a network '$network'' /etc/network/interfaces
	sudo sed -i '/network '$network'/a broadcast '$broadcast'' /etc/network/interfaces
	sudo sed -i '/broadcast '$broadcast'/a gateway '$gateway'' /etc/network/interfaces
	sudo sed -i '/gateway '$gateway'/a dns-nameservers '$dnsnameserversp' '$dnsnameserverss'' /etc/network/interfaces
	sudo sed -i '/dns-nameservers '$dnsnameserversp' '$dnsnameserverss'/a dns-search '$dnssearch'' /etc/network/interfaces

}


# Adding ACL and Quota support to /home

#sudo cp -rfvp /etc/fstab /etc/fstab.orig

#partition=$(df --output=source /home/ | tail -n1)

#uuid=$(sudo blkid -s UUID -o value $partition)

#sudo sed -i '/.*\/home.*.*ext4.*/c\UUID='$uuid' \/home           ext4    defaults,usrjquota=aquota.user,grpjquota=aquota.group,jqfmt=vfsv0,user_xattr,acl,barrier=1        0       2' /etc/fstab

#sudo mount -o remount,rw /home

#sudo reboot

# Installing Samba4

#sudo apt update && sudo apt install -y samba krb5-user krb5-config winbind libpam-winbind libnss-winbind smbclient ldap-utils acl attr quota

#sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service

#sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service

#sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig

#sudo samba-tool domain provision --use-rfc2307 --interactive

#sudo mv /etc/krb5.conf /etc/krb5.conf.orig

#sudo systemctl start samba-ad-dc.service

#sudo systemctl status samba-ad-dc.service



