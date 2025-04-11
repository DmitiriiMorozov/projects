CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY, 
    name VARCHAR(255),
    email VARCHAR(255), 
    registration_date INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    price INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date INT,
    status VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_item_id INT,
    return_date INT,
    reason VARCHAR(255),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date INT,
    amount INT,
    payment_method VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
