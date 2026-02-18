FROM maven AS build

WORKDIR /demo/grot-db
COPY pom.xml .
COPY parent-pom.xml /pom.xml
COPY src/ src/

RUN mvn clean package

FROM eclipse-temurin
WORKDIR /app
COPY --from=build /demo/grot-db/target/grot-db-1.0.0-SNAPSHOT.jar .

EXPOSE 8080
CMD ["java", "-jar", "grot-db-1.0.0-SNAPSHOT.jar"]
