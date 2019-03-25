use master
go
drop database Binus_CPP
go

insert into Orders
values (
	10, '2000-07-04 00:00:00.000',
	7000, 14
)



select * from Orders

--Backup with FULL

--Backup Diff
BACKUP DATABASE Binus_CPP
   To DISK='E:\BinusCenter\SQL Server\BAK\TestDiff.dif'
   WITH DIFFERENTIAL,
    MEDIANAME = 'Native_SQLServerDiffBackup',
    NAME = 'Diff-SQLShackDemoATC backup';

--Backup Log
BACKUP LOG Binus_CPP
   To 
   DISK='E:\BinusCenter\SQL Server\BAK\TestLog1.trn'
   WITH
   MEDIANAME = 'Native_SQLServerLogBackup',
    NAME = 'Log-SQLShackDemoATC backup';
GO

BACKUP LOG Binus_CPP
   To 
   DISK='E:\BinusCenter\SQL Server\BAK\TestLog2.trn'
   WITH
   MEDIANAME = 'Native_SQLServerLogBackup',
    NAME = 'Log-SQLShackDemoATC backup';
GO

--restore only FULL Backup with no following action 
RESTORE DATABASE Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestFull.BAK' WITH RECOVERY  -- tanpa diff dan log(tanpa order_id = 9)

--restore Full Backup and Diff

RESTORE DATABASE Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestFull.BAK' WITH NORECOVERY

RESTORE DATABASE Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestDiff.dif' WITH RECOVERY

--restore with Translog

RESTORE DATABASE Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestFull.BAK' WITH NORECOVERY

RESTORE DATABASE Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestDiff.dif' WITH NORECOVERY

RESTORE LOG Binus_CPP FROM DISK = 'E:\BinusCenter\SQL Server\BAK\TestLog2.trn' WITH RECOVERY

select Customer_id,(select  max (amount) from Orders) from orders

select customer_id, amount from orders

select Customer_id, 
convert(varchar(20),(Datename (dw, Order_Date)))+ --untuk tanggal
'/'+convert(varchar(10), datepart(m, order_date))+ -- untuk bulan
'/'+convert(varchar(10), datepart (yy, order_date)) -- untuk tahun
 as Tanggal_Order, 
convert(varchar (100), amount)+' Buah' as MaxJual from Orders 

where amount = (select max(amount) from Orders)

