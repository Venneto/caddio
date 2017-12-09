#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-04
# Description: Install and Configure NTP

installntp() {

	apt update && apt upgrade -y
	apt install -y ntp ntpdate

	# Backup original NTP conf file

	cp /etc/ntp.conf /etc/ntp.conf.orig

	# NTP Custom settings

	sed -i '/driftfile \/var\/lib\/ntp\/ntp.drift/a ## Custom Settings 1' /etc/ntp.conf
	sed -i '/\#\# Custom Settings 1/a ntpsigndsocket /var/lib/samba/ntp_signd/' /etc/ntp.conf
	sed -i -e 's/pool 0.ubuntu.pool.ntp.org iburst/# pool 0.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf
	sed -i -e 's/pool 1.ubuntu.pool.ntp.org iburst/# pool 1.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf
	sed -i -e 's/pool 2.ubuntu.pool.ntp.org iburst/# pool 2.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf
	sed -i -e 's/pool 3.ubuntu.pool.ntp.org iburst/# pool 3.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf
	sed -i '/\# pool 3.ubuntu.pool.ntp.org iburst/a ## Custom Settings 2' /etc/ntp.conf
	sed -i '/## Custom Settings 2/a server a.st1.ntp.br iburst' /etc/ntp.conf
	sed -i '/server a.st1.ntp.br iburst/a server b.st1.ntp.br iburst' /etc/ntp.conf
	sed -i '/server b.st1.ntp.br iburst/a server c.st1.ntp.br iburst' /etc/ntp.conf
	sed -i '/server c.st1.ntp.br iburst/a server d.st1.ntp.br iburst' /etc/ntp.conf
	sed -i '/server d.st1.ntp.br iburst/a server gps.ntp.br iburst' /etc/ntp.conf
	sed -i '/server gps.ntp.br iburst/a server a.ntp.br iburst' /etc/ntp.conf
	sed -i '/server a.ntp.br iburst/a server b.ntp.br iburst' /etc/ntp.conf
	sed -i '/server b.ntp.br iburst/a server c.ntp.br iburst' /etc/ntp.conf
	sed -i '/restrict source notrap nomodify noquery/a ## Custom Settings 3' /etc/ntp.conf
	sed -i '/\#\# Custom Settings 3/a restrict default kod nomodify notrap nopeer mssntp' /etc/ntp.conf
	sed -i '/#fudge 127.127.22.1 flag3 1/G' /etc/ntp.conf
	sed -i -e "\$a# desabilitar comando monlist" /etc/ntp.conf
	sed -i '/# desabilitar comando monlist/a disable monitor' /etc/ntp.conf
	chown root:ntp /var/lib/samba/ntp_signd/
	chmod 750 /var/lib/samba/ntp_signd/
	systemctl restart ntp
	netstat -tulpn | grep ntp
	ntpq -p
	ntpdate -qu etmnmaster
	systemctl stop ntp.service
	ntpdate -b a.ntp.br
	systemctl start ntp.service
	systemctl status ntp.service

}

