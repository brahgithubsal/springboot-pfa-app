# Stage 1: Build with Maven
FROM maven:3.8.5-openjdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: Create a lightweight base image for Java application runtime
FROM openjdk:21-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the Maven build stage
COPY --from=build /app/target/aziz-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port your application runs on (if needed)
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
