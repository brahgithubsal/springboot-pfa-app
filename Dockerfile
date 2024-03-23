# Stage 1: Build with Maven (using jelastic/maven image)
FROM jelastic/maven:3.9.5-openjdk-21 AS builder

# Set the working directory in the build stage
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Install dependencies and build the application
RUN mvn clean package

# Stage 2: Create a lightweight runtime image (using openjdk image)
FROM openjdk:21-slim

# Set the working directory in the runtime stage
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=builder /app/target/aziz-0.0.1-SNAPSHOT.jar ./app.jar

# Expose port if your application needs it
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
