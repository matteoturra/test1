FROM rhel7:latest


RUN dnf -y update && dnf clean all

RUN dnf install -y wget telnet findutils zip tar unzip mlocate
RUN dnf -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

RUN mkdir /opt/rh

WORKDIR /opt/rh

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.zip

RUN unzip apache-tomcat-7.0.69.zip

RUN rm -rf apache-tomcat-7.0.69.zip

RUN ls -la

WORKDIR /opt/rh/apache-tomcat-7.0.69

RUN chmod +x bin/*.sh
RUN curl -o /opt/rh/apache-tomcat-7.0.69/webapps/ugovweb.war http://nexus.u-gov.it/nexus/service/local/repositories/esse3-snapshots/content/it/cineca/u-gov/web/kion/UGovWeb_kion/11.08.02-SNAPSHOT/UGovWeb_kion-11.08.02-20140206.142911-1.war



ENV JAVA_OPTS="-Djava.net.preferIPv4Stack=true"

EXPOSE 8080

ENTRYPOINT ["./bin/catalina.sh"]

CMD ["run"]
