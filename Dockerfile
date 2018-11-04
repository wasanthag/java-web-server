
FROM openjdk18-openshift


COPY ./JavaHTTPServer.java /var/www/java
COPY ./index.html /var/www/java

WORKDIR /var/www/java
RUN javac JavaHTTPServer.java
CMD ["java", "JavaHTTPServer"]

EXPOSE 8080
