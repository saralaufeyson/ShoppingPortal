--create db shop
Create database shop;
use shop;


-- Create the product table
CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL
);

-- Create the shopping_cart table
CREATE TABLE shopping_cart (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Insert data into the product table
INSERT INTO product (name, price, quantity) VALUES ('Product 1', 10.00, 5);
INSERT INTO product (name, price, quantity) VALUES ('Product 2', 20.00, 3);
INSERT INTO product (name, price, quantity) VALUES ('Product 3', 30.00, 2);

-- Insert data into the shopping_cart table
INSERT INTO shopping_cart (product_id, quantity) VALUES (1, 2);
INSERT INTO shopping_cart (product_id, quantity) VALUES (2, 1);
INSERT INTO shopping_cart (product_id, quantity) VALUES (3, 3);