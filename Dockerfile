FROM ubuntu:14.04
MAINTAINER murali_44@rediffmail.com
RUN apt-get -y update
RUN apt-get -y install default-jdk tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ADD target/CounterWebApp.war /war/lib/tomcat7/webapps
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]

