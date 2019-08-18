#!/bin/bash

echo -e "\e[92m Starting Setup...\e[0m"
echo
echo
echo -e "\e[92m Installing zip and unzip packages...\e[0m"
echo
echo
sudo apt-get update
sudo apt-get install zip unzip -y
echo
echo
echo -e "\e[92m Done! Installing zip and unzip packages...\e[0m"
echo
echo
echo -e "\e[92m Installing ansible package....\e[0m"
echo
echo
sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
echo
echo
echo -e "\e[92m Done! Installing ansible...\e[0m"
echo
echo
echo -e "\e[92m Encrypting vault\e[0m"
echo
echo
ansible-vault encrypt ~/telemetry_workshop/environment/ansible/secrets.yml
echo
echo
echo -e "\e[92m Done encrypting\e[0m"
echo
echo
echo -e "\e[92mInstalling Influxdb.....\e[0m"
echo
echo
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
echo
sudo apt-get update && sudo apt-get install -y influxdb
sudo systemctl unmask influxdb.service
echo
echo
echo -e "\e[92m Done installing Influxdb\e[0m"
echo
echo
echo -e "\e[92m Installing grafana....\e[0m"
echo
echo
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y grafana
echo
echo
echo -e "\e[92m Done installing Grafana\e[0m"
echo
echo
mv * ../
cd ..
rm -rf ./telemetry_workshop
echo
echo -e "\e[92mDone with Setup!\e[0m"
echo
