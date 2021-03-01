# FreeIPA Server

FreeIPA server that can be used for development and testing. Basically I used it as an easy-to-configure LDAP server, but it is more than that.

## Prerequisites
First of all, enable IPV6 on your Docker Daemon and restart your daemon.

Add the following configuration to your daemon configuration. On Linux the file is located at `/etc/docker/daemon.json`. If it doesn't exist, you can create it.

```json
{
   "ipv6": true,
   "fixed-cidr-v6": "2001:db8:1::/64"
}
```

Restart your Docker Daemon.

```sh
systemctl restart docker
```

## Configuration

Configure your instance using `docker-compose.yml` file.

- Hostnames are important for FreeIPA, decide your *hostname*. (Note that it should be an FQDN. e.g. *ipa.myhost.local*)
- Set `--realm` option at environment variable *IPA_SERVER_INSTALL_OPTS* in consistency with your **hostname**. (Realm should be UPPERCASE domain name. e.g. *myhost.local*)
- Set your `--ds-password` and `--admin-password`.
- Play with the installation options under environment variable *IPA_SERVER_INSTALL_OPTS* for your needs.


On your host machine add a record containing your FreeIPA *hostname* to your `/etc/hosts` file with `127.0.0.1` IP address. The record should be like the following.

```
127.0.0.1 ipa.myhost.local
```


## Start Service

On your first start, FreeIPA installation will be initialized and it will take a while to finish initialization. You can follow the logs. After that, you can go to the Web UI [https://ipa.myhost.local/ipa/ui](https://ipa.myhost.local/ipa/ui) and login with user `admin` and specified `--admin-password`.

## Data Persistence

For data persistence do not delete `data` directory.

## Compatibility

- Confirmed to work on several Linux distros CentOS, Fedora, Ubuntu. It should work on most of *systemd* based distros.
- Couldn't make it work on Windows, but haven't tried much.
- Couldn't make it work on Windows WSL Linux (probably it doesn't use *systemd*)
- Haven't try to run on MacOS.
- You can always use a Linux VM with Docker to run it.


## References
- FreeIPA Docker Image Github page. https://github.com/freeipa/freeipa-container
- FreeIPA Quick Start Guide [](https://www.freeipa.org/page/Quick_Start_Guide)
