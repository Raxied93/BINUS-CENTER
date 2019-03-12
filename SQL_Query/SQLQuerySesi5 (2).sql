--sesi 4 Join Multiple Table Data

--Review Join Table

create table Customers (
	customer_id int not null , --primary key
	first_name varchar (200) not null, 
	last_name varchar (200) not null, 
	email varchar (200) not null,
	address_cust varchar (200) not null,
	city varchar (200) not null, 
	state_cust varchar (200) not null,
	zip int not null
)

create table Orders (
	order_id int not null,
	order_date datetime not null,
	amount int not null,
	customer_id int not null --fk references CUstmers.customer_id
)

--insert data for sample
select * from Customers
insert into Customers
values (3,	'Thomas',	'Jefferson',	'tjefferson@usa.gov',	'931 Thomas Jefferson Pkwy'	,'Charlottesville'	,'VA'	,22902)
,(1,	'George',	'Washington',	'gwashington@usa.gov',	'3200 Mt Vernon Hwy','	Mount Vernon',	'VA',	22121)
,(2,	'John',	'Adams',	'jadams@usa.gov',	'1250 Hancock St'	,'Quincy'	,'MA'	,02169),
(4,	'James',	'Madison',	'jmadison@usa.gov',	'11350 Constitution Hwy'	,'Orange'	,'VA'	,22960),
(5,	'James',	'Monroe',	'jmonroe@usa.gov',	'2050 James Monroe Pkwy'	,'Charlottesville'	,'VA'	,22902)


insert into Orders 
values 
(1	,'07/04/1776',	23456	,1),
(2	,'03/14/1760',	7850	,3),
(3	,'05/23/1784',	12400	,2),
(4	,'09/03/1790',	6550	,3),
(5	,'07/21/1795',	2550	,10),
(6	,'11/27/1787',	1440	,9)


--Inner Join
select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
from customers c
inner join orders o
on c.customer_id = o.customer_id
--where c.customer_id = 3


--Left  Join
select first_name, last_name, order_date, amount
from customers c
left join orders o
on c.customer_id = o.customer_id
--Right  Join
select first_name, last_name, order_date, amount
from customers c
right join orders o
on c.customer_id = o.customer_id

select first_name, last_name, order_date, amount
from customers c
right join orders o
on c.customer_id = o.customer_id
where first_name is NULL
--Full  Join
select * from Customers
select first_name, last_name, order_date, amount
from customers c
full join orders o
on c.customer_id = o.customer_id
--cross join (cartesian product)
select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
FROM Customers c
CROSS JOIN Orders o 
WHERE C.customer_id = 1 ORDER BY C.customer_id
--full outer join
select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id=o.customer_id
ORDER BY c.customer_id;

--Query dengan hasil sama ****
select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
from customers C
join orders O
   on C.customer_id = O.customer_id
--where customers.customer_id = 3

select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
from customers c
inner join orders o
on c.customer_id = o.customer_id
--Query dengan hasil sama ****