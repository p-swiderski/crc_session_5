from jenkins/jenkins:2.164.2

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext
RUN /usr/local/bin/install-plugins.sh mailer
RUN /usr/local/bin/install-plugins.sh slack

# Artifacts
RUN /usr/local/bin/install-plugins.sh htmlpublisher

# UI
RUN /usr/local/bin/install-plugins.sh greenballs
RUN /usr/local/bin/install-plugins.sh simple-theme-plugin

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes

# Pipeline
RUN /usr/local/bin/install-plugins.sh pipeline

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins

# install Ant
USER root
RUN apt-get update && apt-get install -y ant
USER jenkins
