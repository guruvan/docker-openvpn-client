#!/bin/bash
DOCKERBIN=$(which docker)
${DOCKERBIN} pull mazaclub/openvpn-client
${DOCKERBIN} run \
 --privileged \
 --net host \
 --rm \
 --name openvpn_client \
 -v /etc/openvpn/CLIENT_NAME.ovpn:/etc/openvpn/CLIENT_NAME.ovpn \
 mazaclub/openvpn-client
