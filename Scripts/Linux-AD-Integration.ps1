#!/bin/bash
# Install required packages
sudo dnf install realmd sssd adcli samba-common-tools oddjob oddjob-mkhomedir -y

# Join the domain
sudo realm join --user=jadmin yourdomain.local

# Allow all domain users to log in
sudo realm permit --all

# Configure automatic home directory creation
sudo authselect select sssd with-mkhomedir --force
sudo systemctl enable --now oddjobd.service