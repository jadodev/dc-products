# Usa una imagen base con Java 17 y Gradle preinstalado
FROM eclipse-temurin:17-jdk-alpine AS build

# Instala Git y otras dependencias necesarias
RUN apk add --no-cache git

# Define el directorio de trabajo
WORKDIR /app

# Clona el repositorio
RUN git clone https://github.com/jadodev/crud-products.git .

# Da permisos de ejecución al Gradle Wrapper
RUN chmod +x gradlew

# Construye el JAR de la aplicación
RUN ./gradlew build -x test

# Segunda etapa: Imagen final más ligera
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copia el JAR generado en la primera etapa
COPY --from=build /app/build/libs/*.jar app.jar

# Expone el puerto de la aplicación
EXPOSE 8080

# Ejecuta la aplicación con Java
CMD ["java", "-jar", "app.jar"]
