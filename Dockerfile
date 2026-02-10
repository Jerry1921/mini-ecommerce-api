# ---------- STAGE 1 : Build ----------

FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /build

# copy only pom first (docker cache optimization)

COPY pom.xml .
RUN mvn -B -q -e -DskipTests dependency:go-offline

# now copy source

COPY src ./src

# build jar

RUN mvn clean package -DskipTests

# ---------- STAGE 2 : Run ----------

FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# copy jar from build stage

COPY --from=build /build/target/*.jar app.jar

# IMPORTANT: cloud platforms provide PORT env variable

ENV PORT=8080
EXPOSE 8080

# Spring Boot must bind to 0.0.0.0 in containers

ENTRYPOINT ["java","-Dserver.port=${PORT}","-Dserver.address=0.0.0.0","-jar","app.jar"]
