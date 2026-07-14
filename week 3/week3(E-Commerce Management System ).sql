-- =========================================================
-- E-COMMERCE MANAGEMENT SYSTEM COMPLETE SQL PROJECT
-- =========================================================

-- =========================
-- DATABASE
-- =========================




create database ecommerce_db;

\c ecommerce_db


-- =========================
-- TABLES
-- =========================


create table customers(customer_id serial primary key , customer_name varchar(100), email varchar(100) unique, phone varchar(15),registration_date date) ;

create table addresses(address_id serial primary key, customer_id int references customers(customer_id), address_type varchar(100),  city varchar(50), state varchar(50),pincode char(6));

create table categories(category_id serial primary key, category_name varchar(100), parent_category_id int references categories(category_id) );

create table suppliers(supplier_id serial primary key , supplier_name varchar(100), email varchar(100), phone varchar(15));

create table products(product_id serial primary key , product_name varchar(100), description text,price NUMERIC(10,2), stock_quantity int, category_id int references categories(category_id), supplier_id int references suppliers(supplier_id));

create table orders(order_id serial primary key, customer_id int references customers(customer_id), order_date date, order_status varchar(50), total_amount numeric(10,2));

create table order_items (order_item_id serial primary key, order_id int references orders(order_id), product_id int references products(product_id), quantity int , unit_price numeric(10,2));

create table payments(payment_id serial primary key , order_id int references orders(order_id), payment_date date, payment_method varchar(50), payment_status varchar(50),amount numeric(10,2) );

create table shipments(shipment_id serial primary key , order_id int references orders(order_id), shipment_date date, delivery_date date, shipment_status varchar(50));

create table reviews(review_id serial primary key, customer_id int references customers(customer_id), product_id int references products(product_id), rating int , review_text text) ;

create table wishlist(wishlist_id serial primary key, customer_id int references customers(customer_id), product_id int references products(product_id));

create table cart(cart_id serial primary key , customer_id int references customers(customer_id));

create table cart_items(cart_item_id serial primary key, cart_id  int references cart(cart_id), product_id int references products(product_id), quantity int);

create table employees(employee_id serial primary key, employee_name varchar(100), manager_id int references employees(employee_id), salary numeric(10,2), designation varchar(50));

-- =========================
-- SAMPLE DATA
-- =========================


insert into  customers(customer_name,email,phone,registration_date)
values
('Eswar','eswar@gmail.com','9876543210','2026-01-10'),
('Sneha','sneha@gmail.com','9876543211','2026-02-15'),
('Arjun','arjun@gmail.com','9876543212','2026-03-12');

insert into addresses(customer_id,address_type,city,state,pincode)
values
(1,'Home','Hyderabad','Telangana','500001'),
(2,'Office','Bangalore','Karnataka','560001'),
(3,'Home','Chennai','Tamil Nadu','600001');

insert into categories(category_name,parent_category_id)
values
('Electronics',NULL),
('Mobiles',1),
('Laptops',1);

insert into suppliers(supplier_name,email,phone)
values
('ABC Suppliers','abc@gmail.com','9000000001'),
('XYZ Traders','xyz@gmail.com','9000000002');


insert into products(product_name,description,price,stock_quantity,category_id,supplier_id)
values
('iPhone 15','Apple Mobile',80000,20,2,1),
('Dell XPS','Dell Laptop',120000,10,3,2),
('Samsung S24','Samsung Mobile',70000,15,2,1);


insert into orders(customer_id,order_date,order_status,total_amount)
values
(1,'2026-06-01','Completed',80000),
(2,'2026-06-02','Pending',120000);

insert into order_items(order_id,product_id,quantity,unit_price)
values
(1,1,1,80000),
(2,2,1,120000);

insert into payments(order_id,payment_date,payment_method,payment_status,amount)
values
(1,'2026-06-01','UPI','Paid',80000),
(2,'2026-06-02','Card','Pending',120000);


insert into shipments(order_id,shipment_date,delivery_date,shipment_status)
values
(1,'2026-06-02','2026-06-05','Delivered'),
(2,'2026-06-03',NULL,'Shipped');


insert into reviews(customer_id,product_id,rating,review_text)
values
(1,1,5,'Excellent'),
(2,2,4,'Good Laptop');


insert into wishlist(customer_id,product_id)
values
(1,2),
(2,1);

insert into cart(customer_id)
values
(1),
(2);

insert into cart_items(cart_id,product_id,quantity)
values
(1,1,2),
(2,2,1);


insert into  employees(employee_name,manager_id,salary,designation)
values
('Manager',NULL,90000,'Senior Manager'),
('Employee1',1,50000,'Developer'),
('Employee2',1,45000,'Tester');

-- =========================================================
-- BASIC QUERIES
-- =========================================================


--1
select * from customers;
--2
select * from products where price > 5000;
--3
select * from products where stock_quantity < 10;
--4
select * from suppliers;
--5
select * from orders where order_status = 'Completed';
--6
select * from orders where DATE_TRUNC('month',order_date)= DATE_TRUNC('month',current_date);
--7
select * from customers where registration_date >=current_date - INTERVAL '30 days';
--8
select * from products order by price desc;
--9
select * from products order by price desc limit 10;
--10
select * from shipments where shipment_status = 'Shipped';


-- aggregate functions

