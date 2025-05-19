FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/axe-selenuim-java-1.3.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
