# This is an example base image derived from RHEL, but configured to
# look at a Satellite server for content that is different from what
# the host sees.

FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift

USER 0

ADD GreenLab-key.pem /
ADD GreenLab.crt /
ADD greenlab.repo /etc/yum.repos.d/

# Sever the subscription-manager connection between container and
# host...

RUN rm /etc/rhsm-host

# YUM update

RUN yum -y update

USER 1000
