CREATE DATABASE IF NOT EXISTS joins;
USE joins;

CREATE TABLE IF NOT EXISTS customer(customerid INT, cust_name CHAR(20), cust_address CHAR(20));

CREATE TABLE IF NOT EXISTS orders(customerid INT, order_id INT, order_name CHAR(20));

INSERT INTO customer VALUES(1,'abhi','india'),
(2,'ram','usa'),(3,'user 3','uk'),(4,'user 4','asia'),(5,'user 5','russia');

INSERT INTO orders VALUES(1,580,'iphone'),(2,581,'imac'),(4,582,'asus');

/* INNER JOIN : IT RETURNS THE MATCHING DATA ONLY FROM BOTH THE TABLES */ 

select * from customer;
select * from orders;

SELECT * FROM customer 
INNER JOIN orders
ON customer.customerid = orders.customerid ORDER BY customer.customerid;

/* LEFT OUTER JOIN : IT RETURN ALL THE DATA FROM TABLE 1 AND MATCHING DATA FROM TABLE 2 */

SELECT customer.cust_name,orders.order_id,orders.order_name FROM customer
LEFT OUTER JOIN orders
ON customer.customerid = orders.customerid ORDER BY customer.customerid;

/* RIGHT OUTER JOIN - RETURN ALL THE DATA FROM TABLE 2 AND MATCHING DATA FROM TABLE 1 */ 

SELECT customer.cust_name,orders.order_id,orders.order_name FROM customer
RIGHT OUTER JOIN orders
ON customer.customerid = orders.customerid ORDER BY orders.order_id;

/* FULL OUTER JOIN */ 

SELECT * FROM customer
FULL JOIN orders
ON customer.customerid = orders.customerid ORDER BY customer.customerid;

/* NATURAL JOIN -  IT REMOVES THE DUPLICATE COLUMNS */ 

/* CROSS JOIN : CARTESIAN PRODUCT OF ROWS FROM ROWSETS, IT WILL COMBINE EACH ROW FROM THE FIRST ROWSET WITH EACH ROW FROM THE SECOND ROWSET. */ 

SELECT prize,cust_name FROM customer
CROSS JOIN orders ;

INSERT INTO customer VALUES(10,'user10','india'),(11,'user11','canada');

/* EQUI JOIN : AN EQUI JOIN IS ANY JOIN OPERATION THAT USES ONLY AND ONLY THE EQUALS SIGN. */

SELECT *
FROM customer 
JOIN orders
ON customer.customerid = orders.customerid ORDER BY customer.customerid;

/* NON EQUI JOIN : <, >,BETWEEN */ 

SELECT *
FROM orders
JOIN customer
ON customer.customerid < orders.order_id;

SELECT * FROM customer;
SELECT * FROM orders;

SELECT customer.customerid, customer.cust_name, orders.order_name,orders.prize
FROM customer
LEFT JOIN orders
ON customer.customerid = orders.customerid;




































/*

create table student(name char(20),id int,subject char(10));
create table marks(id int, subject char(10), marks int);

insert into student values('manohar',1,'maths'),('manoj',2,'science'),('mathew',3,'english');
insert into marks values(1,'maths',50),(2,'science',45),(7,'english',60);

/* left join */

select student.id, marks.subject,marks.marks from student
inner join  marks
on student.id = marks.id;

/* right join */
select student.id,student.name,marks.subject,marks.marks from marks
right outer join student
on student.id = marks.id;

/* outer join */ 
select* from marks
full outer join student
on student.id = marks.id;
*/

