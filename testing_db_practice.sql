Create database testing_db;

SHOW DATABASES;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT
);

INSERT INTO users (name, email, age)
values ('santhosh', 'santhosh@test.com', '22');

INSERT INTO users (name, email, age)
values ('ravi', 'ravi@test.com', 26), 
('Priya', 'priya@test.com', 28), ('Naveen', 'naveen@test.com', 32), ('sarumathi', 'saru@test.com', 24);

Select * from users;

Select * from users where id in (4,5,6);

SELECT * FROM users WHERE name = 'Santhosh';

SELECT * FROM users WHERE age < 25;

SELECT * FROM users WHERE age > 25;

SELECT * FROM users WHERE name = 'Naveen';

SET SQL_SAFE_UPDATES = 1;

UPDATE users 
SET age = 30
WHERE name = 'Naveen';

SELECT * FROM users WHERE name = 'Santhosh';

DELETE from users
where name = 'ravi';

SELECT * FROM users order by age ASC;

SELECT * FROM users order by age DESC;


Insert into users (name, email, age)
values ('ariv', 'arivu@gmail.com', 65), ('sankar', null, 51);

DESCRIBE users;

SELECT DATABASE();

SHOW CREATE TABLE users;

SELECT * from 
users WHERE name is null or email is null;

Select * from users;

UPDATE users
SET name = 'Unknown'
WHERE ID = 7;

UPDATE users
SET email = 'default@gmail.com'
WHERE ID = 6;
 
ALTER TABLE users
MODIFY email VARCHAR(100) NOT NULL;

ALTER TABLE users
MODIFY email VARCHAR(100) NULL;

ALTER TABLE users
MODIFY name VARCHAR(50) NULL;

UPDATE users
SET name = null
WHERE ID = 7;


UPDATE users
SET email = null
WHERE ID = 6;

SELECT * from users limit 3;

INSERT INTO users (name, email, age)
VALUES ('Kumar', null , 22), (NULL, 'sen@gmail.com', 31);

SELECT * from users;

select * from users where name IS null;

select * from users where email IS NOT null;

-- Counts the No of rows in user table
SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM users WHERE email = 'priya@test.com';

-- Join- used to combine data from multiple tables

CREATE TABLE orders(
order_id INT auto_increment primary key,
user_id INT,
product varchar(50));

insert into orders(user_id, product) VALUES (1, 'Laptop'), (2, 'Mobile');

select * from users;

select * from orders;

insert into orders(user_id, product) VALUES (20, 'Dishwasher');

SELECT users.name, orders.product
FROM users
JOIN orders ON users.id = orders.user_id;

SELECT users.name, orders.product
FROM users
JOIN orders ON users.id = orders.user_id
WHERE users.name = 'Santhosh';

INSERT INTO users (name, email, age)
VALUES ('NoOrderUser', 'no@test.com', 40);

INSERT INTO users (name, email, age)
VALUES ('Dummyuser', 'none@test.com', 40);

Select * From users;

select * from orders;

SELECT users.name, orders.product
FROM users
INNER JOIN orders 
ON users.id = orders.user_id;

SELECT users.name, orders.product
FROM users
RIGHT JOIN orders 
ON users.id = orders.user_id;

UPDATE orders
SET user_id = 11
WHERE order_id = 4;

DELETE from users where id=8;

SELECT COUNT(*) FROM users;

SELECT SUM(age) FROM users;

SELECT AVG(age) FROM users;

SELECT user_id, COUNT(*) 
FROM orders
group by user_id;

SELECT user_id, COUNT(*) 
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;

Insert into orders(user_id, product) VALUES (3, 'Laptop'), (1, 'Mobile'), (4,'Washing Machine');

-- count users with age >25

select * from users;

SELECT COUNT(*) 
FROM users 
WHERE age > 25;

SELECT * 
FROM users
WHERE age = (SELECT MAX(age) FROM users);


SELECT exists (
    SELECT * FROM users WHERE email = 'priya@test.com'
);

SELECT * from users where id in (1,4,6);

SELECT user_id FROM orders;

select* from orders;

SELECT * 
FROM users
WHERE id IN (SELECT user_id FROM orders);

SELECT * 
FROM users
WHERE id NOT IN (SELECT user_id FROM orders);

SELECT * 
FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id
);

CREATE table users_table( user_id INT PRIMARY KEY auto_increment, 
Username VARCHAR(50),
Email VARCHAR(100),
status VARCHAR(20));

CREATE table orders_table( order_id INT PRIMARY KEY auto_increment, 
User_id INT,
Order_date date,
amount DECIMAL(10,2));

SHOW TABLES;

Insert INTO users_table(Username, Email, status) VALUES
('Abi', 'abi@gmail.com', 'Active'), 
('Axar', 'axar@gmail.com', 'Active'), 
('Arun', 'arun@gm.com', 'Active'), ('Amar', 'amar@gmail.com', 'Active'), ('bini', 'bini@gmail.com', 'Inactive'),
('cringe', 'cringe@gm.com', 'Inactive'), ('dixy', 'dixy@gm.com', 'Active');


Insert INTO orders_table(User_id, Order_date, amount) VALUES
(2, '2025-01-10', 25000), 
(1, '2023-11-15', 3500), 
(4, '2024-06-04', 12000), ('7', '2025-07-29' , 1000), ('5', '2026-03-31', 7500),
(3, '2026-01-21', 5000), (6, '2024-09-18', 6000);

Insert INTO users_table (Username, Email, status) VALUES ('Sankar', 'sankar@gmail.com', 'Active');

Insert INTO users_table (Username, Email, status) VALUES ('Vijay', 'Null', 'Active');

Insert INTO users_table (Username, Email, status) VALUES ('Jay', 'Null', 'Active');

