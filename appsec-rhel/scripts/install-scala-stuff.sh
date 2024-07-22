#!/bin/bash

SCALA_VERSION=${1:-3.3.3}
SBT_VERSION=${2:-1.9.0}

# get scala installer, coursier (cs)
# includes latest versions of scala, sbt, scalac
sudo dnf update -y \
&& sudo dnf clean all

# get installer
cd $HOME/tmp
sudo curl -Ls https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz -o cs.gz 

# extract
sudo gzip -d cs.gz \
&& sudo chmod +x cs \
&& yes | sudo ./cs setup

# install target scala,sbt version
mkdir -p $HOME/.local/share
sudo mv /root/.local/share/coursier $HOME/.local/share
$HOME/.local/share/coursier/bin/cs install scala:$SCALA_VERSION \
&& $HOME/.local/share/coursier/bin/cs install scalac:$SCALA_VERSION \
&& $HOME/.local/share/coursier/bin/cs install sbt:$SBT_VERSION

sudo chown -R $APPSEC_USER:$APPSEC_GROUP $HOME/.local/share/coursier
sudo mv $HOME/.local/share/coursier $APPSEC_TOOL_DIR