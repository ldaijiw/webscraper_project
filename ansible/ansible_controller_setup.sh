#!/bin/bash

# Script to set up and configure EC2 instance as Ansible Controller

echo "Enter IP address for EC2 instance to set up Ansible Controller:"

read ip_addr

# copy aws key
scp -i ~/.ssh/eng74_leo_aws_key.pem ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr:~/.ssh/eng74_leo_aws_key.pem

# copy playbooks folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r ansible/playbooks/ ubuntu@$ip_addr:/home/ubuntu/

# copy ansible config file
scp -i ~/.ssh/eng74_leo_aws_key.pem ansible/ansible.cfg ubuntu@$ip_addr:/home/ubuntu/

# copy hosts file
scp -i ~/.ssh/eng74_leo_aws_key.pem ansible/hosts ubuntu@$ip_addr:/home/ubuntu/

# copy app_code folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r app_code/ ubuntu@$ip_addr:/home/ubuntu/


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

sudo mv ansible.cfg /etc/ansible/
sudo mv hosts /etc/ansible/

EOF


ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr 