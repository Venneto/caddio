#!/bin/bash

# Author: David Medeiros
# Date: 2017-12-02
# Description: Configure Samba Task Runner

# Download Samba Task Runner
# https://github.com/Venneto/process.git

sudo su

cp -rfvp /home/$USER/process /usr/src

chown -R root:root /usr/src/process/taskrunner/ubuntu/16/samba

chmod -R 750 /usr/src/process/taskrunner/ubuntu/16/samba

chmod +x /usr/src/process/taskrunner/ubuntu/16/samba/*.sh

ln -s /usr/src/process/taskrunner/ubuntu/16/samba/samba.sh /sbin

samba.sh

exit

