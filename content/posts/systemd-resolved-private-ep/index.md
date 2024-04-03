+++
title = "Specific DNS servers for specific domain names with systemd-resolved"
date = "2024-04-04"

[extra]
comment = true

[taxonomies]
tags=["linux"]
+++

Today I had an issue related to Azure Private Endpoints and DNS on my laptop when connected to a company office network.
I think I found a nice work around, so I thought I'd write a blog post about it.
It's only applicable to Linux systems using systemd-resolved for DNS resolution (e.g. most Ubuntu and Fedora installations).

### Background

I'm connected to a client's office network, to work on an application which uses blob storage through an azure storage account.
This storage account has a private endpoint configured so that it can be used by the application without going through the public internet
when the application is running in azure (networking - subnets / vnets is configured accordingly. Not important right now.)

### Problem

When I run the application locally I get timeouts and connection errors when trying to connect to blob storage.
This turns out to be because the vnet mentioned above is peered to the on-premise network I connected my laptop to,
and the default DNS server on this network has been configured such that the blob storage endpoint I'm talking to
(*.blob.core.windows.net) gets resolved to the private endpoint's private IP address.
_However_ some kind of network security is blocking my connection to this private IP address.

I verify this using `dig +short {storageaccountname}.blob.core.windows.net`.

### Potential solutions and work-arounds

Normally the best solution to this kind of problem would be to further troubleshoot why the connection to the private endpoint is getting blocked
(probably a network security group or a firewall configuration either on the related subnets/vnets in Azure or on-premise),
but in my case I just wanted to work-aroud the issue by connecting to the storage account using the storage account's public IP address
(note that this requires your public ip address to be whitelisted in the storage account's firewall if enabled).

The quickest work-around is probably to update the /etc/hosts file with the public IP address of my storage account.
This will work, but it feels a bit too manual.
I'd like to specify a custom DNS server instead, but just for Azure Blob Storage, since I still need to resolve other "private" domains using the network's default DNS server.

Queue systemd-resolved

#### Specific DNS servers for specific domain names with systemd-resolved

Systemd-resolved is configured either by modifying the /etc/systemd/resolved.conf configuration file,
or by creating "drop-ins" in the /etc/systemd/resolved.conf.d directory.
We'll do the latter.


```bash
sudo mkdir -p /etc/systemd/resolved.conf.d/
sudo $EDITOR /etc/systemd/resolved.conf.d/az_blob_pub_ip.conf
```

Then enter the following file content (adjust as wanted)

```ini
# Work around network errors connecting from office network to azure blob storage private endpoints
# by forcing DNS to a public DNS server (in this case cloudflare DNS)
[Resolve]
DNS=1.1.1.1 2606:4700:4700::1111
Domains=~blob.core.windows.net
```

Save the file and close your editor, then restart systemd-resolved to pick up the new configuration.

```bash
systemctl restart systemd-resolved.service
```

All done! We can verify we get the azure blob store's public IP address using dig:

```bash
dig +short {storageaccountname}.blob.core.windows.net
```
