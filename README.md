# openvpn-init
scripts to setup a openvpn server quickly

## Initial Setup
- `01_install.sh` install openvpn server
- `02_prepare_ca.sh ${server_name}` create ca folder and util scripts
- `03_build_ca.sh` build server ca
- `04_build_key_server.sh` build server key
- `05_config_openvpn.sh` config openvpn server
- `06_restart_openvpn.sh` restart openvpn server
- `07_prepare_client.sh ${server_ip}` create config template for client config

## Create Client Config
`00_build_key_client.sh ${client_name}` create config for client
