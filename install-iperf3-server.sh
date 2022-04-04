# Install iperf3
apt install -y iperf3

# Create service bandwidth
cat << EOF > /etc/systemd/system/bandwidth.service
[Unit]
Description=Start iperf server
Wants=network-online.target
After=network-online.target

[Service]
ExecStart=/usr/bin/iperf3 -s
Restart=on-failure
Type=simple

[Install]
WantedBy=multi-user.target

EOF

# Start service
systemctl enable bandwidth.service
systemctl start bandwidth.service

echo "Done"
