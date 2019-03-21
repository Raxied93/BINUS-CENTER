select * from Orders
select * from Customers
--*********SOAL VIEW************************
create view soal_1 as 
select order_id , order_date from Orders

select * from  soal_1
--
create view soal_2 
as
SELECT c.first_name, c.last_name,c.customer_id, o.amount
FROM Orders o
INNER JOIN Customers c 
ON c.customer_id = o.customer_id
where amount >= (select avg(amount) from Orders)

select * from soal_2
--
select * from Orders
create view soal_3 
as 
select * from Orders
where order_date between '1790-09-03 00:00:00.000' and '1990-02-12 00:00:00.000'
--*********SOAL STORE PROC******************
-- soal no 2 

select max (customer_id) from Customers

CREATE PROCEDURE USP_Soal2
@order_id int ,
@order_date date, 
@cust_id int 
--@amount int 
AS
BEGIN
   DECLARE @amount int

   SELECT @amount = max(customer_id) FROM Customers 

insert into Orders ( order_id,order_date, amount, customer_id)
values (
@order_id,
@order_date,
@amount ,
@cust_id 
)
END

--drop proc USP_Soal2
exec USP_Soal2 
@order_id = 10, @order_date = '1990-02-12',  @cust_id = 10

select * from Orders
select customer_id FROM Customers WHERE customer_id = 1
-----------------------------------------------------------

--Soal No 3
select * from Customers
create procedure USP_Soal3
 @fn nvarchar (10)
 as 
 begin 
 
 declare  @customer_id int 
 SELECT @customer_id = min(customer_id) FROM Customers 
 update Customers 
 set first_name = @fn
 where customer_id = @customer_id

 end

 drop proc USP_Soal3
 select * from Customers
 select min (customer_id) from Customers
 exec USP_Soal3 @fn='jomblo2' 
