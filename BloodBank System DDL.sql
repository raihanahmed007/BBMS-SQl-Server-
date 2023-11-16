--------------------------*****DDL Statement*****---------------------------
create database Blood_Bank_System
go
--use Blood_Bank_System
go
Create table District
(
	Dis_ID			int identity primary key,
	Dis_Name		varchar(20)
)

go
create table Donor
(
	Donor_ID		int identity primary key,
	Donor_Name		varchar(20),
	Gender			varchar(10),
	Age				int,
	D_Address		varchar(50),
	Contact_No		varchar(15),
	Donate_Date		date,
	Quentity		int,
	D_Dis_ID		int references District(Dis_ID)
)

go
create table Blood_Recipient
(
	R_ID		int identity primary key,
	Gender		varchar(10),
	Age			int,
	R_Name		varchar(20),
	Contact_No	varchar(15),
	BR_Donor_ID	int references Donor(Donor_ID)
)
go
create table Blood_Sample
(
	BS_ID		int identity primary key,
	B_Group		varchar(5),
	Sample_No	int,
	Quent_of_Blood int,
	BR_Donor_ID int references Donor(Donor_ID)
)
go
create table Blood_Inventory_Manager
(
	BIM_ID		int identity primary key,
	M_Name		varchar(20),
	M_Address	varchar(50),
	Contact_NO	varchar(20),
	Email		varchar(20),
	BIM_BS_ID	int references Blood_Sample(BS_ID)
)

go
create table Blood_Bank_System
(
	BBS_ID		int identity primary key,
	BBS_Name	varchar(50),
	BBS_Dis_ID	int references District(Dis_ID),
	BBS_Donor_ID int references Donor(Donor_ID),
	BBS_R_ID	int references Blood_Recipient(R_ID),
	BBS_BS_ID	int references Blood_Sample(BS_ID),
	BBS_BIM_ID	int references Blood_Inventory_Manager(BIM_ID)
)
--Stored Procedure 
go
Create Proc Sp_BBSystem	
@BBS_Na varchar(50),@BBS_i_ID 	int,@BBS_Do_ID int,@BBS_R_ID	int,@BBS_Bs_ID	int,@BBS_Bi_ID	int 
AS
Begin
	
	Begin try
		
	Insert into Blood_Bank_System values (@BBS_Na,@BBS_i_ID,@BBS_Do_ID,@BBS_R_ID,@BBS_Bs_ID,@BBS_Bi_ID)
			
			
		End try
		Begin catch
		print 'Error occured for ' + Error_Message()
		
		End catch
End
-- Trigger
go
Create trigger Tr_Donor
On Donor
Instead of Insert
As
Begin
	declare	@Donate_Date date,@dis int
	select @dis=DATEDIFF(month,[Donate_Date],getdate()) from inserted
	select @Donate_Date from inserted
	if (@DIS>3)
		Begin
		Begin tran
			Begin try
				
					insert into Donor	
					select 	Donor_Name,Gender,Age,D_Address,Contact_No,Donate_Date,Quentity,D_Dis_ID from inserted
				Commit tran
			end try
			begin catch
				print 'Error occured for ' + Error_Message()
				rollback tran
			end catch
		End
		else	
			print 'Donor can not donet within 3 months after blood donet'

End
--Function
go
Create Function Fn_Donor()
returns int
As
Begin
	declare @total int
	select @total = count(Donor.Donor_ID) from Donor
	return @total;
End
-- View
go
create view VW_donar
As
	Select  e.Donor_Name,e.Contact_No,B_Group,e.Gender,e.Age,Donate_Date,D_Address
	from [dbo].[Blood_Inventory_Manager] a join [dbo].[Blood_Sample] c
	on a.BIM_BS_ID=c.BS_ID
	join [dbo].[Blood_Recipient] b
	on a.BIM_BS_ID=c.BS_ID
	join [dbo].[Donor] e
	on c.BR_Donor_ID=e.Donor_ID
	join [dbo].[District] d 
	on d.Dis_ID=e.D_Dis_ID
	





