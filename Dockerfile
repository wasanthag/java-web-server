
FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift


COPY target/java-web-server-1.0-SNAPSHOT.jar .
COPY ./index.html .

WORKDIR .
CMD java -jar target/java-web-server-1.0-SNAPSHOT.jar

EXPOSE 8080
