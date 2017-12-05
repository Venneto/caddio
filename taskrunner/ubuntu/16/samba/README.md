## How to configure Samba Task Runner?

It's very easy to configure Samba Task runner. Change your username to root.

```sudo su```

```apt update && apt upgrade -y```

```apt install git```

```git clone https://github.com/Venneto/process.git "/usr/src/process"```

```chown -R root:root /usr/src/process/taskrunner/ubuntu/16/samba```

```chmod -R 750 /usr/src/process/taskrunner/ubuntu/16/samba```

```find /usr/src/process/taskrunner/ubuntu/16/samba/ -type f -iname "*.sh" -exec chmod +x {} \;```

```ln -s /usr/src/process/taskrunner/ubuntu/16/samba/samba.sh /sbin```

```samba.sh```
