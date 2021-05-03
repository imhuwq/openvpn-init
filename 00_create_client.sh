#!/bin/bash

if [ $# -eq 0 ]
then
  echo -e "you must provide client name as argument\n"
fi

cd openvpn-ca
source ./vars
export KEY_NAME="${1}"

./build-key $1 << EOF










y
y
EOF

cd ..
KEY_DIR=./openvpn-ca/keys
OUTPUT_DIR=./client-cfg/clients
BASE_CONFIG=./client-cfg/base.conf

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${OUTPUT_DIR}/${1}.ovpn

echo ""
echo "${OUTPUT_DIR}/${1}.ovpn"
echo ""
