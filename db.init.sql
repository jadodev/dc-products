-- Crear la base de datos si no existe
CREATE DATABASE products;

-- Conectar a la base de datos
\c products;

-- Crear tabla principal de productos
CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    avaible VARCHAR(50) NOT NULL,
    stock BIGINT NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    total_price DOUBLE PRECISION,
    discount DOUBLE PRECISION,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para las categorías del producto (relación 1 a N)
CREATE TABLE IF NOT EXISTS product_categories (
    product_id BIGINT NOT NULL,
    category VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

-- Tabla para las imágenes del producto (relación 1 a N)
CREATE TABLE IF NOT EXISTS product_images (
    product_id BIGINT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);
