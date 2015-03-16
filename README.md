### docker-openvpn-client
simple openvpn client image - FROM debian:wheezy

# Usage

 * Quick Start
   ```
   mkdir -pv ovpn
   cp -av /some/place/client.ovpn ovpn/client.ovpn
   ./host-startup/run-openvpn-client-cli.sh
   ```
The provided script will 
 - back up /etc/resolv.conf
 - mount your ovpn file inside the container 
 - mount the host's /etc/resolv.conf as /etc/resolv.conf inside the container
 - start openvpn
 - connect to your vpn
 - restore /etc/resolv.conf on exit - this requires sudo privs

 If your vpn configuration modifies resolv.conf, your host will enjoy this benefit



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
    -v $(pwd)/ovpn:/etc/openvpn
```

If you would like the VPN to update the hosts resolv.conf
```
   -v /etc/resolv.conf:/etc/resolv.conf
```
startup command inside the container will start openpn with your config

