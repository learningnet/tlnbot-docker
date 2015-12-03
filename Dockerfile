FROM phusion/baseimage
MAINTAINER James Carlos <james@learning.net>

# prevent debian errors
ENV DEBIAN_FRONTEND noninteractive
ENV TERM dumb

RUN \
    apt-get -y install software-properties-common && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
    apt-get update && \
    apt-get -y install expect redis-server nodejs npm

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g coffee-script
RUN npm install -g yo generator-hubot

# Create hubot user
RUN useradd -d /hubot -m -s /bin/bash -U hubot

# Log in as hubot user and change directory
USER    hubot
WORKDIR /hubot

# Install scripts
ADD scripts /hubot/scripts

# Install hubot
RUN yo hubot --owner="James Carlos <james@learning.net>" --name="tlnbot" --description="tlnbot on Docker" --defaults

# Install slack adapter
RUN npm install hubot-slack --save && npm install

# Run hubot
CMD bin/hubot -a slack