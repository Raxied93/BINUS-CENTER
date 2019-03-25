select * from Orders
select * from Customers
--Tugas DML Trigger 
--Nomor 1
create trigger Tugas1 on Orders 
FOR INSERT, UPDATE 
AS
  BEGIN
  declare @amountmin int
  declare @amountuser int
  set @amountmin = (select max (amount) from Orders)
  set @amountuser = (select amount from inserted)
      If @amountuser < @amountmin
      Begin
	  print 'Amount minimal 500'
	  rollback transaction
          Return
      End
END

update orders
set amount = 1
where order_id = 6
select * from orders
drop trigger Tugas1
--Nomor 2 
alter TRIGGER Tugas2 on Customers
 FOR DELETE AS
BEGIN
--declare @id1 int
declare @id2 int
declare @err varchar (10)
--set @id1 = ( SELECT max (customer_id) FROM Customers  )
set @id2 = (select customer_id from deleted)
    IF EXISTS ( SELECT 1 FROM deleted WHERE customer_id <= (convert(int, (select max (customer_id) FROM Customers )))-1)
	--PRINT 'anda tidak di izinkan menghapus data ini	
		ROLLBACK TRANSACTION
		RETURN

    END

delete from customers where customer_id=5
drop trigger Tugas2 --tugas2    select min (customer_id) from Customers
select * from Customers
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
insert into Customers
values (3,	'Thomas',	'Jefferson',	'tjefferson@usa.gov',	'931 Thomas Jefferson Pkwy'	,'Charlottesville'	,'VA'	,22902)
,(1,	'George',	'Washington',	'gwashington@usa.gov',	'3200 Mt Vernon Hwy','	Mount Vernon',	'VA',	22121)
,(2,	'John',	'Adams',	'jadams@usa.gov',	'1250 Hancock St'	,'Quincy'	,'MA'	,02169),
(4,	'James',	'Madison',	'jmadison@usa.gov',	'11350 Constitution Hwy'	,'Orange'	,'VA'	,22960),
(5,	'James',	'Monroe',	'jmonroe@usa.gov',	'2050 James Monroe Pkwy'	,'Charlottesville'	,'VA'	,22902)

truncate table Orders
insert into Orders 
values 
(1	,'07/04/1776',	23456	,1),
(2	,'03/14/1760',	7850	,3),
(3	,'05/23/1784',	12400	,2),
(4	,'09/03/1790',	6550	,3),
(5	,'07/21/1795',	2550	,10),
(6	,'11/27/1787', 1440	,9)
--Trigger // Sesi 9********************************************************
-- ***DML TRIGGER // simple example
--test trigger delete  select * from Orders  update Orders set amount = 0 where order_id = 1
drop trigger testdel
create trigger testdel on orders 
instead of delete
as 
	declare @amount int 
	declare @ord_id int
	set @amount = (select amount from deleted)
	set @ord_id = (select order_id from deleted)
	if @amount = 0 
		begin 
		delete from Orders where order_id = @ord_id
		print'Sukses delete record dengan id : '+cast (@ord_id as nvarchar(10))
		end
	else
		print 'Tidak bisa menghapus, karena amount lebih dari 0'

delete from Orders where order_id = 1

--*************
create trigger TG_Update on Orders
for UPDATE 
as print 'Hello, Ini trigger Update '

--** ROLLBACK TRIGGER DELETE
create trigger TG_RollDel on Orders
for DELETE 
as 
Print 'Anda di Larang Menjalankan Aksi Delete pada Table Ini'
ROLLBACK TRANSACTION 
RETURN

drop trigger TG_Update

--***DML Trigger Rollback with param
SELECT * FROM Orders SELECT MIN (AMOUNT) FROM Orders

--==test by her
CREATE TRIGGER 
    TG_Roll
ON 
   Orders
FOR INSERT, UPDATE 
AS
  BEGIN
      If (SELECT amount FROM INSERTED) < 500
      Begin
	  print 'Amount minimal 50'
	  rollback transaction
          Return
      End
END

drop trigger TG_roll
select * from orders

update orders 
set amount =599
where order_id = 6

insert into orders
values (9, '1776-07-04 00:00:00.000', 400, 9)
--==test by her

delete from Orders where order_id=5 ;
rollback;

select * from Orders
