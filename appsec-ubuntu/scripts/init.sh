#!/bin/bash

sudo mkdir ${APPSEC_USER_HOME}/tmp
sudo mkdir ${APPSEC_TOOL_DIR}
sudo mkdir ${APPSEC_APP_DIR}

# install
# && apt-get install -y git build-essential coreutils unzip \
sudo apt-get update -y \
&& sudo apt-get install -y git wget curl unzip \
&& sudo apt-get install -y tar file \
&& sudo apt-get clean \
&& sudo chown -R $APPSEC_USER:$APPSEC_GROUP ${APPSEC_SCRIPTS_DIR} \
&& sudo chown -R $APPSEC_USER:$APPSEC_GROUP ${APPSEC_TOOL_DIR} \
&& sudo chown -R $APPSEC_USER:$APPSEC_GROUP ${APPSEC_APP_DIR} \
&& sudo chown -R $APPSEC_USER:$APPSEC_GROUP ${APPSEC_USER_HOME}/tmp
