# Menggunakan base image dari OpenJDK 17
FROM openjdk:17-jdk-alpine

# Mendefinisikan ARG untuk nama aplikasi, versi, dan pengaturan JVM
ARG APP_NAME
ARG APP_VERSION
ARG XMS=256m
ARG XMX=512m
ARG METASPACE_SIZE=256m
ARG MAX_METASPACE_SIZE=512m

# Menyalin file .jar yang dibangun berdasarkan nama aplikasi dan versi
COPY target/${APP_NAME}-${APP_VERSION}.jar app.jar

# Menjalankan aplikasi Spring Boot dengan pengaturan JVM
ENTRYPOINT ["java", "-Xms${XMS}", "-Xmx${XMX}", "-XX:MetaspaceSize=${METASPACE_SIZE}", "-XX:MaxMetaspaceSize=${MAX_METASPACE_SIZE}", "-jar", "/app.jar"]