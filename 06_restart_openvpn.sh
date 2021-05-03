source openvpn-ca/vars
sudo systemctl restart openvpn@${KEY_NAME}
sudo systemctl status openvpn@${KEY_NAME}
