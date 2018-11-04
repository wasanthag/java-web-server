
FROM openjdk18-openshift


COPY ./JavaHTTPServer.java /opt
COPY ./index.html /opt

CMD javac /opt/JavaHTTPServer.java
CMD java /opt/JavaHTTPServer.java

EXPOSE 8080
