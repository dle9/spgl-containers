#!/bin/bash

echo "export PATH=$PATH:\
$APPSEC_TOOL_DIR/go/bin:\
$APPSEC_TOOL_DIR/gradle/bin:\
$APPSEC_TOOL_DIR/maven/bin:\
$APPSEC_TOOL_DIR/coursier/bin:\
$HOME/.dotnet/tools:\
$HOME/.local/bin:\
$HOME/.cargo/bin" >> $HOME/.bashrc
# JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
# MAVEN_HOME=$APPSEC_TOOL_DIR/maven
# MAVEN_CONFIG=$HOME/.m2
# anything else not listed here is in its the default installation directory

# cleanup
# && sudo rm -rf $APPSEC_SCRIPTS_DIR/ \
rm -rf $HOME/tmp/* \
&& sudo mv $APPSEC_SCRIPTS_DIR/check_versions.sh $HOME/ \
&& sudo cp -r $APPSEC_SCRIPTS_DIR/app/* $APPSEC_APP_DIR \
&& sudo chown -R $APPSEC_USER:$APPSEC_GROUP $APPSEC_APP_DIR/* \
&& sudo mkdir -p $APPSEC_APP_DIR/templates \
&& sudo mv $APPSEC_APP_DIR/*.html $APPSEC_APP_DIR/templates \
&& sudo apt-get autoremove \
&& sudo apt-get clean 
