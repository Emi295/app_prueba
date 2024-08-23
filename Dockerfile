# Usar una imagen base de OpenJDK 17
FROM openjdk:17-jdk-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo JAR de la aplicación al contenedor
COPY target/*.jar app.jar

# Exponer el puerto en el que la aplicación Spring Boot se ejecutará
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar","/app/app.jar"]