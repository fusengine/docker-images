#!/bin/bash

# add script function
source /root/script_base.sh

# Add repos deluge-team
add-apt-repository ppa:deluge-team/ppa

# add packages
PACKAGES_DEFAULT=" deluged deluge-web"

# update
update

# Install_packages
install_packages

# Upgrade System
upgrade

# Clean System
clean_ubuntu
