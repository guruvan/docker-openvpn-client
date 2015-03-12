### docker-openvpn-client
simple openvpn client image - FROM debian:wheezy

# Usage

read <code>run-openvpn-client-cli.sh</code> or <code>openvpn-client@.service</code> 

for usage instructions for systemd or commandline docker operation

In short, -v host bindmount a .ovpn to /etc/openvpn/client.ovpn 
and you're in business

<code>-v $(pwd)/client.ovpn:/etc/openvpn/client.ovpn</code>

startup command inside the container will start openpn with your config

