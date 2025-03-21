FROM eclipse-temurin:17-jdk-alpine

# Instalar Git para clonar el repositorio
RUN apk add --no-cache git

# Crear directorio de trabajo
WORKDIR /app

# Clonar el repositorio
RUN git clone https://github.com/jadodev/crud-products.git /app

# Construir la aplicación
RUN ./mvnw clean package -DskipTests

# Exponer el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "target/*.jar"]
