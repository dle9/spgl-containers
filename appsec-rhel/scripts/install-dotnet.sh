#!/bin/bash

DOTNET_VERSION=${1:-8.0}

# get it
sudo dnf -y update \
&& sudo dnf install -y dotnet-sdk-$DOTNET_VERSION \
&& sudo dnf clean all

# dotnet 6
# wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
# chmod +x dotnet-install.sh 
# ./dotnet-install.sh --channel 6.0 --install-dir /usr/bin/.dotnet6
# echo "export PATH=$PATH:/usr/bin/.dotnet6" >> $HOME/.bashrc
# exec /bin/bash