--11
select count(*)  as total_customers from customers;
--12
select count(*) as total_products from products;
--13
select avg(price) as average_price from products;
--14
select max(price) as highest_price from products;
--15
select min(price) as lowest_price from products;
--16
select sum(total_amount) as total_revenue from orders;
--17
select count(*) as total_orders from orders;
--18
select sum(stock-quantity) as total_stock from products;
--19
select avg(total_amount) as avg_order_value from orders;
--20
select sum(price) from payments;

-- group by
--21
select c.category_name,count(p.product_name) from categories c join products p on c.category_id = p.category_id group by c.category_name; 
--22
select c.category_name,sum(oi.quantity * oi.unit_price) as total_price from categories c join products p on c.category_id = p.category_id  join order_items oi on oi.product_id = p.product_id group by category_name;
--23

select s.supplier_name,sum(oi.quantity* oi.unit_price) as revenue from suppliers s join products p on s.supplier_id = p.supplier_id join order_items oi on oi.product_id = p.product_id group by s.supplier_name;


--24

select city,count(customer_id) from addresses group by city;

--25
select order_status , count(order_id) from orders group by order_status;
--26

select avg(rating),product_id from reviews group by product_id;

--27
select s.supplier_name,count(product_id) from suppliers s join products p on s.supplier_id = p.supplier_id group by supplier_name;

--28
select shipment_status , count(shipment_id) from shipments group by shipment_status;
--29
select payment_method,count(payment_id) from payments group by payment_method;
--30
select date_trunc('month',order_date) as month , sum(total_amount) from orders group by month;

--havings
--31

select c.category_name,count(product_id) from categories c join products p on c.category_id=p.category_id group by category_name having count (p.product_id) > 20;
--32
select supplier_name ,count(supplier_id) from suppliers group by supplier_name having count(supplier_id)>10;
--33

select c.customer_name,count(o.order_id) from customers c join orders o on c.customer_id=o.customer_id group by c.customer_name having count(o.order_id) >4;

--34
select p.product_name,avg(r.rating) from products p join reviews r on p.product_id = r.product_id group by p.product_name  having avg(r.rating) > 4;
--35

select city ,count(customers_id) from addresses group by city having customer_id > 50;

-- inner join 
--36

select c.customer_name,o.order_id,o.total_amount from customers c join orders o on c.customer_id = o.customer_id ;

--37
select p.product_name ,o.* from products p join order_items oi on p.product_id=oi.product_id join orders o on oi.order_id = o.order_id;
--38
select p.product_name , c.category_name from products p inner join
categories c on p.product_id = c.category_id;
--39

select p.product_name , s.supplier_name from products p inner join suppliers s
on p.supplier_id = s.supplier_id; 
--40
select r.review_text , c.customer_name from reviews r inner join customers c
on c.customer_id = r.customer_id;
--41
select c.customer_name,p.* from customers c inner join orders o on o.customer_id= c.customer_id join payments p on p.order_id = o.order_id;
--42
select s.* , o.* from shipments s inner join orders o 
on o.order_id = s.order_id;
--43

select c.cart_item_id, p.product_name from cart_items c inner join products p
on c.product_id = p.product_id;
--44
select w.wishlist_id , p.product_name from wishlist w inner join products p 
on w.product_id = p.product_id;
--45

select c.customer_name, a.* from addresses a inner join customers c 
on c.customer_id = a.customer_id;

--46 left joins

select  c.customer_name from customers c left join orders o on c.customer_id = o.customer_id where o.order_id is null;
--47
select p.product_name from products p left join order_items oi on p.product_id= oi.product_id where oi.order_id is null;
--48
select p.product_name 
from products p 
left join reviews r 
on p.product_id = r.product_id
where r.review_id is null;

--49
select c.customer_name from customers c left join addresses a on c.customer_id = a.customer_id where a.address_id is null;

--50

select o.order_id from orders o left join payments p on o.order_id = p.payment_id where p.payment_id is null;
--right/full joins
--51
select p.product_name, r.review_text from products p full join reviews r on p.product_id = r.product_id ;

--52
select c.customer_name ,o.order_id from customers c full join orders o on c.customer_id = o.customer_id;
--53
select s.supplier_id ,p.product_name from suppliers s full join products p on s.supplier_id = p.supplier_id;

--54
select c.category_name ,p.product_name from categories c full join products p on c.category_id = p.category_id;
--55
select o.order_id, s.shipment_id from orders o full join shipments s on o.order_id = s.order_id;
--subqueries
--56
select product_id,sum(quantity) from order_items group by product_id order by sum(quantity) desc limit 1;

--57


select product_id,sum(quantity) from order_items group by product_id order by sum(quantity) desc offset 1  limit 1;
--58
select product_id,sum(quantity) from order_items group by product_id order by sum(quantity) desc  offset 2 limit 1;
--59
select c.customer_name, sum(o.total_amount) from customers c join orders o on c.customer_id = o.customer_id group by c.customer_name order by sum(o.total_amount) desc limit 1;
--60
select customer_id,avg(total_amount) from orders group by customer_id having sum(total_amount)> (select avg(total_amount) from orders);

--61

select * from products where price > (select avg(price) from products);

--62

select supplier_id, count(product_id) from products  group  by supplier_id order by count(product_id) desc limit 1;


SELECT supplier_name FROM suppliers WHERE supplier_id = ( SELECT supplier_id FROM products GROUP BY supplier_id ORDER BY COUNT(*) DESC LIMIT 1 );


