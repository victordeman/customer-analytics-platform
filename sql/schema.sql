CREATE DATABASE customer_analytics;
USE customer_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    INDEX idx_transaction_date (transaction_date)
) ENGINE=InnoDB PARTITION BY RANGE (UNIX_TIMESTAMP(transaction_date)) (
    PARTITION p0 VALUES LESS THAN (UNIX_TIMESTAMP('2025-01-01')),
    PARTITION p1 VALUES LESS THAN (UNIX_TIMESTAMP('2025-07-01')),
    PARTITION p2 VALUES LESS THAN (MAXVALUE)
);
