#!/bin/bash

echo "Enter AWS access key for Ansible to use to connect to VPC:"
read access_key

echo "Enter AWS secret key for Ansible to use to connect to VPC:"
read secret_key

echo $access_key >> aws_keys.yml
echo $secret_key >> aws_keys.yml 

ansible-vault encrypt aws_keys.yml

sudo mkdir /etc/ansible/group_vars
sudo mkdir /etc/ansible/group_vars/all

sudo mv aws_keys.yml /etc/ansible/group_vars/all/