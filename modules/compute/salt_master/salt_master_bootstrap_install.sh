#!/bin/bash
sudo apt-get upgrade -y

# Ensure keyrings dir exists
sudo mkdir -p /etc/apt/keyrings
# Download public key
curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
# Create apt repo target configuration
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

#Populate /etc/apt/preferences.d/salt-pin-1001 in order to restrict upgrades to Salt 3006.x LTS
echo 'Package: salt-*
Pin: version 3006.*
Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/salt-pin-1001


sudo apt-get update
sudo apt-get install salt-master -y
sudo apt-get install salt-cloud -y

sudo systemctl enable salt-master && sudo systemctl start salt-master