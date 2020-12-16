#!/bin/bash

echo "Enter IP address for EC2 instance to set up Ansible Controller:"

read ip_addr


scp -i ~/.ssh/eng74_leo_aws_key.pem ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr:~/.ssh/eng74_leo_aws_key.pem

# copy playbooks folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r playbooks/ ubuntu@$ip_addr:/home/ubuntu/playbooks/ 


ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr << EOF
sudo hostnamectl set-hostname ansible-controller

sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# installing python 
sudo apt install python3-pip -y
pip3 install --upgrade pip

# Installing necessary packages to allow communication with AWS
pip3 install awscli
pip3 install boto
pip3 install boto3

sudo chmod 400 ~/.ssh/eng74_leo_aws_key.pem

EOF


ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr 