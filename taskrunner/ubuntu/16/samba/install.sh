#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Install Samba4 AD DC

# Install Samba 4 from a repository

sambarepo() {

	apt update && sudo apt install -y samba krb5-user krb5-config winbind libpam-winbind libnss-winbind smbclient ldap-utils
	systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service
	systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service
	mv /etc/samba/smb.conf /etc/samba/smb.conf.orig
	samba-tool domain provision --use-rfc2307 --interactive
	mv /etc/krb5.conf /etc/krb5.conf.orig
	ln -s /var/lib/samba/private/krb5.conf /etc/
	systemctl start samba-ad-dc.service
	systemctl status samba-ad-dc.service
	systemctl enable samba-ad-dc.service
	netstat -tulpn | egrep 'smbd|samba'
	
}

# Install Samba 4 from source

sambasource() {

	# Update and Upgrade system packages

	apt update && apt upgrade -y

	# Install Samba Operating System Requirements

	apt install autoconf bison build-essential debhelper \
	dnsutils docbook-xml docbook-xsl flex gdb krb5-devel \
	krb5-user krb5-server libacl1-dev libaio-dev \
	libattr1-dev libblkid-dev libbsd-dev libcap-dev \
	ibcups2-dev libgnutls-dev libjson-perl \
	libldap2-dev libncurses5-dev libpam0g-dev \
	libparse-yapp-perl libpopt-dev libreadline-dev \
	perl perl-modules pkg-config python-all-dev \
	python-dev python-dnspython python-crypto xsltproc \
	zlib1g-dev libsystemd-dev libgpgme11-dev python-gpgme \
	python-m2crypto blkid jansson-devel

	# Download Samba source code

	wget https://download.samba.org/pub/samba/stable/samba-4.7.3.tar.gz -P /usr/src
	cd /usr/src
	tar -xzvf /usr/src/samba-4.7.3.tar.gz
	cd samba-4.7.3/
	./configure --sbindir=/usr/sbin/ --sysconfdir=/etc/samba/ --mandir=/usr/share/man/ --enable-selftest 
	make
	make install

}

# Create all shared folders

sharedfolder() {}

# Run some basic test against Samba4 AD DC

basictests() {

	# Verify Network settings

	cat /etc/network/interfaces
	read -p "Press ENTER to continue..."
	cat /etc/resolv.conf
	read -p "Press ENTER to continue..."
	cat /etc/hosts
	read -p "Press ENTER to continue..."
	cat /etc/hostname
	read -p "Press ENTER to continue..."

	# Test Domain Level

	samba-tool domain level show
	read -p "Press ENTER to continue..."

	# Test DNS resolution

	ping -c3 etmn.local
	read -p "Press ENTER to continue..."
	ping -c3 etmnmaster.etmn.local
	read -p "Press ENTER to continue..."
	ping -c3 etmnmaster
	read -p "Press ENTER to continue..."
	host -t A etmn.local
	read -p "Press ENTER to continue..."
	host -t A etmnmaster.etmn.local
	read -p "Press ENTER to continue..."
	host -t SRV _kerberos._udp.etmn.local
	read -p "Press ENTER to continue..."
	host -t SRV _ldap._tcp.etmn.local
	read -p "Press ENTER to continue..."
	kinit administrator@ETMN.LOCAL
	klist
	read -p "Press ENTER to continue..."
	ntpdate -du etmnmaster.etmn.local
	read -p "Press ENTER to continue..."

	# Test SMB

	smbclient -L localhost -U%
	read -p "Press ENTER to continue..."
	
}
