-- Create the products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create the sales table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    customer_name VARCHAR(100),
    employee_name VARCHAR(100)
);

-- Create the sales_items table
CREATE TABLE sales_items (
    sale_item_id SERIAL PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create the purchases table
CREATE TABLE purchases (
    purchase_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    supplier_name VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert mock data into products
INSERT INTO products (name, description, price, stock_quantity) VALUES
('Laptop', '15-inch gaming laptop', 1200.00, 50),
('Smartphone', 'Latest model smartphone', 800.00, 100),
('Headphones', 'Wireless noise-canceling headphones', 150.00, 200),
('Keyboard', 'Mechanical keyboard', 90.00, 150),
('Mouse', 'Ergonomic wireless mouse', 45.00, 180),
('Monitor', '27-inch 4K monitor', 500.00, 80),
('Printer', 'Laser printer', 300.00, 60),
('Tablet', '10-inch tablet', 400.00, 90),
('Webcam', '1080p webcam', 80.00, 120),
('External SSD', '1TB external SSD drive', 250.00, 70);

-- Insert mock data into sales
INSERT INTO sales (sale_date, total_amount, customer_name, employee_name) VALUES
('2024-03-01 10:30:00', 1500.00, 'Alice Johnson', 'John Doe'),
('2024-03-02 14:45:00', 800.00, 'Bob Smith', 'Jane Doe'),
('2024-03-03 09:15:00', 245.00, 'Charlie Brown', 'Chris Green'),
('2024-03-04 16:30:00', 700.00, 'Diana Prince', 'Laura Blue'),
('2024-03-05 11:20:00', 90.00, 'Edward Cullen', 'Mike Black'),
('2024-03-06 13:05:00', 1200.00, 'Fiona Gallagher', 'Sophia White'),
('2024-03-07 15:40:00', 600.00, 'George Weasley', 'James Red'),
('2024-03-08 12:00:00', 400.00, 'Harry Potter', 'Lily Green'),
('2024-03-09 08:50:00', 300.00, 'Isabelle Lightwood', 'Peter Yellow'),
('2024-03-10 17:15:00', 120.00, 'Jack Sparrow', 'Tony Orange');

-- Insert mock data into sales_items
INSERT INTO sales_items (sale_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 1200.00),
(1, 3, 2, 150.00),
(2, 2, 1, 800.00),
(3, 5, 1, 45.00),
(3, 4, 2, 90.00),
(4, 8, 1, 400.00),
(5, 4, 1, 90.00),
(6, 1, 1, 1200.00),
(7, 6, 1, 500.00),
(7, 5, 2, 45.00),
(8, 8, 1, 400.00),
(9, 7, 1, 300.00),
(10, 9, 1, 80.00),
(10, 5, 1, 40.00);

-- Insert mock data into purchases
INSERT INTO purchases (product_id, quantity, purchase_price, purchase_date, supplier_name) VALUES
(1, 20, 1000.00, '2024-02-25 09:00:00', 'TechSupplier Inc.'),
(2, 30, 700.00, '2024-02-26 10:15:00', 'Mobile World'),
(3, 50, 120.00, '2024-02-27 11:30:00', 'AudioGear Co.'),
(4, 40, 75.00, '2024-02-28 12:45:00', 'KeyTech Ltd.'),
(5, 60, 35.00, '2024-02-29 14:00:00', 'MouseWorld'),
(6, 25, 450.00, '2024-03-01 15:15:00', 'DisplayCorp'),
(7, 15, 250.00, '2024-03-02 16:30:00', 'PrintFast'),
(8, 35, 350.00, '2024-03-03 17:45:00', 'Tablet Universe'),
(9, 40, 60.00, '2024-03-04 18:00:00', 'CamGear Ltd.'),
(10, 30, 200.00, '2024-03-05 19:15:00', 'Storage Solutions');
