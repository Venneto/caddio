## How to configure Samba Task Runner?

It's very easy to configure Samba Task runner. Change your username to root.

```sudo su```

```cd /usr/src```

```git clone https://github.com/Venneto/process.git```

```chown -R root:root "/usr/src/process/taskrunner/ubuntu/16/samba"```

```chmod -R 750 "/usr/src/process/taskrunner/ubuntu/16/samba"```

```chmod +x "/usr/src/process/taskrunner/ubuntu/16/samba/*.sh"```

```ln -s "/usr/src/process/taskrunner/ubuntu/16/samba/samba.sh" /sbin```

```samba.sh```
