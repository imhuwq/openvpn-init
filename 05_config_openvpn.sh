source openvpn-ca/vars
cd openvpn-ca/keys
sudo cp ca.crt "${KEY_NAME}.crt" "${KEY_NAME}.key" ta.key dh2048.pem /etc/openvpn
cd ../../
rm -rf openvpn-cfg
mkdir -p openvpn-cfg
cd openvpn-cfg
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > server.conf

sed -i "s/port 1194/port 22222/g" server.conf
sed -i "/;tls-auth ta.key 0/a key-direction 0" server.conf
sed -i "s/;tls-auth ta.key 0/tls-auth ta.key 0/g" server.conf
sed -i "/;cipher AES-128-CBC/a auth SHA256" server.conf
sed -i "s/;cipher AES-128-CBC/cipher AES-128-CBC/g" server.conf
sed -i "s/;user nobody/user nobody/g" server.conf
sed -i "s/;group nogroup/group nogroup/g" server.conf
sed -i "s/server 10.8.0.0 255.255.255.0/server 10.0.0.0 255.255.255.0/g" server.conf
sed -i "s/;client-to-client/client-to-client/g" server.conf
sed -i "s/cert server.crt/cert server.sophie.crt/g" server.conf
sed -i "s/key server.key/key server.sophie.key/g" server.conf

sudo rm -rf "/etc/openvpn/${KEY_NAME}.conf"
sudo cp server.conf "/etc/openvpn/${KEY_NAME}.conf"
