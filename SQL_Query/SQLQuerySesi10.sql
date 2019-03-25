--Sesi 10 Index Table
select * from Orders
truncate table Orders
create table Orders (
	order_id int not null,
	order_date datetime not null,
	amount int not null,
	customer_id int not null --fk references CUstmers.customer_id
)
drop table Orders select * from Orders
insert into Orders 
values 
(1	,('1996-09-18'),	23456	,1),
(2	,('1997-09-17'),	7850	,3),
(3	,('1998-09-16'),	12400	,2),
(4	,('1999-09-15'),	6550	,3),
(5	,('1991-09-14'),	2550	,10),
(6	,('1992-09-13'),	1440	,9),
(7	,('1993-09-12'),	1440	,4),
(8	,('1994-09-11'),	1440	,6),
(9	,('1995-09-10'),	1440	,8),
(10	,('1934-09-09'),	1440	,5),
(11	,('1956-09-08'),	1440	,7)

CREATE INDEX Test_Index ON Orders(Order_Date);

CREATE UNIQUE INDEX index_name
on Orders(Order_Id);

CREATE  INDEX test_in
on orders (order_id, order_date);

CREATE INDEX test_asc ON Orders (order_date ASC )

drop index Orders on  test_in

exec sp_helpindex [Orders]


USE Binus_CPP;  
GO  
EXEC sp_rename N'test_in', N'dsas', N'INDEX';  
GO  

EXEC sp_rename 
@objname = 'Binus_CPP."[test_in]"', 
@newname = 'test_rename', 
@objtype = 'INDEX'

exec 
sp_rename @objname = 'index_name22',
@newname = 'Index_Rename',
@objtype = 'INDEX'


drop index index_name22 on orders

select * from Orders