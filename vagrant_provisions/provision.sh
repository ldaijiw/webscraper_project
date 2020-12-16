#!/bin/bash

sudo apt update

# Install python and pip
sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install --upgrade pip

# Install all dependencies found in requirements.txt
pip3 install -r /home/vagrant/app_code/requirements.txt

# create Downloads folder for CSVs to be saved to with necessary permissions
mkdir /home/vagrant/Downloads
sudo chmod 777 /home/vagrant/Downloads
