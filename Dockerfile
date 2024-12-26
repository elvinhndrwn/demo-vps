FROM openjdk:17-jdk-alpine
COPY target/demo-vps-${APP_VERSION}.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]