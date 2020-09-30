#!/bin/bash

printf "\n" | sudo tee -a /var/log/update_script.log
date | sudo tee -a /var/log/update_script.log
sudo apt-get update -y | sudo tee -a /var/log/update_script.log
sudo apt-get upgrade --with-new-pkgs -y | sudo tee -a /var/log/update_script.log
