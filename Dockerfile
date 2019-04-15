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

# SCM
RUN /usr/local/bin/install-plugins.sh git
RUN /usr/local/bin/install-plugins.sh github
RUN /usr/local/bin/install-plugins.sh git-parameter
RUN /usr/local/bin/install-plugins.sh github-pullrequest

# Pipeline
RUN /usr/local/bin/install-plugins.sh workflow-multibranch
RUN /usr/local/bin/install-plugins.sh pipeline-timeline
RUN /usr/local/bin/install-plugins.sh pipeline-model-definition
RUN /usr/local/bin/install-plugins.sh build-pipeline-plugin
RUN /usr/local/bin/install-plugins.sh workflow-scm-step
RUN /usr/local/bin/install-plugins.sh pipeline-stage-step
RUN /usr/local/bin/install-plugins.sh kubernetes-pipeline-devops-steps

RUN /usr/local/bin/install-plugins.sh junit
RUN /usr/local/bin/install-plugins.sh ant
RUN /usr/local/bin/install-plugins.sh pipeline-maven

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins

# install Ant
USER root
RUN apt-get update && apt-get install -y ant
USER jenkins
