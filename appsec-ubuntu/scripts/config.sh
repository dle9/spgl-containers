#!/bin/bash

# setup
apt-get update -y \
&& apt-get install -y sudo

# create group and user
groupadd ${APPSEC_GROUP}
useradd -m -d ${APPSEC_USER_HOME} -g ${APPSEC_GROUP} -s /bin/bash ${APPSEC_USER}

# configure for sudo, use No Password
echo "${APPSEC_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${APPSEC_USER}
chmod 0440 /etc/sudoers.d/${APPSEC_USER}

# create bashrc for the user
if [ ! -f ${APPSEC_USER_HOME}/.bashrc ]; then
    cp /etc/skel/.bashrc ${APPSEC_USER_HOME}/.bashrc
    chown ${APPSEC_USER}:${APPSEC_GROUP} ${APPSEC_USER_HOME}/.bashrc
fi

# misc setup
if [ ! -f ${APPSEC_USER_HOME}/.bashrc ]; then
    cp /etc/skel/.profile ${APPSEC_USER_HOME}/.profile
    chown ${APPSEC_USER}:${APPSEC_GROUP} ${APPSEC_USER_HOME}/.profile
fi
echo "export LANG=en_US.UTF-8" >> ${APPSEC_USER_HOME}/.profile