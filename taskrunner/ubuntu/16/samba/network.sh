#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-04
# Description: Set all Network settings.

networksettings() {

	# Backup original Network Configuration

	cp /etc/network/interfaces /etc/network/interfaces.orig

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

	sed -i '/auto '$netcard'/G' /etc/network/interfaces
	sed -i '/iface '$netcard' inet dhcp/i # Custom Settings' /etc/network/interfaces
	sed -i '/Custom Settings/G' /etc/network/interfaces
	sed -i -e 's/iface '$netcard' inet dhcp/iface '$netcard' inet static/g ' /etc/network/interfaces
	sed -i '/iface '$netcard' inet static/a address '$serverip'' /etc/network/interfaces
	sed -i '/address '$serverip'/a netmask '$netmask'' /etc/network/interfaces
	sed -i '/netmask '$netmask'/a network '$network'' /etc/network/interfaces
	sed -i '/network '$network'/a broadcast '$broadcast'' /etc/network/interfaces
	sed -i '/broadcast '$broadcast'/a gateway '$gateway'' /etc/network/interfaces
	sed -i '/gateway '$gateway'/a dns-nameservers '$dnsnameserversp' '$dnsnameserverss'' /etc/network/interfaces
	sed -i '/dns-nameservers '$dnsnameserversp' '$dnsnameserverss'/a dns-search '$dnssearch'' /etc/network/interfaces

}