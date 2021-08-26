#!/bin/bash

# Note: This script is designed to be run on a fresh VM after initial configuration.

# Exit on error
set -e

# Install prerequisites
apt-get update -y && sudo apt-get install -y git python3 python3-setuptools python3-pip software-properties-common
apt-add-repository -y --update ppa:ansible/ansible
apt-get install -y ansible
pip3 install --upgrade pip setuptools
