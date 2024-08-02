# image to use
FROM ubuntu:latest

# setup environment
ENV APPSEC_GROUP=appsec-group
ENV APPSEC_USER=appsec-user
ENV APPSEC_USER_HOME=/home/${APPSEC_USER}
ENV APPSEC_TOOL_DIR=${APPSEC_USER_HOME}/tools
ENV APPSEC_SCRIPTS_DIR=/scripts

# configure environment
RUN mkdir -p ${APPSEC_SCRIPTS_DIR}
COPY ./scripts/* ${APPSEC_SCRIPTS_DIR}
RUN ${APPSEC_SCRIPTS_DIR}/config.sh
USER ${APPSEC_USER}
WORKDIR ${APPSEC_USER_HOME}

# initialize environment; build the container
RUN ${APPSEC_SCRIPTS_DIR}/init.sh \
    ### java
    && ${APPSEC_SCRIPTS_DIR}/install-java.sh 8 \
    && ${APPSEC_SCRIPTS_DIR}/install-maven.sh 3.8.8 \
    && ${APPSEC_SCRIPTS_DIR}/install-gradle.sh 7.6.4 \
    # scala, sbt, <more scala stuff here>
    && ${APPSEC_SCRIPTS_DIR}/install-scala-stuff.sh 3.3.3 1.9.0 \

    ### node, npm
    && ${APPSEC_SCRIPTS_DIR}/install-node.sh 21.x \
    # yarn, bower, <more npm stuff here>
    && ${APPSEC_SCRIPTS_DIR}/install-npm-packages.sh 1.21.1 1.8.14 \

    ### ruby, rbenv, ruby-build
    && ${APPSEC_SCRIPTS_DIR}/install-ruby.sh \
    # cocoapods, <more ruby stuff here>
    && ${APPSEC_SCRIPTS_DIR}/install-ruby-packages.sh 1.14.2 \

    ### go
    && ${APPSEC_SCRIPTS_DIR}/install-go.sh 1.21.5 \

    ### php
    && ${APPSEC_SCRIPTS_DIR}/install-php.sh 8.2 \
    # composer, <more PHP plugins here>
    && ${APPSEC_SCRIPTS_DIR}/install-php-stuff.sh 2.6.6 \

    ### r
    && ${APPSEC_SCRIPTS_DIR}/install-r.sh \
    # packrat, <more R packages here>
    && ${APPSEC_SCRIPTS_DIR}/install-r-packages.sh 0.9.2 \

    ### dotnet
    && ${APPSEC_SCRIPTS_DIR}/install-dotnet.sh 8.0 \
    # paket, <more dotnet stuff here>
    && ${APPSEC_SCRIPTS_DIR}/install-dotnet-stuff.sh 8.0.0 \

    ### python, pip, pipenv 
    && ${APPSEC_SCRIPTS_DIR}/install-python.sh \
    # poetry <more pip packages here>
    && ${APPSEC_SCRIPTS_DIR}/install-pip-packages.sh \ 

    ### cargo
    && ${APPSEC_SCRIPTS_DIR}/install-cargo.sh 1.70.0

# set the path, show versions of installations
RUN ${APPSEC_SCRIPTS_DIR}/finish.sh