# ACI-SFTP

![Docker Stars](https://img.shields.io/docker/stars/arkenergy/aci-sftp.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/arkenergy/aci-sftp.svg)

![OpenSSH logo](https://raw.githubusercontent.com/atmoz/sftp/master/openssh.png "Powered by OpenSSH")

## Host SFTP on Azure Container Instances

This image is based on [atmoz/sftp:latest](https://hub.docker.com/r/atmoz/sftp/) with the addition of sourcing SSH Keys from /ssh

Azure Container Instances doesn't allow to mount single files but only folders.
Mounting `/etc/ssh` for using stable keys would override the `/etc/ssh/ssh_config` and other files present in `/etc/ssh`.

This image copy `ssh_host_*key` files present in `/ssh` to `/etc/ssh` on startup.
This way is possible to mount keys as ACI's secrets in `/ssh`.

## Example

```yaml
apiVersion: 2018-10-01
location: westeurope
name: myContainerGroup
properties:
  containers:
  - name: sftp
    properties:
      image: arkenergy/aci-sftp:latest
      resources:
        requests:
          cpu: 1
          memoryInGb: 1
      ports:
      - port: 22
      volumeMounts:
      - mountPath: /ssh
        name: sshkeys
  osType: Linux
  volumes:
  - name: sshkeys
    secret:
      ssh_host_rsa_key: your_base64_key
      ssh_host_ed25519_key: your_base64_key
  ipAddress:
    type: Public
    ports:
    - protocol: tcp
      port: 22
tags: null
type: Microsoft.ContainerInstance/containerGroups
```

```sh
# Deploy with YAML template
az container create \
  --resource-group myResourceGroup \
  --file aci-sftp.yaml
```

Tip: you can generate your keys with these commands:

```
ssh-keygen -t ed25519 -f ssh_host_ed25519_key < /dev/null
ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key < /dev/null
```
and then you can obtain the base64 string to use in ACI Secrets with these:
```
base64 -w0 ssh_host_ed25519_key
base64 -w0 ssh_host_rsa_key
```
