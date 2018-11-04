
FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift


COPY ./JavaHTTPServer.java /opt
COPY ./index.html /opt

WORKDIR /opt
RUN javac JavaHTTPServer.java
CMD ["java", "JavaHTTPServer"]

EXPOSE 8080
