cd openvpn-ca
source ./vars

./build-key-server server.sophie << EOF










y
y
EOF
echo -e "\n"

./build-dh
openvpn --genkey --secret keys/ta.key
