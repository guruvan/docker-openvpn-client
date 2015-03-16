#!/bin/bash
cp -av /etc/resolv.conf ./resolv-conf.host
DOCKERBIN=$(which docker)
${DOCKERBIN} pull mazaclub/openvpn-client
${DOCKERBIN} run -d \
 --privileged \
 --rm --net host \
 --name openvpn_client \
 -v /etc/resolv.conf:/etc/resolv.conf \
 -v $(pwd)/ovpn:/etc/openvpn \
 mazaclub/openvpn-client
set -x
sudo cp -av ./resolv-conf.host /etc/resolv.conf
