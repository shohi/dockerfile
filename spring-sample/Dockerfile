FROM java:8u111-jdk

COPY resources/spring-boot-sample-web-jsp-2.0.1.BUILD-SNAPSHOT.war /app/app.war
EXPOSE 8080 9010

WORKDIR /app
ENTRYPOINT ["java", "-Djavax.management.builder.initial=", "-Dcom.sun.management.jmxremote", "-Dcom.sun.management.jmxremote.port=9010", "-Dcom.sun.management.jmxremote.local.only=false", "-Dcom.sun.management.jmxremote.authenticate=false", "-Dcom.sun.management.jmxremote.ssl=false", "-jar", "app.war"]
# ENTRYPOINT ["java", "-jar", "app.war"]