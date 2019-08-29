
FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift


COPY . /app

WORKDIR .
CMD java -jar /app/target/java-web-server-1.0-SNAPSHOT.jar

EXPOSE 8080