UPDATE users_table
SET Email = null
where user_id in (9,10);

select * from users_table;

UPDATE users_table
SET Email = 'known'
Where user_id IN  (9);

UPDATE users_table
SET Email = 'sankar@gm.com'
Where user_id = 8;

ALTER table users_table
MODIFY	Email VARCHAR(100) NULL unique;


Select * from users_table;

Select * from orders_table;

Select * from users_table where status = 'Active';

Select * from users_table where status = 'Inactive';

Select * from users_table where Username = 'Bini';

Select * from users_table where status = 'Active' AND  Username = 'Axar';

Select * from users_table where Username = 'Axar' OR Username = 'Arun';

Select * from users_table where Username LIKE '%a%';

Select * from users_table where Username IN('Abi', 'Axar');

Select * from orders_table where amount between 4000 AND 40000;

-- INNER JOINS
Select * from users_table;
Select * from orders_table;

Select users.Username, orders.order_id, orders.amount
FROM users_table users
inner join orders_table orders
ON users.user_id= orders.user_id;
 
 -- order by amount asc;
Update	orders_table
set	User_id = 3
Where order_id=1;

-- left join left table users_table.

Select * from users_table;
Select * from orders_table;

select users.Username, orders.order_id, orders.amount
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id;

-- order by amount asc;

Delete from Users_table where User_id =1;


-- left join left table orders_table.



select users.Username, orders.order_id, orders.amount
FROM orders_table orders
left join users_table users
ON users.user_id= orders.user_id;



Select users.Username, orders.order_id, orders.amount
FROM users_table users
inner join orders_table orders
ON users.user_id= orders.user_id
where users.status = 'Inactive';



-- order by amount asc;
Select users.Username, orders.order_id, orders.amount
FROM users_table users
inner join orders_table orders
ON users.user_id= orders.user_id
order by orders.amount asc;



-- Count orders per user join + Group by

select users.Username, Count(orders.order_id) as total_orders
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
group by users.Username;



-- order by Count(orders.order_id) asc;

select users.Username, orders.amount
FROM users_table users
INNER JOIN orders_table orders
ON users.user_id = orders.user_id
Where orders.amount > 3000;

-- Find users with no orders
select users.Username, orders.order_id, orders.amount
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
where orders.amount is null;

-- Total amount per user 
select users.Username, SUM(orders.amount) as total_order_amount
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
GROUP BY users.Username;

-- AVG order value of the user
select users.Username, AVG(orders.amount) as Average_order_amount
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
GROUP BY users.Username;

-- Group By + Having
select users.Username, Count(orders.order_id) as total_orders
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
group by users.Username
HAVING total_orders>0
limit 4;


-- Where + Group by + Having, Active users with atleast 1 order.
Select * from users_table;
Select * from orders_table;

select users.Username, Count(orders.order_id) as total_orders
FROM users_table users
left join orders_table orders
ON users.user_id= orders.user_id
Where users.status = 'Active'
group by users.Username
HAVING total_orders>0;
	

create table users_city ( user_id INT primary key,

username VARCHAR(60), City VARCHAR(40));

SHOW tables; 

Insert INTO users_city( user_id, username, City) values
(1, 'abi', 'Cbe'),(2, 'axar', 'Chennai'), (3, 'Arun', 'salem'), (4, 'Amar', 'Yercaud'), (5, 'bini', 'Ooty'), (6, 'Cringe', 'Madurai'), (7, 'dixy', 'Ariyalur') ;

select * from users_city;

Select * from users_table;

Select * from orders_table;

select * from users_city LIMIT 2;

-- Display username with their emails, Order dates and city
Select * from users_table;
Select * from orders_table;

select * from users_city;

select users.username, users.email, orders.Order_date, uc.city
From users_table users
left Join users_city uc  
ON users.user_id = uc.user_id
left Join orders_table orders
ON users.user_id = orders.user_id;

select users.username, users.email, orders.Order_date, uc.city
From users_table users
left Join users_city uc  
ON users.user_id = uc.user_id
inner Join orders_table orders
ON users.user_id = orders.user_id;


select users.username,orders.order_id, uc.city
From users_table users
left Join orders_table orders 
ON users.user_id = orders.user_id
left Join users_city uc
ON users.user_id = uc.user_id
Where orders.order_id is null;

-- Displays users with no orders
select users.username
From users_table users
left join orders_table orders
on users.user_id = orders.user_id
where orders.order_id is null;

-- sub query to display users having orders
select username 
from users_table
where user_id in (select user_id from orders_table);

-- sub query to display users having no orders

select username 
from users_table
where user_id not in (select user_id from orders_table);

-- Alternative way to display users with no orders 
select u.username 
from users_table u
where Not exists (select 1 from orders_table o where o.user_id= u.user_id);


-- Create new table employee age data to practice sub-query.
CREATE TABLE employee_AgeData (
    emp_id INT,
    emp_name VARCHAR(50),
    age INT
);

INSERT INTO employee_Agedata VALUES
(1, 'Arun', 22),
(2, 'Bala', 25),
(3, 'Charan', 30),
(4, 'Dinesh', 28);

-- get average age of the employee

select avg(age) from employee_AgeData;

-- get employee name whose age is greater than the average
select emp_name from employee_AgeData where age >
(select avg(age) from employee_AgeData);

select min(age) from employee_AgeData;

-- Get employees whose age is less than (minimum age + 5)
select emp_name from employee_AgeData where age <
(select min(age) + 5 from employee_AgeData);

-- Get employees whose age is greater than average age but less than maximum age
select emp_name from employee_AgeData where age >
(select avg(age) from employee_AgeData) and age <(select Max(age) from employee_AgeData);












































































