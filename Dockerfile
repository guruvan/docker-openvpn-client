FROM 		debian:wheezy
# IMAGE 	mazaclub/openvpn-client
MAINTAINER 	Rob Nelson <guruvan@maza.club> "https://github.com/mazaclub"
VOLUME		["/etc/openvpn"]
RUN 		apt-get update \
		 && apt-get install -y openresolv openvpn \
		 && apt-get clean
RUN 		mkdir -p /dev/net && mknod /dev/net/tun c 10 200
COPY		. /
ENTRYPOINT	["/bin/bash"]
CMD		["/run_vpn.sh"]
