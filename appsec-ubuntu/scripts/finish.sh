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
rm -rf $HOME/tmp/* \
&& sudo mv $APPSEC_SCRIPTS_DIR/check_versions.sh $HOME/ \
&& sudo apt-get autoremove \
&& sudo apt-get clean 
