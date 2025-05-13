# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run (Use Tomcat to run the WAR file)
FROM tomcat:9-jdk17
WORKDIR /app
COPY --from=build /app/target/01-maven-web-app.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

