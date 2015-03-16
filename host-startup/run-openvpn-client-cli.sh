#!/bin/bash
############################################
### This provided as an example
### To properly copy your resolv.conf before
### and after connection to VPN, we run 
### the docker container in the foreground
### 
### If you prefer to put the container in the 
### background, with "docker run -d" then 
### you'll need a way to manage your hosts resolv.conf
### or use other means. 

cat  /etc/resolv.conf > ./resolv-conf.host
if [  -h /etc/resolv.conf ]
then
  sudo rm /etc/resolv.conf
  sudo cp ./resolv-conf.host /etc/resolv.conf
  export SYMRESOLV=true
fi
DOCKERBIN=$(which docker)
${DOCKERBIN} pull mazaclub/openvpn-client
${DOCKERBIN} run \
 --privileged \
 --rm --net host \
 --name openvpn_client \
 -v /etc/resolv.conf:/etc/resolv.conf \
 -v $(pwd)/ovpn:/etc/openvpn \
 mazaclub/openvpn-client

set -x

if [ "$SYMRESOLV" = "true" ]
then 
  sudo rm /etc/resolv.conf
  sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
else
  sudo cp -av ./resolv-conf.host /etc/resolv.conf
fi
