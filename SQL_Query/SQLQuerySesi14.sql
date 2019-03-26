--** CREATE TABLE
create Table Pegawai(
	ID_Pegawai int identity (1,1) Primary Key, 
	Nama_Pegawai varchar (100) NOT NULL, 
	Alamat_Pegawai varchar (20) NOT NULL, 
	Telp_Pegawai varchar (20) NULL,
	Email_Pegawai varchar (50) NULL, 
	Gaji_Pegawai money NOT NULL
)

Create table Penjualan (
	ID_Penjualan int identity (1,1) Primary Key, 
	ID_Pegawai int foreign key references Pegawai (ID_Pegawai),
	Nama_Barang varchar (100) NOT NULL, 
	Jenis_Barang varchar (100) NOT NULL, 
	Tgl_Penjualan smalldatetime,
	Kuantitas int
)

--**INSRT DATA
insert into Pegawai 
values ('Herlambang Rizky', 'Jakarta', NULL ,NULL, 1000000), 
('Asdi Astoba', 'Bogor', NULL ,NULL, 2000000), 
('Ben Yedder', 'Tasik', NULL ,NULL, 3000000), 
('Liliek Putra', 'Yogya', NULL ,NULL, 4000000)

select * from Pegawai

insert into Penjualan 
values (2, 'Buku Tulis AA', 'Buku Tulis', '2019-03-02', 10),
(4, 'Novel Back To The Future II', 'Novel', '2019-04-02', 20), 
(3, 'Komik Marvel : Secret War', 'Komik', '2019-05-02', 38),
(1, 'Premium Binder & Notes', 'Buku Catatan', '2019-06-02', 86)

--***LATIHAN SOAL 2
/*
1. Jika Anda pilih Windows authentication, Anda hanya bisa login ke SQL server 
dari komputer lokal. Jika ingin menggunakannya dalam jaringan, 
Anda harus mengeset jaringan Anda dalam modus domain, kemudian tiap user 
domain itu Anda beri hak akses ke SQL server // 
SQL Server Autentication : Memberikan kemampuan untuk override Domain Security policies 
ketika password expire / terlalu kompleks 
2. Karena, Hanya dengan SSMS kita dapat melakukan konfigurasi / 
management / mengatur instance secara administratif unutk Microsoft SQL Server.
Dimana di dalamnya ada komponen penting seperti, Object Explorer , 
Sql Server Instance dan etc
3.constraint : constraint merupakan rules dan restriction yang di aplikasikan 
pada kolom / table untuk mencegah data yang tidak di inginkan masuk ke dalam table
function : merupakan program yg tersimpan pada sql yang dapat di berikan parameter 
dengan nilai kembalian yang dapat di olah
*/
--***LATIHAN SOAL 1
-- soal no 1
select 
p.Nama_Pegawai,x.Nama_Barang, x.Kuantitas from Pegawai p
inner join Penjualan x 
on p.ID_Pegawai = x.ID_Pegawai
where kuantitas >= (select avg (Kuantitas) from Penjualan)


--soal no 2
select 'Ms. '+convert(varchar(100),nama_pegawai) as 'Nama Pegawai', Gaji_Pegawai as 'Gaji Pegawai' from Pegawai
where Gaji_Pegawai = (select max (Gaji_Pegawai) from Pegawai) Union
select 'Mr. '+convert(varchar(100),nama_pegawai) as 'Nama Pegawai', Gaji_Pegawai as 'Gaji Pegawai' from Pegawai
where Gaji_Pegawai = (select min (Gaji_Pegawai) from Pegawai)

--Datetime Conversion Style
select convert (varchar (11), GETDATE(), 101) -- mm/dd/yyyy
select convert (varchar (11), GETDATE(), 103) -- dd/mm/yyyy
select convert (varchar (11), GETDATE(), 105) -- dd-mm-yyyy

--get tgl penjualan
select DATEPART (dd, convert (varchar (11), (select tgl_penjualan from Penjualan where ID_Penjualan=1), 101))
--get bulan penjualan
select DATEPART (mm, convert (varchar (11), (select tgl_penjualan from Penjualan where ID_Penjualan=1), 101))

--***********
select * from Penjualan

/*tampilkan id penjualan, id pegawai, tanggal, bulan 
dimana digit akhir dari id penjualan merupakan kelipatan dari tanggal penjualan
dimana digit akhir dari id pegawai merupakan kelipatan dari bulan penjualan
*/

select 
ID_Penjualan, ID_Pegawai, DATEPART (dd, Tgl_Penjualan) as 'Tanggal Penjualan' ,  DATEPART (mm, Tgl_Penjualan) as 'Bulan Penjualan'
from Penjualan
where ID_Penjualan  = (select ID_Penjualan  from Penjualan where ID_Penjualan %2 = 0)

select convert(int,DATEPART (dd, Tgl_Penjualan)) /ID_Penjualan  from Penjualan
select ID_Penjualan, DATEPART (dd, Tgl_Penjualan) from Penjualan


