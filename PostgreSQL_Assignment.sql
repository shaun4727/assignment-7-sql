
-- creating book store database
create database bookstore_db;


-- creating table of books
create table books(id SERIAL primary key, 
	title varchar(50),
	author varchar(50),
	price numeric CONSTRAINT positive_price CHECK (price >= 0),
	stock INTEGER,
	published_year INTEGER
);


-- creating table of customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55),
    email VARCHAR(100) UNIQUE,
    joined_date DATE DEFAULT current_date
);


-- creating table of orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
    book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
    quantity INTEGER CHECK (quantity > 0),
    order_date DATE DEFAULT CURRENT_DATE
);


-- inserting data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don not Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);


-- inserting data into customers table

INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');




-- inseting data in to orders table

INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');

-- 1. Find books that are out of stock
select title from books where stock = 0;

-- 2. Retrieve the most expensive book in the store
select * from books where price = (select MAX(price) from books);

-- 3. find the total number of orders placed by each customer
select c."name", count(*) total_orders from orders o left join customers c on c.id = o.customer_id group by "name";


-- 4. Calculate the total revenue generated from book sales
select sum(b.price*o.quantity) total_revenue  from books b right join orders o on b.id = o.book_id;

-- 5. List all customers who have placed more than one order
select c."name",o.quantity as orders_count from orders o left join customers c on c.id = o.customer_id where quantity>1;


-- 6. find the average price of books in the store
select avg(price) from books;

-- 7. Increase the price of all books published before 2000 by 10%.

update books set price = price*1.1 where published_year < 2000; 


-- 8. Delete customers who haven't p   laced any orders
delete from customers where id = (select c.id from orders o right join customers c 
on c.id = o.customer_id where o.quantity is null);