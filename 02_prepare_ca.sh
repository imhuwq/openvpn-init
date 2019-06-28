if [ $# -eq 0 ] 
then
  echo -e "you must provide server name as argument\n"
fi

rm -rf openvpn-ca
make-cadir openvpn-ca
echo """
export KEY_COUNTRY="CN"
export KEY_PROVINCE="GuangDong"
export KEY_CITY="ShenZhen"
export KEY_ORG="imhuwq.com"
export KEY_EMAIL="imhuwq@gmail.com"
export KEY_OU="ShenZhen"
export KEY_NAME="${1}"
""" >> openvpn-ca/vars

