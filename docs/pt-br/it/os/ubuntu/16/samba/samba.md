# Como instalar Samba4 AD DC no Ubuntu 16.04.3 LTS

Baixe e instale o Ubuntu Server:

https://www.ubuntu.com/download/server

Sugestão para a estrutura do disco rígido:

	- Partição 1 /boot
	- Partição 2 /
	- Partição 3 /swap
	- Partição 4 /home
 
 Após a instalação:
 
```sudo dpkg-reconfigure locales```

```sudo cp /etc/network/interfaces /etc/network/interfaces.orig```

```sudo sed -i '/auto enp0s3/G' /etc/network/interfaces```

```sudo sed -i '/iface enp0s3 inet dhcp/i # Custom Settings' /etc/network/interfaces```

```sudo sed -i '/Custom Settings/G' /etc/network/interfaces```

```sudo sed -i -e 's/iface enp0s3 inet dhcp/iface enp0s3 inet static/g ' /etc/network/interfaces```

```sudo sed -i '/iface enp0s3 inet static/a address 192.168.1.101' /etc/network/interfaces```

```sudo sed -i '/address 192.168.1.101/a netmask 255.255.255.0' /etc/network/interfaces```

```sudo sed -i '/netmask 255.255.255.0/a network 192.168.1.0' /etc/network/interfaces```

```sudo sed -i '/network 192.168.1.0/a broadcast 192.168.1.255' /etc/network/interfaces```

```sudo sed -i '/broadcast 192.168.1.255/a gateway 192.168.1.1' /etc/network/interfaces```

```sudo sed -i '/gateway 192.168.1.1/a dns-nameservers 192.168.1.101 192.168.1.1' /etc/network/interfaces```

```sudo sed -i '/dns-nameservers 192.168.1.101 192.168.1.1/a dns-search dominio.local' /etc/network/interfaces```

```sudo reboot```

```cat /etc/network/interfaces >/sbin/process/ubuntu/16/samba/network.txt```

```cat /etc/resolv.conf >/sbin/process/ubuntu/16/samba/resolv.txt```

```cat /etc/hosts >/sbin/process/ubuntu/16/samba/hosts.txt```

```cat /etc/hostname >/sbin/process/ubuntu/16/samba/hostname.txt```

```sudo apt update && sudo apt install -y samba krb5-user krb5-config winbind libpam-winbind libnss-winbind smbclient ldap-utils``` 

### Kerberos:
 - DOMINIO.LOCAL
 - Enter
 - hostname
 - hostname

```sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service```

```sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service```

```sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig```

```sudo samba-tool domain provision --use-rfc2307 --interactive```

 - Realm: DOMINIO.LOCAL
 - Domain: DOMINIO
 - Server role: Enter
 - DNS backend: Enter
 - DNS forwarder: 192.168.1.1 [IP do Roteador]
 - Administrator password: Coloque uma senha com mais de 7 digitos 

```sudo mv /etc/krb5.conf /etc/krb5.conf.orig```

```sudo ln -s /var/lib/samba/private/krb5.conf /etc/```

```sudo systemctl start samba-ad-dc.service```

```sudo systemctl status samba-ad-dc.service```

```sudo systemctl enable samba-ad-dc.service```

```sudo netstat -tulpn | egrep 'smbd|samba'```

```clear```

```sudo apt install -y ntp```

```sudo cp /etc/ntp.conf /etc/ntp.conf.orig```

```sudo sed -i '/driftfile \/var\/lib\/ntp\/ntp.drift/a ## Custom Settings 1' /etc/ntp.conf```

```sudo sed -i '/\#\# Custom Settings 1/a ntpsigndsocket /var/lib/samba/ntp_signd/' /etc/ntp.conf```

```sudo sed -i -e 's/pool 0.ubuntu.pool.ntp.org iburst/# pool 0.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf```

