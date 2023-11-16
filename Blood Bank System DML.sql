

---------------------------------******DML******------------------------
go
insert into District values ('Dhaka'),('Rajshahi'),('Khulna'),('Bogra'),('Sirajganj'),('Pabna')
select * from District
go
go
insert into Donor values('Shahin','Male',26,'Mirpur, Dhaka','01721355478','7/28/2019',1,2),
						('Dipu','Male',25,'Rajshahi Sadar, Rajshahi','01721355478','7/28/2019',1,2),
						('Shimu','Female',23,'Khulna sadar, Khulna','01754355678','7/26/2019',1,3),
						('Sohag','Male',25,'Azimpur, Dhaka','01784655478','7/25/2019',1,1),
						('Hasan','Male',27,'Gazipur, Dhaka','01725664178','7/26/2019',1,6)
select * from Donor
insert into Blood_Recipient values('Male',30,'Rahul','0178954621',1),
									('Male',30,'Ratul','0177488621',2),
									('Male',30,'Ruhull','0178954878',3),	
									('Female',28,'Samanta','019098711',4),
									('Female',28,'Samanta','01925098711',5)
select * from Blood_Recipient
go
insert into Blood_Sample values('A+',1,1,1),('B-',4,1,2),('O+',7,1,3),('AB-',6,1,3),('O-',8,1,3)
go
select * from Blood_Sample
go
insert into Blood_Inventory_Manager values('Rakib','Mirpur, Dhaka','01711724584','RBbank@gmail.com',1),
											('Rakib','Mirpur, Dhaka','0178954878','RBbank@gmail.com',2),
											('Shipon','Mirpur, Dhaka','019098711','FBbank@gmail.com',3)
go
select * from Blood_Inventory_Manager
go
Exec Sp_BBSystem 'Sandhani',1,1,1,1,1
Exec Sp_BBSystem 'Sandhani',2,2,2,2,2	
Exec Sp_BBSystem 'Sandhani',3,3,3,3,3	
Exec Sp_BBSystem 'Sandhani',4,4,4,4,1	
Exec Sp_BBSystem 'Sandhani',5,5,5,5,2
Exec Sp_BBSystem 'Sandhani',6,1,1,1,3
Exec Sp_BBSystem 'Sandhani',1,2,2,2,1
go

select * from Blood_Bank_System

go


select * from District
select * from Donor
select * from Blood_Recipient
select * from Blood_Sample
select * from Blood_Inventory_Manager
select * from Blood_Bank_System
---Function-----
select  dbo.Fn_Donor() as TotalDonor
go
-----Donor view-----
select * from VW_donar
