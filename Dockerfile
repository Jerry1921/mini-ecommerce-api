# Use official Java 17 image
FROM eclipse-temurin:17-jdk

# Create app directory
WORKDIR /app

# Copy project files
COPY . .

# Build the jar
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Expose port (Render provides PORT automatically)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]