```sudo sed -i -e 's/pool 1.ubuntu.pool.ntp.org iburst/# pool 1.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf```

```sudo sed -i -e 's/pool 2.ubuntu.pool.ntp.org iburst/# pool 2.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf```

```sudo sed -i -e 's/pool 3.ubuntu.pool.ntp.org iburst/# pool 3.ubuntu.pool.ntp.org iburst/g ' /etc/ntp.conf```

```sudo sed -i '/\# pool 3.ubuntu.pool.ntp.org iburst/a ## Custom Settings 2' /etc/ntp.conf```

```sudo sed -i '/## Custom Settings 2/a server a.st1.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server a.st1.ntp.br iburst/a server b.st1.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server b.st1.ntp.br iburst/a server c.st1.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server c.st1.ntp.br iburst/a server d.st1.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server d.st1.ntp.br iburst/a server gps.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server gps.ntp.br iburst/a server a.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server a.ntp.br iburst/a server b.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/server b.ntp.br iburst/a server c.ntp.br iburst' /etc/ntp.conf```

```sudo sed -i '/restrict source notrap nomodify noquery/a ## Custom Settings 3' /etc/ntp.conf```

```sudo sed -i '/\#\# Custom Settings 3/a restrict default kod nomodify notrap nopeer mssntp' /etc/ntp.conf```

```sudo sed -i '/#fudge 127.127.22.1 flag3 1/G' /etc/ntp.conf```

```sudo sed -i -e "\$a# desabilitar comando monlist" /etc/ntp.conf```

```sudo sed -i '/# desabilitar comando monlist/a disable monitor' /etc/ntp.conf```
	 		 
```sudo chown root:ntp /var/lib/samba/ntp_signd/```

```sudo chmod 750 /var/lib/samba/ntp_signd/```

```sudo systemctl restart ntp```

```sudo netstat -tulpn | grep ntp```

```ntpq -p```

```sudo apt install ntpdate -y```

```ntpdate -qu etmnmaster```

```sudo systemctl stop ntp.service```

```sudo ntpdate -b a.ntp.br```

```sudo systemctl start ntp.service```

```sudo systemctl status ntp.service```

```sudo reboot```

```clear```

```sudo samba-tool domain level show```

```ping -c3 dominio.local```

```ping -c3 hostname.dominio.local```

```ping -c3 hostname```

```host -t A dominio.local```

```host -t A hostname.dominio.local```

```host -t SRV _kerberos._udp.dominio.local```

```host -t SRV _ldap._tcp.dominio.local```

```kinit administrator@DOMINIO.LOCAL```

```klist```

```sudo ntpdate -du hostname.dominio.local```

```sudo useradd --no-create-home -s /bin/false admin_local```

```sudo addgroup nomedogrupo```

```cat /proc/fs/ext4/sda1/options | grep xattr```

```mkdir -p /home/nomedousuario/share/pasta/de/arquivos```

```mkdir -p /home/nomedousuario/share/trash```

```sudo chmod 0770 /home/nomedousuario/share/pasta/de/arquivos```

```sudo chmod 0777 /home/nomedousuario/share/trash```

```sudo chown admin_etmn:alunos /home/nomedousuario/share/pasta/de/arquivos```

```sudo chown nomedousuario:nomedousuario /home/nomedousuario/share/trash```

```sudo samba-tool user add admin_local```

```sudo samba-tool group addmembers "Domain Admins" admin_local```

```sudo samba-tool group addmembers "Administrators" admin_local```

```sudo samba-tool group addmembers "Enterprise Admins" admin_local```

```sudo samba-tool group addmembers "Group Policy Creator Owners" admin_local```

```sudo samba-tool group addmembers "Schema Admins" admin_local```

```sudo nano /etc/samba/smb.conf```

```sudo testparm -s /etc/samba/smb.conf```

```sudo systemctl restart samba-ad-dc.service```

```sudo systemctl status samba-ad-dc.service```
   
