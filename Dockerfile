# Base Image
FROM openjdk:17-jdk-slim

# App directory inside container
WORKDIR /app

# Copy built jar file from host to container
COPY target/*.jar app.jar

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

