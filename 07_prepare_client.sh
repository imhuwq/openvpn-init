if [ $# -eq 0 ]
then
  echo -e "you must provide server IP as argument\n"
fi

mkdir -p client-cfg/clients
chmod 700 client-cfg/clients
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf client-cfg/base.conf
cd client-cfg

sed -i "s/remote my-server-1 1194/remote ${1} 22222/g" base.conf
sed -i "s/;user nobody/user nobody/g" base.conf
sed -i "s/;group nogroup/group nogroup/g" base.conf

sed -i "s/^ca ca.crt/# ca ca.crt/g" base.conf
sed -i "s/^cert client.crt/# cert client.crt/g" base.conf
sed -i "s/^key client.key/# key client.key/g" base.conf

sed -i "/;cipher x/a key-direction 1" base.conf
sed -i "/;cipher x/a auth SHA256" base.conf
sed -i "s/;cipher x/cipher AES-128-CBC/g" base.conf

echo "" >> base.conf
echo "# uncomment following three lines for linux clients" >> base.conf
echo "# script-security 2" >> base.conf
echo "# up /etc/openvpn/update-resolv-conf" >> base.conf
echo "# down /etc/openvpn/update-resolv-conf" >> base.conf
