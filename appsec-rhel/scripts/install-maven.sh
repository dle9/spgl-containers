#!/bin/bash

MAVEN_VERSION=${1:-3.8.8}
INSTALL_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

# setup
sudo dnf -y update \
&& sudo dnf clean all

# install
sudo mkdir -p /usr/share/maven /usr/share/maven/ref \
&& sudo curl -fsSL -o $HOME/tmp/apache-maven.tar.gz ${INSTALL_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# extract
sudo mkdir $HOME/tmp/maven
sudo tar --no-same-owner --no-overwrite-dir -xzf $HOME/tmp/apache-maven.tar.gz -C $HOME/tmp/maven --strip-components=1
sudo cp -R $HOME/tmp/maven/* /usr/share/maven/

# clean up and finish
sudo rm -f $HOME/tmp/apache-maven.tar.gz
sudo ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# # install it
# sudo dnf -y update \
# && sudo dnf install -y maven

# # env vars
# # echo "export MAVEN_HOME=/usr/share/maven" >> $HOME/.bashrc
# echo "export MAVEN_HOME=$APPSEC_TOOL_DIR/maven" >> $HOME/.bashrc
# echo "export MAVEN_CONFIG=$HOME/.m2" >> $HOME/.bashrc 
# exec /bin/bash

# # config
# sudo chown -R $APPSEC_USER:$APPSEC_GROUP $APPSEC_TOOL_DIR/maven
