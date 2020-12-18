#!/bin/bash

# Simple script to set up instance as dev env

echo "Enter IP address for EC2 instance:"

read ip_addr

# copy over app_code to instance

scp -i ~/.ssh/eng74_leo_aws_key.pem -r app_code/ ubuntu@$ip_addr:/home/ubuntu/app_code

# ssh in and install dependencies
ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr << EOF

sudo apt update

# Install python and pip
sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install --upgrade pip

# Install all dependencies found in requirements.txt
pip3 install -r /home/ubuntu/app_code/requirements.txt

# create Downloads folder for CSVs to be saved to with necessary permissions
sudo mkdir /home/ubuntu/Downloads
sudo chmod 755 /home/ubuntu/Downloads

EOF

ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr