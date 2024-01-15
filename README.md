# o11y LXC

This container will be used for monitoring and observability. This will include host monitoring, which requires priviledged containers (LXC and Docker, only where needed)

### LXC Setup

In PVE console, run [ttech](https://tteck.github.io/Proxmox/) Ubuntu LXC script

```sh
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/ubuntu.sh)"
```

Select **Advanced** and use the following options:

- Distribution: Ubuntu
- Version: 22.04 (Jammy) LTS
- Type: 0 Priviledged
- root password: leave blank for auto login
- Set container ID: 201
- Set hostname: o11y
- Set disk size (GB): 8
- Allocate CPU cores: 2
- Allocate RAM (MiB): 8000
- Set a bridge: vmbr0
- Set an IPv4 address: dhcp
- Set apt-cacher IP: leave blank
- Disable IPv6: yes
- MTU size: leave blank
- DNS search domain: leave blank
- DNS Server IP: 1.1.1.1
- Set a MAC address: BC:24:11:A1:8A:DD
- Set a VLAN: leave blank
- Verbose mode?: not required

Select desired storage pool when prompted

### Setup environment

Connect to PVE using SSH and connect to container

```sh
lxc-attach 201
```

Clone repository to home directory

```sh
git clone https://github.com/xyzzyyxyz/o11y-lxc
```

Copy directories into place in /opt

```sh
cp ~/o11y-lxc/* /opt
```

---

Folder structure intended for /opt directory
Files to create standard LXC
**ubuntu-lxc.sh** ttech Ubuntu LXC installer. Install with Advanced options

**install-docker.sh** Docker convenience installer from [https://get.docker.com]

**install-tailscale.sh** Tailscale installer. When done, run `tailscale up` and open URL to complete setup

