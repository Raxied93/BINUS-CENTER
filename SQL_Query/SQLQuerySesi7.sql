--Create View
create VIEW TestView AS
  SELECT o.Order_id, c.Customer_id, c.First_name
  FROM Customers c
  INNER JOIN Orders o
  ON c.customer_id = o.customer_id
  WHERE o.amount >= 1000;

  select * from TestView

--Latihan 1
create view TestView as
select Order_id, order_date from Orders

--drop view TestView
--
CREATE VIEW TestViewLatihan1 AS
  SELECT o.Order_id, c.Customer_id, c.First_name, o.amount
  FROM Customers c
  INNER JOIN Orders o
  ON c.customer_id = o.customer_id
  WHERE o.amount >= (select avg(o.amount) from Orders o)


--Latihan 2 - alter view (Manage view)

 ALTER VIEW TestView AS
  SELECT o.Order_id, c.Customer_id, c.First_name, o.amount
  FROM Customers c
  INNER JOIN Orders o
  ON c.customer_id = o.customer_id
  WHERE o.amount >= 1000;

--latihan 3 menggunakan between tgl
select * from Orders
where order_date between '1760-03-14 00:00:00.000' and '1784-05-23 00:00:00.000'

  
create view test_replace as 
select order_id, order_date from orders

select * from orders

  select * from Customers

  select * from TestView 

--END OF VIEW 

--START OF STORE PROCEDURE

--**membuat SP Simple
CREATE PROCEDURE USP_Customers
AS
SELECT * FROM Customers
GO
--**eksekusi SP
exec USP_Customers

--**SP dengan 1 Param
CREATE PROCEDURE USP_Customers @Cust_Id nvarchar(30) --/CREATE PROCEDURE USP_Customers @Cust_Id int 
AS
SELECT * FROM Customers
WHERE customer_id = @Cust_Id
GO

exec USP_Customers @Cust_id = 3 -- exec USP_Customers @Cust_id = '3'
--**end of sp dengan 1 param

--**sp dengan Null Value
CREATE PROCEDURE USP_Customers @Cust_Id int = NULL
AS
SELECT *
FROM Customers
WHERE customer_id = @Cust_Id
GO

exec USP_Customers 
--**end sp dengan Null Value

--**SP dengan Multiple Param
/*Example of Bloc COmment
You can add any sentences in this block to help people to understand
your block of SQLQUery STatement
*/
CREATE PROCEDURE USP_Customers @Cust_id int, @FirstName nvarchar(60)
AS
/* 
-this procedure gets a list of addresses based 
 on the city value that is passed
-this procedure is used by the HR system      
*/
SELECT *
FROM Customers
WHERE customer_id = @Cust_id or first_name = @FirstName
GO

exec USP_Customers @cust_id = 3 , @FirstName = 'George'
--**end of SP dengan Multiple Param

--** manage alter sp
ALTER PROCEDURE USP_Customers @zip varchar(10)
AS
SELECT * 
FROM Customers
WHERE first_name LIKE @zip + '%'
GO

select * from Customers
exec USP_Customers @zip = 'Ali'
--**manage alter sp

--**drop sp
drop proc USP_Customers
drop procedure USP_Customers

--** contoh sp insert 
CREATE PROCEDURE USP_InsertCustomers @Cust_Id int , @fn varchar (10), @ln varchar (10), @email varchar (10), @addr varchar (10), 
@city varchar (10), @state varchar (10), @zip int
AS
insert into Customers (customer_id, first_name, last_name, email, address_cust, city, state_cust, zip)
values (@Cust_Id, @fn, @ln, @email, @addr, @city, @state, @zip)
GO

select* from Customers

exec USP_InsertCustomers @Cust_id = 8, @fn ='Aliando' , @ln = 'Syaraf', @email = 'ALiandodong@gmail.com', @addr = 'Cilodong',
@city ='Jonggol', @state='BK', @zip = 15223

--** contoh sp update 
CREATE PROCEDURE USP_UpdateCustomers @Cust_Id int, @FM varchar(10)
AS
Update Customers
Set first_name = @FM
WHERE customer_id = @Cust_Id
GO

select* from Customers

exec USP_UpdateCustomers @cust_id=5, @fm='Herlambang'

drop proc USP_UpdateCustomers
--END OF STORE PROCEDURE 



