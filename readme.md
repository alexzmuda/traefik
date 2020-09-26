# Mac & Linux setup

This document explains how to set up dev enviroment where dockers are handled by external computer. 

## Requirements

* Docker
* Mac
* Linux (i.e. Linux Mint 20)

```https://linuxmint.com/download.php```

* Mutagen

```https://mutagen.io```

* SSH passwordless setup on Linux 

```https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/```

* SSH config with hostname (i.e. linux.local)
```
Host linux.local
	HostName 192.168.x.x
	User userNameOnLinux
	IdentityFile ~/.ssh/id_rsa
```

## Steps

* Linux: download all repos and setup dockers on linux machine
* Mac: install mutagen
* Mac: create sync to download files

```mutagen sync create --name=my_sync ~./mac_folder userNameOnLinux@hp.local:~/linux_folder```

... this should download all files from Linux to Mac. Whole process might take some time (~15 min) and it will be completed 
when ```mutagen sync list``` will show "Waiting for file changes". You can run this command in second tab.

Now, we need to delete sync:

```mutagen sync terminate my_sync```

and in next step we define ```one-way-safe``` replication from Mac to Linux. Please notice that we have to set up ```on-way-safe mode``` if you work with git:

```mutagen sync create --name=my_sync --sync-mode=one-way-safe ./mac_folder userNameOnLinux@linux.local:~/linux_folder```

Mutagen Sync List - shows all syncs and their statuses

``` mutagen sync list```


#### Notice
Chrome on Mac will not allow to access *.localhost domains from Linux computer. 
This is such a bug and to workaround it we have two options:

1. Change everything in source code on any repo from .localhost to i.e. .local or .dev
2. or - recommended way - use Traefik ``` https://containo.us/traefik/ ``` to define routers. 
I attached working configuration based on docker file. When docker is launched just navigate to i.e. 
```subdomain.localhost``` and all will work as expected.