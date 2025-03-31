CREATE DATABASE products;

\c products;

CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    avaible VARCHAR(50) NOT NULL,
    stock BIGINT NOT NULL,
    price DOUBLE PRECISION NOT NULL,
);

CREATE TABLE IF NOT EXISTS product_categories (
    product_id BIGINT NOT NULL,
    category VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS product_images (
    product_id BIGINT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);
