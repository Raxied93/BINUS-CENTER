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
