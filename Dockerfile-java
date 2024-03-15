# Use a lightweight base image for Java application runtime
FROM openjdk:21-jre-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/aziz-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port your application runs on (if needed)
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
