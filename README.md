# Web Scraper Project

## Introduction

This project involves setting up:
- Virtual Environments
- CI/CD pipelines
- Virtual Private Clouds
- Ansible playbooks

To set up a full DevOps pipeline from testing to deployment. The application used is a web scraper written in Python, all saved in the ``app_code`` directory.


## Local Development Environments with Vagrant

Vagrant allows to set up and configure virtual machines locally utilising VirtualBox.

[Setting up Vagrant and Virtualbox](https://github.com/ldaijiw/vagrant_setup)

The Vagrantfile has been configured to set up the VM as follows:
- Ubuntu version 18.04
- Syncs the whole ``app_code`` folder into the VM
- Runs the provision script found in ``vagrant_provisions`` folder which carries out the following actions:
    - Installs python and pip
    - Installs all necessary dependencies
    - Creates ``Downloads`` folder to save CSV files to

- To start the VM: ``vagrant up``
- To SSH into the VM: ``vagrant ssh``
- Ensure everything is in working order:
```
cd app_code/
python3 -m pytest tests/
```
