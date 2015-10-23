docker run -t -i -h openvpn \
  --name openvpn \
  --dns=8.8.8.8 \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -v $(pwd)/vpn:/vpn \
  -v /media/space/incoming:/incoming \
  -p 6886:6886 3dbe80a865d7 \
  /bin/bash
