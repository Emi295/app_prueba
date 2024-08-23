# Etapa 1: Construcción del proyecto
FROM maven:3.8.6-openjdk-17-slim AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y descargar las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiar el resto del código fuente
COPY src ./src

# Construir el proyecto (aquí puedes pasar variables de entorno si es necesario)
ARG DB_URL
ARG DB_USER
ARG DB_PASSWORD
RUN mvn clean package -Dspring-boot.run.arguments="--spring.datasource.url=${DB_URL} --spring.datasource.username=${DB_USER} --spring.datasource.password=${DB_PASSWORD}"

# Etapa 2: Construcción de la imagen final
FROM openjdk:17-jdk-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo JAR construido en la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar","/app/app.jar"]