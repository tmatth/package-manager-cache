# A dockerized package manager HTTP proxy

`package-manager-cache` is a [docker](https://www.docker.com) container image which provides optimized HTTP caching for the following sources:

* apt repositories (for Debian-based operating systems)
* yum repositories (for RedHat-based operating systems)

It's based on:
* [Squid](http://www.squid-cache.org) HTTP proxy
* `storeid-wrapper`, a Python script which reduce cache misses for files hosted on differents mirrors

## Usage

### Run the proxy

```bash
docker run \
	-it \
	--publish 18080:18080 \
	--volume /mnt/persistent-storage/data:/var/cache/squid \
	--volume /var/log/vmc-cacher:/var/log/squid \
	lionelnicolas/package-manager-cache
```

### Configuring APT

```bash
$~ echo 'Acquire::http::Proxy "http://$HOSTADDR:18080";' > /etc/apt/apt.conf.d/proxy
$~ apt-get update
```

### Configuring YUM

```bash
$~ echo 'proxy=http://$HOSTADDR:18080' >>/etc/yum.conf
$~ yum update
```
