# Usar una imagen base oficial de MySQL
FROM mysql:latest

# Establecer variables de entorno para configurar MySQL
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=bd_smanga
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root

# Copiar el archivo .sql al directorio de inicialización de MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto 3306 para MySQL
EXPOSE 3306