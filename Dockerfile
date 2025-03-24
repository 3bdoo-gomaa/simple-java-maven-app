# Use an official Maven image to build the application
FROM maven:3.8.6-openjdk-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Use a minimal JDK runtime image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port 8080 (optional, change if your app uses a different port)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
