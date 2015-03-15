#!/bin/bash -x
cd /etc/openvpn; /usr/sbin/openvpn "$(ls *.ovpn *.conf 2>/dev/null)"
