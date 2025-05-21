FROM gradle:8.7.0-jdk21 AS build

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

RUN gradle build --no-daemon

FROM eclipse-temurin:21-jdk-alpine

COPY --from=build /home/gradle/src/build/libs/*.jar /app/app.jar

#EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

