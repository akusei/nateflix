#!/bin/sh

if [ ! -f /openvpn/auth.txt ]; then
  echo "username" >> /openvpn/auth.txt
  echo "password" >> /openvpn/auth.txt
fi

if [ ! -f /openvpn/server.ovpn ]; then
  cp "/etc/openvpn/${VPN_REGION}.ovpn" /openvpn/server.ovpn
  sed -i -e 's#^auth-user-pass$#auth-user-pass /openvpn/auth.txt#g' /openvpn/server.ovpn
fi

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
  mknod /dev/net/tun c 10 200
fi

host=$(grep 'remote .\+ \d\+' /openvpn/server.ovpn | cut -d ' ' -f 2)
port=$(grep 'remote .\+ \d\+' /openvpn/server.ovpn | cut -d ' ' -f 3)

echo y | ufw reset
ufw default allow incoming
ufw default deny outgoing
ufw allow out on eth0 from any to ${host} port ${port}
ufw allow out on tun0 from any to any
ufw enable

exec "$@"
