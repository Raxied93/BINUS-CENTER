
select * from Customers  ORDER BY customer_id ASC
select * from Orders 

SELECT DISTINCT (customer_id) FROM Orders

--cross join
select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
FROM Customers c
CROSS JOIN Orders o 
WHERE C.customer_id = 1 ORDER BY C.customer_id


select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C FROM CUSTOMERS C 
INNER JOIN ORDERS O 
on c.customer_id = o.customer_id


select * from orders
select * from Customers

--quiz
select Customer_id, amount from Orders where amount > ( select avg (amount) from orders ) --1
select Customer_id, amount, amount * order_id as total from Orders --2
SELECT * FROM Customers
--WHERE first_name not LIKE '[tg]%';
where first_name like '__o%' and first_name like '___m%' -- menampilkan karakter ke 3 dengan nilai o ***3
--quiz

--select * from orders 
--where amount like '%6'

--SELECT (last_name + ' '+ First_Name) AS Name  
--FROM Customers 

select order_id, order_date,(CONVERT(varchar(10), amount) + ' buah')as amount from orders 
where amount = (select max (amount) from orders)--4




alter table orders
alter column amount int


select c.customer_id, first_name as First_name_P, last_name as Last_Name_P, order_date as Order_Date_C, amount as Amount_C
from customers c
inner join orders o
on c.customer_id = o.customer_id
