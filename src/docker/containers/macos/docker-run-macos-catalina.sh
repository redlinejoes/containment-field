#!/bin/sh

################################################################################
# Script Name: docker-run-macos-catalina.sh
# Description: This script deploys a pre-installed macOS Catalina Version 10.15
# Author: Joseph Young <joe@youngsecurity.net>
# Created: 2023/06/15
# Version: 1.0
################################################################################

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
#VAR1="value1"
#VAR2="value2"

# Define functions
deploy_macos_catalina() {
# 40GB disk space required: 20GB original image 20GB your container.
#docker pull sickcodes/docker-osx:latest

# Used for building the image from GitHub repository: sickcodes/docker-osx 
#docker build -t docker-osx:latest \
#    --build-arg RANKMIRRORS=true \
#    --build-arg MIRROR_COUNTRY=US \
#    --build-arg MIRROR_COUNT=10 \
#    --build-arg SHORTNAME=catalina \
#    --build-arg SIZE=200G .

# boot directly into a real OS X shell with a visual display [NOT HEADLESS]
docker run -it \
  --device /dev/kvm \
  -p 50922:10022 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e "DISPLAY=${DISPLAY:-:0.0}" \
  -e GENERATE_UNIQUE=true \
  -e SHORNAME="catalina" \
  docker-osx:latest

# username is user
# passsword is alpine
}

# Main code
# Notify the user the script has started.
echo "Starting the script!"

# Call a function
deploy_macos_catalina

# Do some other things...
#echo "Variable 1 is: $VAR1"
#echo "Variable 2 is: $VAR2"

# Notify the user the script has completed.
echo "Script has finished!"