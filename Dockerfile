# Stage 1: Build the app
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Run with Tomcat
FROM tomcat:9-jdk17
WORKDIR /app
COPY --from=build /app/target/kastro-app.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

