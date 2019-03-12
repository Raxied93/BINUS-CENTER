select * from Orders
--soal 1
SELECT 
upper(left(first_name, 3))
FROM Customers
--soal 2
SELECT 'Ini Order Id = '+CONVERT(VARCHAR(12), order_id)+' Dan ini Jumlahnya=' +CONVERT(VARCHAR(12), amount) from Orders;
--soal 3
SELECT FORMAT (CONVERT(date, order_date), 'dddd, MMMM, yyyy') as date from Orders
--soal no 1 fungsi matematika
select round((square (16)/3),2) as PembagianAkar
--no 1 fungsi date
SELECT format( dateadd(year, 1, DATEADD(MONTH, -1, getdate())),'dddd, MMMM, yyyy') AS DateAddColoumn;
--no 2 fungsi date
select 'Day='+DATENAME(DD,  DATEFROMPARTS(2018, 10, 31))
+' Month='+DATENAME(MM,  DATEFROMPARTS(2018, 10, 31)) +' Year='
+DATENAME(YYYY,  DATEFROMPARTS(2018, 10, 31)) AS TanggaLBerfomat

--*********************************************************************
select len (order_id) from Orders

select lower (first_name) from Customers


SELECT LEFT('Horas', 3) AS ExtractString
SELECT RIGHT('Horas', 3) AS ExtractString


SELECT FORMAT(CONVERT(date, '10-01-2018'), 'MMMM dddd yyyy');



SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date


SELECT FLOOR(25.75) AS FloorValue; --ignore decimal value 

SELECT ceiling(25.90) AS FloorValue; SELECT CEILING(-13.5) AS CeilValue;

SELECT round(25.44,1) AS FloorValue;

SELECT ROUND(235.0415, 3, 0) AS RoundValue; -- jika 5 atau di atasnya pembulatan ke atas , jika value operation 0 (default 0)
SELECT ROUND(235.0415, 3, 1) AS RoundValue; -- jika 5 atau di atasnya maka pembulatan ke bawah karena value operation nya 1
SELECT ROUND(235.415, -1) AS RoundValue;

select round (8.06225774829855,3, 0)

select CONVERT(decimal, '1234.02')
select ceiling(
sqrt (66))

select sqrt (9)
select square (32)

select (4*1.0/5)
SELECT CAST((4 * 1.0 / 5) AS DECIMAL(5,1)) as PembagianAkar


SELECT SUM(amount) AS TotalItems FROM Orders;

select sum (2+3)
--------------
SELECT CURRENT_TIMESTAMP;
SELECT GETDATE();

SELECT DATEDIFF(MM,  '2011/08/25', '2012/07/25') AS DateDiff;

SELECT format(DATEFROMPARTS(2018, 10, 31), 'dddd MMMM yyyy') AS DateFromParts;

select left (format(DATEFROMPARTS(2018, 10, 31), 'dddd MMMM yyyy'), 9) -- hari 


SELECT 'Ini Order Id = '+CONVERT(VARCHAR(12), order_id)+' Dan ini Jumlahnya=' +CONVERT(VARCHAR(12), amount) from Orders;




select DATEFROMPARTS(2018, 10, 31)

SELECT DATENAME(MM,  DATEFROMPARTS(2018, 10, 31)) AS DatePartString;

SELECT DATEPART(MONTH,DATEFROMPARTS(2018, 10, 31)) AS DatePartInt;

select 
SUBSTRING('JAN FEB MAR APR MEI JUN JUL AGU SEP OKT NOV DES', (8 * 4) - 3, 3)
SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString;

SELECT DATEFROMPARTS (1995, 02, 17)
SELECT DATEPART (MONTH, DATEFROMPARTS (1995, 02, 17))

select SUBSTRING('JAN FEB MAR APR MEI JUN JUL AGU SEP OKT NOV DES', (DATEPART (MONTH, DATEFROMPARTS (1995, 02, 17)) * 4) - 3, 3)-- BULAN

SELECT SUBSTRING(format(DATEFROMPARTS(2018, 10, 31), 'dddd MMMM yyyy'),0,3)

SELECT IF(condition, value_if_true, value_if_false)

SELECT datepart(day, DATEFROMPARTS (1995, 02, 17)) 
select format(DATEFROMPARTS(2018, 10, 31), 'dddd MMMM yyyy')

SELECT DATENAME(dw,DATEFROMPARTS (1995, 02, 17)) -- Friday// SUNDAY = 1 // SARURDAY = 7
SELECT DATEPART(dw,DATEFROMPARTS (1995, 02, 17)) -- 6

SELECT DATEPART(dw,(select order_date from Orders where order_id = 1)) 



SELECT order_date
CASE
    WHEN Quantity > 30 THEN "The quantity is greater than 30"
    WHEN Quantity = 30 THEN "The quantity is 30"
    ELSE "The quantity is under 30"
END
FROM orders;



SELECT order_id, order_date,
CASE
    WHEN  DATEPART(dw,order_id) = 04 and  DATEPART(MM,order_id) = 07 THEN 'KAMIS - AGUSTUS'
    ELSE 'bukan jumat'
END AS Hari_Indonesia
FROM Orders
where order_id = 1


SELECT format((select order_date from Orders where order_id = 1), 'dddd MMMM yyyy') AS DateFromParts;
SELECT DATEPART(MM,(select order_date from Orders where order_id = 1))
select * from Orders where order_id = 1

SELECT DATEPART(dw,DATEFROMPARTS (1995, 02, 17))


--SUBSTRING(string, start, length)
select substring ('SEN SEL RAB KAM JUM SAB MIN',(),)

select (10 * 4) - 3

select month(DATEFROMPARTS (1995, 02, 17)) as Bulan
CASE
    WHEN  Bulan = 5 THEN 'jumat'
    ELSE 'bukan jumat'
END AS Hari_Indonesia

--****************************************************************************************
SELECT DATENAME(dw,DATEFROMPARTS (1995, 02, 17)) -- Friday// SUNDAY = 1 // SARURDAY = 7
SELECT DATEPART(dw,DATEFROMPARTS (1995, 02, 17)) -- 6 // SABTU = 7 MINGGU = 1
SELECT order_date FROM Orders WHERE order_id = 1
SELECT DATEPART(MM,(SELECT order_date FROM Orders WHERE order_id = 1)) 
SELECT DATEPART(DW,(SELECT order_date FROM Orders WHERE order_id = 1)) 
SELECT DATENAME(dw,(SELECT order_date FROM Orders WHERE order_id = 1)) -- Friday// SUNDAY = 1 // SARURDAY = 7
SELECT DATEPART(dw,(SELECT order_date FROM Orders WHERE order_id = 1)) -- 6 // SABTU = 7 MINGGU = 1

SELECT order_id, order_date,
CASE
    WHEN  DATEPART(MM,order_date) = 7 AND  DATEPART(DW,order_date) = 5 THEN 'KAMIS - AGUSTUS'
    ELSE 'bukan jumat'
END AS Hari_Indonesia
FROM Orders
where order_id = 1

--*******************************1trans
DECLARE @TranName VARCHAR(20);  
declare @a int
set @a = 6
SELECT @TranName = 'MyTransaction';   
BEGIN TRANSACTION @TranName;  
	DELETE FROM orders
		WHERE order_id = @a 
	if (@a = 6)
	  commit
	else 
		rollback TRANSACTION @TranName;  
GO  


