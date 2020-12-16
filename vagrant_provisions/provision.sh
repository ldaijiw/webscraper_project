#!/bin/bash

sudo apt update

sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install --upgrade pip

pip3 install -r /home/vagrant/app_code/requirements.txt
mkdir /home/vagrant/Downloads
sudo chmod 777 /home/vagrant/Downloads
echo hello world