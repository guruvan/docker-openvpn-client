### docker-openvpn-client
simple openvpn client image - FROM debian:wheezy

# Usage

read 
```
   host-startup/run-openvpn-client-cli.sh
   host-startup/openvpn-client@.service
```


for usage instructions for systemd or commandline docker operation

In short, -v host bindmount a .ovpn to /etc/openvpn/client.ovpn 
or -v bindmount a dir to /etc/openvpn
and you're in business

```
    -v $(pwd)/client.ovpn:/etc/openvpn/client.ovpn
```

startup command inside the container will start openpn with your config

