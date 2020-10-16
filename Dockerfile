#base image
FROM jboss/wildfly:14.0.1.Final
# Maintainer
MAINTAINER "middleware admin" "lamendozar@truper.com"
# Create user  admin with password
RUN /opt/jboss/wildfly/bin/add-user.sh admin 12345678910 --silent
# Add custom configuration file
ADD standalone_tel-batch.xml /opt/jboss/wildfly/standalone/configuration/
# Add drivers
COPY modules /opt/jboss/wildfly/modules
ADD standalone.conf /opt/jboss/wildfly/standalone.conf
WORKDIR /logs/
# JBoss ports
EXPOSE 8080 9990 8009 9001 1116 587 443 80 1121
# Run
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone_tel-batch.xml"]

