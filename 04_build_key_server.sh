cd openvpn-ca
source ./vars

./build-key-server ${KEY_NAME} << EOF










y
y
EOF
echo -e "\n"

./build-dh
openvpn --genkey --secret keys/ta.key
