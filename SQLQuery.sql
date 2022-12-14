create database Flower_shop;
use Flower_shop;
drop database Flower_shop;
--����������� ������ ���� ������ - ��������� �������
--drop table clients 
--������� �������
create table Clients (
	ID_client int identity(1, 1) not null constraint PC_Clients primary key,
	Surname nvarchar(15) not null,
	Name nvarchar(15) not null,
	Phone_number nvarchar(11) not null,
	Bonus int 
)
insert Clients(Surname, Name, Phone_number, Bonus) values
('Ezhova', 'Svetlana', '89603452264', 25),
('Pavlovskaya', 'Olga', '89603508191', 30),
('Ezhov', 'Dmitriy', '89063102010', NULL),
('Shepovalova', 'Kate', '89075678585',15),
('Klimko', 'Maks', '89405678906', NULL),
('Shilina', 'Natalia', '89001232012', 25),
('Vanin', 'Boris', '89001567890', NULL)

select * from Clients
--drop table orders 
--������� ������
create table Orders (
	ID_order int identity(1, 1) not null constraint PC_Orders primary key,
	ClientID int foreign key references Clients(ID_client) not null,
	Date_order date not null,
	Cost int not null, 
	Status_of_order nvarchar(15) not null
)
insert Orders(ClientID, Date_order, Cost, Status_of_order) values
(1, '25.02.2022', 2500, 'In progress'),
(2, '02.03.2023', 1200, 'In progress'),
(3, '26.04.2023', 10000, 'In progress'),
(4, '10.10.2010', 1390, 'In progress'),
(5, '11.07.2022', 850, 'Completed'),
(6, '29.09.2022', 5000, 'Completed'),
(7, '28.05.2022', 2000, 'Completed'),
(7, '29.11.2022', 2000, 'In progress')
--SELECT * FROM Orders
create table Type_of_goods (
	ID_type int identity(1, 1) not null constraint PC_type primary key,
	Type_of nvarchar(30) not null, 
)
insert Type_of_goods(Type_of) values
('Flowers'), 
('Bouquets'),
('Accessories'),
('Composition of accessories'), 
('Composition of bouquet')
--drop table Goods
--������� ������ 
--select * from Type_of_goods
--drop table goods
create table Goods (
	ID_good int identity(1, 1) not null,
	Name_good nvarchar(30) not null, 
	Type_good int not null
)
alter table Goods add constraint FK_typpp foreign key(Type_good) references Type_of_goods(ID_type)

alter table Goods add constraint PK_Goods primary key(ID_good)
insert Goods(Name_good, Type_good) values
('Camomile white', 1), 
('Camomile yellow', 1),
('Roses red', 1),
('Roses white', 1), 
('Chrysanthemums white', 1),
('Chrysanthemums yellow', 1), 
('Tulips red', 1),
('Tulips pink', 1), 
('Tulips white', 1), 
('Peonies pink', 1),
('Marmaris', 2),
('Cindy', 2),
('Candy', 2),
('101 roses', 2),
('Coro', 2),
('Cellophane', 3),
('Tape white', 3),
('Tape pink', 3),
('Tape red', 3),
('Twig green', 3)

--������� ����� ��������  ����
create table Flowers (
	FlowerID int not null constraint PC_Flowers primary key,
	Name_flower nvarchar(15) not null,
	Color nvarchar(15) not null,
	Actual_availability int not null,
	Price int not null
)
alter table Flowers add constraint FK_Flowers foreign key(FlowerID) references Goods(ID_good)
insert Flowers(FlowerID, Name_flower, Color, Actual_availability, Price) values
(1, 'Camomile', 'white', 100, 50), --����� �������
(2, 'Camomile', 'yellow', 100, 50), --������ �������
(3, 'Roses', 'red', 100, 100), --����� ����
(4, 'Roses', 'white', 50, 110), --������� ����
(5, 'Chrysanthemums', 'white', 40, 70), --����� ����������
(6, 'Chrysanthemums', 'yellow', 30, 70), --������ ����������
(7, 'Tulips', 'red', 30, 90), --������� ��������
(8, 'Tulips', 'pink', 80, 80), --������� ��������
(9, 'Tulips', 'white', 100, 80), --����� ��������
(10, 'Peonies', 'pink', 30, 160) --������� �����


--������� ������
create table Bouquets (
	BouquetID int not null constraint PC_Bouquets primary key,
	Name_bouquet nvarchar(15) not null,
	Actual_availability int not null,
	Price int not null
)
alter table Bouquets add constraint FK_Bouquets foreign key(BouquetID) references Goods(ID_good)
insert Bouquets(BouquetID, Name_bouquet, Actual_availability, Price) values
(11, 'Marmaris', 1, 2500), 
(12, 'Cindy', 2, 3050), 
(13, 'Candy', 1, 800), 
(14, '101_roses', 50, 7000), 
(15, 'Coro', 10, 2150)

--drop table Accessories 
--������� ����������
create table Accessories (
	AccessoryID int not null constraint PC_Accessories primary key,
	Name_accessory nvarchar(15) not null,
	Color_accessory nvarchar(15),
	Actual_availability int not null,
	Price int not null
)
alter table Accessories add constraint FK_Accessories foreign key(AccessoryID) references Goods(ID_good)
insert Accessories(AccessoryID, Name_accessory, Color_accessory, Actual_availability, Price) values
(16, 'Cellophane', NULL, 100, 10), 
(17, 'Tape', 'White', 100, 20), 
(18, 'Tape', 'Pink', 100, 20), 
(19, 'Tape', 'Red', 100, 20), 
(20, 'Twig', 'Green', 100, 5)

drop table Composition_of_accessories
--������� ������ ���.������
create table Composition_of_accessories (
	ID_comp_acces int identity(1, 1) not null constraint PC_comp_acces primary key,
	ID_bouquet int not null,
	ID_accessory int not null
)
alter table Composition_of_accessories add constraint FK_bouquet_for_acces foreign key(ID_bouquet) references Bouquets(BouquetID)
alter table Composition_of_accessories add constraint FK_accessory_for_acces foreign key(ID_accessory) references Accessories(AccessoryID)
insert Composition_of_accessories(ID_bouquet, ID_accessory) values
(11, 16),
(11, 17),
(12, 19),
(12, 16),
(13, 20)

--drop table Composition_of_bouquet
--������� ������ ������
create table Composition_of_bouquet (
	ID_comp_bouquet int identity(1, 1) not null constraint PC_comp_bk primary key,
	ID_bouquet int  not null,
	ID_flower int not null,
	Number_of_flowers int not null
)
alter table Composition_of_bouquet add constraint FK_bouquet_for_bouquet foreign key(ID_bouquet) references Bouquets(BouquetID)
alter table Composition_of_bouquet add constraint FK_flower_for_bouquet foreign key(ID_flower) references Flowers(FlowerID)
insert Composition_of_bouquet( ID_bouquet, ID_flower, Number_of_flowers) values
(11, 1, 7),
(11, 2, 1),
(12, 10, 11),
(14, 3, 101),
(13, 8, 51)

drop table Goods_int_the_order
--������ � ������  ����
create table Goods_int_the_order (
	ID_good int not null,
	Type_good int not null,
	ID_order int not null ,
	Number_of_goods int not null
)
alter table Goods_int_the_order add constraint FK_typ11 foreign key(Type_good) references Type_of_goods(ID_type)
alter table Goods_int_the_order add constraint FK_order_in_order foreign key(ID_order) references Orders(ID_order)
alter table Goods_int_the_order add constraint FK_good_in_order foreign key(ID_good) references Goods(ID_good)
insert Goods_int_the_order(ID_good, Type_good, ID_order, Number_of_goods) values
(11, 2, 1, 1),
(6, 1, 2, 101),
(9, 1, 3, 101),
(13, 2, 4, 11),
(2, 1, 5, 25),
(4, 1, 6, 21),
(5, 1, 7, 17)
--select * from Goods_int_the_order
--drop table Goods_on_sale
--������� ������ � �������
create table Goods_on_sale (
	ID_good int not null constraint PC_goods_in_sale primary key,
	Type_good int not null,
	Number_of_goods int not null,
	Price int not null
)
alter table Goods_on_sale add constraint FK_typ101 foreign key(Type_good) references Type_of_goods(ID_type)

alter table Goods_on_sale add constraint FK_good_on_sale foreign key(ID_good) references Goods(ID_good)
insert Goods_on_sale(ID_good, Type_good, Number_of_goods, Price) values
(1, 1, 100, 140),
(2, 1, 100, 120),
(3, 1, 100, 130),
(4, 1, 100, 150),
(5, 1, 25, 160)

--drop table Suppliers 
--������� ���������� 
create table Suppliers (
	ID_supplier int identity(1, 1) not null constraint PC_Suppliers primary key,
	Surname nvarchar(15) not null,
	Name_of_supplier nvarchar(15) not null,
	Phone_number nvarchar(11) not null
)
insert Suppliers(Surname, Name_of_supplier, Phone_number) values
('Ivanov', 'Aleks', '89063102011'),
('Aliev', 'Victor', '89089102011'),
('Antropova', 'Olga', '89063102781'),
('Vernik', 'Anna', '89063102771'),
('Umnov', 'Yryi', '8990902011'),
('Avdeev', 'Roman', '8956102011'),
('Snegin', 'Ganiil', '8990317811'),
('Semenov', 'Oleg', '89900000011')

--drop table SuppliersAndPriceDays
--������� ���������� � �� �����
create table SuppliersAndPriceDays (
	ID_supplier int not null,
	GoodID int not null,
	Type_good int not null,
	Price_from_supplier int not null,
	DaysS int not null
)
alter table SuppliersAndPriceDays add constraint FK_typ201 foreign key(Type_good) references Type_of_goods(ID_type)
alter table SuppliersAndPriceDays add constraint FK_supplier_in_SuppliersAndPrice foreign key(ID_supplier) references Suppliers(ID_supplier)
alter table SuppliersAndPriceDays add constraint FK_good_in_SuppliersAndPrice foreign key(GoodID) references Goods(ID_good)
insert SuppliersAndPriceDays(ID_supplier, GoodID, Type_good, Price_from_supplier, DaysS) values
(1, 1,1, 56, 3), 
(1, 2, 1, 56, 3), 
(1, 3, 1, 80, 3), 
(1, 4, 1, 75, 3), 
(1, 5, 1, 65, 3), 
(1, 6, 1, 65, 3), 
(1, 7, 1, 80, 3), 
(1, 8, 1, 80, 3), 
(1, 9, 1, 80, 3), 
(1, 10, 1, 95, 3), 
(1, 16, 3, 1, 3), 
(1, 17, 3, 1, 3), 
(1, 18, 3, 1, 3), 
(1, 19, 3, 1, 3), 
(1, 20, 3, 1, 3), 
(2, 1, 1, 55, 3), 
(2, 2, 1, 55, 3), 
(2, 3, 1, 79, 3), 
(2, 4,1,  74, 3), 
(2, 5, 1, 64, 3), 
(2, 6, 1, 64, 3), 
(2, 7, 1, 79, 3), 
(2, 8, 1, 79, 3), 
(2, 9, 1, 79, 3), 
(2, 10, 1, 94, 3), 
(2, 16, 3, 2, 3), 
(2, 17, 3, 2, 3), 
(2, 18, 3, 2, 3), 
(2, 19, 3, 2, 3), 
(2, 20, 3, 2, 3), 
(3, 1, 1, 57, 3), 
(3, 2, 1, 57, 3), 
(3, 3,1, 81, 3), 
(3, 4, 1, 76, 3), 
(3, 5, 1, 66, 3), 
(3, 6, 1, 66, 3), 
(3, 7, 1, 81, 3), 
(3, 8, 1, 81, 3), 
(3, 9, 1, 81, 3), 
(3, 10, 1, 96, 3), 
(3, 16, 3,3, 3), 
(3, 17, 3, 3, 3), 
(3, 18, 3, 3, 3), 
(3, 19, 3, 3, 3), 
(3, 20, 3, 3, 3),
(4, 9,  3, 70, 2),
(5, 7, 1, 60, 2),
(6, 1, 1, 70, 2), 
(7, 1, 1, 100, 2),
(8, 1, 1, 65, 2)


--drop table Supply
--������� �������� ����
create table Supply (
	SupplyID int identity(1, 1) not null constraint PC_supply primary key,
	SupplierID int not null,
	GoodIDSup int not null,
	Type_good int not null,
	Numbers int not null,
	Date_of_supply date not null,
	Price_from_supplier int not null,
	OrderFor int 
)
alter table Supply add constraint FK_typ301 foreign key(Type_good) references Type_of_goods(ID_type)
alter table Supply add constraint FK_supplier_in_supply foreign key(SupplierID) references Suppliers(ID_supplier)
alter table Supply add constraint FK_good_in_supply foreign key(GoodIDSup) references Goods(ID_good)
alter table Supply add constraint FK_order_for_supply foreign key(OrderFor) references Orders(ID_order)

insert Supply(SupplierID, GoodIDSup, Type_good, Numbers, Date_of_supply, Price_from_supplier, OrderFor) values
(1, 1,1,  10, '12.02.2022', 90, NULL),
(2, 9, 1, 20, '12.03.2022', 80, 2),
(2, 3, 1, 10, '14.05.2022', 95, 3),
(4, 9, 1, 5,  '16.12.2022', 70, 4),
(5, 7, 1, 7, '28.09.2022', 60, 5),
(6, 1, 1, 6, '12.02.2022', 70, NULL), 
(7, 1, 1, 10, '12.02.2022', 100, NULL),
(8, 1, 1, 12, '12.02.2022', 65, NULL)

--drop table positions 
--������� ���������
create table Positions (
	ID_position int identity(1, 1) not null constraint PC_Pos primary key,
	Name_of_position nvarchar(15) not null,
)
insert Positions(Name_of_position) values
('director'),
('florist'),
('administrator')

--drop table Employees
--������� ����������
create table Employees (
	ID_employee int identity(1, 1) not null constraint PC_Employees primary key,
	Surname_of_empl nvarchar(15) not null,
	Name_of_empl nvarchar(15) not null,
	Date_of_birth date not null,
	Phone_number nvarchar(11) not null,
	Post int not null,
	Work_experience int not null
)
alter table Employees add constraint FK_post_of_supplier foreign key(Post) references Positions(ID_position) on delete cascade
insert Employees(Surname_of_empl, Name_of_empl, Date_of_birth, Phone_number, Post, Work_experience) values
('Uvarov', 'Igor', '12.02.2002', '8906315671', 1, 2),
('Antipin', 'Alex', '14.05.2002', '89089890011', 2, 1),
('Antonova', 'Polina', '18.06.2002', '89063345781',2, 1),
('Egorova', 'Anna', '29.01.2002', '89012302771', 3, 2),
('Romanova', 'Victoria', '13.12.2002', '8991232011', 3, 2)

--drop table Executer_of_the_order
--������� ����������� ������
create table Executer_of_the_order (
	OrderID int not null constraint PC_ex_of_order primary key,
	EmployeeID int not null
)
alter table Executer_of_the_order add constraint FK_1 foreign key(OrderID) references Orders(ID_order)
alter table Executer_of_the_order add constraint FK_2 foreign key(EmployeeID) references Employees(ID_employee) on delete cascade
insert Executer_of_the_order(OrderID, EmployeeID) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 5),
(7, 4)

--drop table Salary
--������� ��������
create table Salary (
	EmployeeID int not null constraint PC_salary primary key,
	PositionID int not null,
	Salary_amount int not null
)
alter table Salary add constraint FK_employee_in_salary foreign key(EmployeeID) references Employees(ID_employee) on delete cascade
alter table Salary add constraint FK_position_in_salary foreign key(PositionID) references Positions(ID_position)

insert Salary(EmployeeID, PositionID, Salary_amount) values
(1, 1, 45000),
(2, 2, 21000),
(3, 3, 35000),
(4, 2, 21000), 
(5, 2, 21000)

--����� ������ ������� ��������
--SELECT * FROM Clients
--SELECT * FROM Orders
--SELECT * FROM Goods
--SELECT * FROM Suppliers
--SELECT * FROM Flowers
--SELECT * FROM Bouquets
--SELECT * FROM Accessories
--SELECT * FROM Composition_of_accessories
--SELECT * FROM Composition_of_bouquet
--SELECT * FROM Goods_int_the_order
--SELECT * FROM Goods_on_sale
--SELECT * FROM Supply
--SELECT * FROM Positions
--SELECT * FROM Employees
--SELECT * FROM Executer_of_the_order
--SELECT * FROM Salary

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--�������������------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
GO
CREATE VIEW ClientDataOrderEmployee
AS SELECT Orders.ID_order, Clients.ID_client,Clients.Surname, Clients.Name, Clients.Phone_number, 
          Clients.Bonus, Orders.Date_order, Orders.Cost, Employees.Surname_of_empl
FROM Orders
INNER JOIN Clients ON Clients.ID_client = Orders.ClientID
INNER JOIN Executer_of_the_order ON Orders.ID_order = Executer_of_the_order.OrderID
INNER JOIN Employees ON Employees.ID_employee = Executer_of_the_order.EmployeeID
--SELECT * FROM ClientDataOrderEmployee

GO
CREATE VIEW SupplyAndSupliers
AS SELECT Suppliers.ID_supplier
   FROM Suppliers
   WHERE EXISTS 
        (SELECT *
         FROM Supply
         WHERE Supply.SupplierID = Suppliers.ID_supplier);

--SELECT * FROM SupplyAndSupliers

GO 
CREATE VIEW Camomilies
AS SELECT *
   FROM Flowers
   WHERE Name_flower IN ('Camomile');
--SELECT * FROM Camomilies

--�������� ������������ �������������------------------------------------------------------------------------------------------------------------------
GO
CREATE VIEW View4
AS SELECT *
   FROM Clients
   WHERE Bonus > 0
WITH CHECK OPTION

--INSERT INTO View4(Surname, Name, Phone_number, Bonus) VALUES ( 'Ezhova', 'Elena', '89962004205', 0)

--�������� ���������������� �������������--------------------------------------------------------------------------------------------------------------
SET NUMERIC_ROUNDABORT OFF; 
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;

GO
CREATE VIEW View_5 
WITH SCHEMABINDING
AS SELECT Salary_amount
   FROM dbo.Salary
   WHERE Salary_amount > 22000

CREATE UNIQUE CLUSTERED INDEX ClusteredIndex_View_5 ON View_5 (Salary_amount)

--drop index ClusteredIndex_View_5 on View_5

--SELECT *
--FROM View_5
--WITH(NOEXPAND)

--SELECT Salary_amount
--   FROM Salary
--   WHERE Salary_amount > 22000;

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--��������-----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

--����������� �������� AFTER ��� �������� INSERT, UPDATE, DELETE---------------------------------------------------------------------------------------

--INSERT
--���������� ������ ����������-��������, � �������� ������������� �� 21000
--��� ���������� ������� �������� ������� ������ ������
GO
CREATE TRIGGER trig_1
ON Salary
AFTER INSERT
AS  BEGIN 
		DECLARE @EmpID INT = (SELECT EmployeeID FROM Inserted)
		DECLARE @PosID INT = (SELECT PositionID FROM Inserted)
		DECLARE @Salary_am INT = (SELECT Salary_amount FROM Inserted)
		IF (@Salary_am != 21000 AND @PosID = 2)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('ERROR! Uncorrect salary for florist!', 1, 1)
				DECLARE @newAm INT = 21000
				INSERT INTO Salary (EmployeeID, PositionID, Salary_amount)
				VALUES (@EmpID, @PosID, @newAm)
			END
	END


--UPDATE Orders SET Date_order = '25.11.2022' WHERE ID_order = 1

--INSERT Employees(Surname_of_empl, Name_of_empl, Date_of_birth, Phone_number, Post, Work_experience)
--VALUES ('Minin', 'Dmitriy', '2003-02-12', '89063156714', 2, 2)
----�������� �����������
--INSERT Salary (EmployeeID, PositionID, Salary_amount, Date_payment) VALUES (6, 2, 10000, '25.11.22')

--drop trigger trig_1

--UPDATE
--��������� ���� ������(� ������ �������� ��������� ���� ������� ����� �������� ������),
--� ����� ����� ��������� ���� �������� ��� �����������
GO 
CREATE TRIGGER trig_2
ON Orders
AFTER UPDATE
AS  BEGIN 
		DECLARE @OrderIDD int = ( SELECT ID_order FROM Inserted)
		DECLARE @dateOfOrder Date = ( SELECT Date_order FROM Inserted)
		DECLARE @yearOfOrder INT = ( SELECT DATEPART(YEAR, Date_order) AS year FROM Inserted )
		DECLARE @monthOfOrder INT = ( SELECT DATEPART(MONTH, Date_order) AS year FROM Inserted )
		DECLARE @dayOrder INT = ( SELECT DATEPART(DAY, Date_order) AS year FROM Inserted )
		DECLARE @currentDate Date = ( SELECT GETDATE() )
		DECLARE @currentYear INT = ( SELECT YEAR(@currentDate) AS Year )
		DECLARE @currentDay INT = ( SELECT MONTH(@currentDate) AS Month )
		DECLARE @currentMonth INT = ( SELECT DAY(@currentDate) AS Day )
		IF (@yearOfOrder < @currentYear OR (@monthOfOrder = @currentMonth AND @dayOrder < @currentDay) OR @monthOfOrder = @currentMonth)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('ERROR! Date order cannot be updated to the past date!', 16, 1)
			END
		ELSE
			UPDATE Supply SET Date_of_supply = @dateOfOrder WHERE OrderFor = @OrderIDD
	END

----�������� �����������
--UPDATE Orders SET Date_order = '25.11.2022' WHERE ID_order = 1

----�������� ��������������� ��������
--UPDATE Orders SET Date_order = '11.11.2022' WHERE ID_order = 1
--SELECT * FROM goodsOnSale
--SELECT * FROM Supply

--DROP TRIGGER trig_2

--DELETE
--�������� ���������� �� ������� � ������������(� ������ �������� ���������� � ID = 1, 
--�� ���� ���������, ������� ����� �������� ������),
--� ����� ����� �� ������� � ������������� �������� ������, ������� ���� �����������  
GO
CREATE TRIGGER trig_3
ON Employees
AFTER DELETE
AS  BEGIN
		DECLARE @empID INT = (SELECT ID_employee FROM Deleted)
		DECLARE @postEmpl INT = (SELECT Post FROM Employees WHERE ID_employee = @empID)
		IF (@postEmpl = 1)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('ERROR! It is not possible to delete this value!', 16, 1)
			END
		ELSE
			BEGIN
				DELETE FROM Executer_of_the_order WHERE EmployeeID = @empID
			END
	END

----�������� �����������
--DELETE FROM Employees WHERE ID_employee = 1

----�������� ��������������� ��������
--DELETE FROM Employees WHERE ID_employee = 2

--insert Employees(Surname_of_empl, Name_of_empl, Date_of_birth, Phone_number, Post, Work_experience)
--values ('�������', '�������', '14.05.2002', '89089890011', 2, 1)
--insert Executer_of_the_order(OrderID, EmployeeID) values (2, 8)

--SELECT * FROM Employees
--SELECT * FROM Executer_of_the_order

--DROP TRIGGER trig_3

--�������� ������������ ������������� � ������� �������� INSTEAD OF (��� INSERT, UPDATE, DELETE)-------------------------------------------------------

--INSERT
--��� ���������� ������ ������ � �������������, ������ ������������� ����������� � ������� �������, ������ � ����������� �������
GO
CREATE TRIGGER trig_4 ON ClientDataOrderEmployee
INSTEAD OF INSERT
AS BEGIN
		DECLARE @sur_cl nvarchar(30) = (SELECT Surname FROM inserted)
		DECLARE @name_cl nvarchar(30) = (SELECT Name FROM inserted)
		DECLARE @ph nvarchar(30) = (SELECT Phone_number FROM inserted)
		DECLARE @date_orr date = (SELECT Date_order FROM inserted)
		DECLARE @sur_em nvarchar(30)
		EXEC florists @date_orr, @sur_em OUTPUT
		DECLARE @idd_em int = (SELECT ID_employee FROM Employees WHERE @sur_em = Surname_of_empl)
		DECLARE @bbbonuss int = null
		DECLARE @flagg int
		BEGIN
			
			IF(@sur_em = 'null')
				BEGIN
					ROLLBACK TRANSACTION
					RAISERROR ('������! �������� ������ ����, ��� ��� � ��� ���� ��� ���������� ������!', 16, 1)
				END
			ELSE
				BEGIN
					SET @flagg = (SELECT ID_client FROM Clients WHERE Surname = @sur_cl AND @name_cl = Name AND Phone_number = @ph)
					IF(@flagg > 0)
						BEGIN
							SET @bbbonuss =(SELECT Bonus FROM Clients WHERE @flagg = ID_client)
							INSERT INTO Orders(ClientID, Date_order, Cost, Status_of_order) VALUES(@flagg, @date_orr, 0, 'In progress')
							DECLARE @or_ID2 INT = (SELECT ID_order FROM Orders WHERE ClientID = @flagg AND Date_order = @date_orr AND Cost = 0)
							INSERT INTO Executer_of_the_order VALUES (@or_ID2, @idd_em)
						END
					ELSE 
						BEGIN
							INSERT INTO Clients(Surname, Name, Phone_number, Bonus) VALUES(@sur_cl, @name_cl, @ph, @bbbonuss)
							DECLARE @cl_ID INT = (SELECT ID_client FROM Clients WHERE Surname = @sur_cl AND @name_cl = Name AND Phone_number = @ph)
							INSERT INTO Orders(ClientID, Date_order, Cost, Status_of_order) VALUES(@cl_ID, @date_orr, 0, 'In progress')
							DECLARE @or_ID INT = (SELECT ID_order FROM Orders WHERE ClientID = @cl_ID AND Date_order = @date_orr AND Cost = 0)
							INSERT INTO Executer_of_the_order VALUES (@or_ID, @idd_em)
					
						END
				END
		END
   END

--drop trigger trig_4

--SET IDENTITY_INSERT dbo.Orders OFF

--INSERT INTO ClientDataOrderEmployee(Surname, Name, Phone_number, Date_order)
--VALUES ('Errr', '�����', '8906567890', '29.04.2023')

--SELECT * FROM ClientDataOrderEmployee
--SELECT * FROM Clients
--SELECT * FROM Orders
--SELECT * FROM Executer_of_the_order

--UPDATE
--��� ��������� ����������� ������ ������ � �������������, ������ ������������� ����������� ������� � ������������� �������
GO
CREATE TRIGGER trig_5 ON ClientDataOrderEmployee
INSTEAD OF UPDATE
AS BEGIN
		DECLARE @ord_ID INT = (SELECT ID_order FROM inserted)
		DECLARE @sur_client nvarchar(30) = (SELECT Surname FROM inserted)
		DECLARE @name_client nvarchar(30) = (SELECT Name FROM inserted)
		DECLARE @ph_client nvarchar(30) = (SELECT Phone_number FROM inserted)
		DECLARE @bon INT = (SELECT Bonus FROM inserted)
		DECLARE @date date = (SELECT Date_order FROM inserted)
		DECLARE @cost INT = (SELECT Cost FROM inserted)
		DECLARE @sur nvarchar(30) = (SELECT Surname_of_empl FROM inserted)
		DECLARE @idempl int = (SELECT ID_employee FROM Employees WHERE Surname_of_empl = @sur)
		BEGIN
			UPDATE Executer_of_the_order SET EmployeeID = @idempl WHERE OrderID = @ord_ID
			DECLARE @id_cl int = (SELECT ClientID FROM Orders WHERE ID_order = @ord_ID)
			UPDATE Clients SET Surname = @sur_client, Name = @name_client, Phone_number = @ph_client WHERE ID_client = @id_cl 
			UPDATE Orders SET Date_order = @date WHERE ID_order = @ord_ID
		END
   END

--drop trigger trig_5

--UPDATE ClientDataOrderEmployee SET Surname_of_empl = 'Antonova' WHERE ID_order = 3
--UPDATE Executer_of_the_order SET Surname_of_empl = 'Olgin' WHERE Name_of_empl = 'Alex'

--SELECT * FROM ClientDataOrderEmployee
--SELECT * FROM Clients
--SELECT * FROM Employees

--DELETE
--��� �������� ������ � �������������, ������ ������������� ����� ��������� � � ������� � ������������� �������
GO
CREATE TRIGGER trig_6 ON ClientDataOrderEmployee
INSTEAD OF DELETE
AS BEGIN
		DECLARE @ord_ID INT = (SELECT ID_order FROM deleted)
		BEGIN
			DELETE FROM Executer_of_the_order WHERE OrderID = @ord_ID
		END
   END

--drop trigger trig_6

--DELETE FROM ClientDataOrderEmployee WHERE ID_order = 8

--SELECT * FROM ClientDataOrderEmployee
--SELECT * FROM Executer_of_the_order


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--���������----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--���������_1. � ������������� ���� ������, ������� ����������� ��������� ����� �������� ��������� ������ � ������ ������
GO
CREATE PROCEDURE finalCost @clientID INT, @orderID INT
AS BEGIN 
		DECLARE @orederCost INT = (SELECT Cost FROM Orders WHERE @orderID = ID_order)
		DECLARE @bon INT = (SELECT Bonus FROM Clients WHERE @clientID = ID_Client)
		DECLARE @sale INT =  (SELECT (SELECT @orederCost / 100) * @bon)
		IF (ISNULL(@bon, 0) <> 0)
			UPDATE Orders Set Cost -= @sale WHERE @orderID = ID_order
   END
   
--�������� ���������
--DROP PROCEDURE finalCost

------�������� ���������
------1 ������
--DECLARE @clientIDCheckk1 INT = 1
--DECLARE @ord INT = 2

--DECLARE @finalCostWithBonusCheck1 INT

--EXEC @finalCostWithBonusCheck1 = finalCost @clientIDCheckk1, @ord
--PRINT @finalCostWithBonusCheck1 

--SeLECT * From ClientDataOrderEmployee

--SELECT * FROM Clients --� ������� � ID = 3 ��� ������
--SELECT * FROM Orders --��������� ������ �������� 10000 

----2 ������
--DECLARE @clientIDCheckk2 INT = 1
--DECLARE @finalCostWithBonusCheck2 INT

--EXEC @finalCostWithBonusCheck2 = finalCost @clientIDCheckk2
--PRINT @finalCostWithBonusCheck2

--SELECT * FROM Clients --� ������� � ID = 1 ����� 25 
--SELECT * FROM Orders --��������� ������ 2500 - 25% = 1875 

--���������_2. ��� ������� ������������ ����� ���������� ���������� ������� ������, ��������� �������� � �������
GO
CREATE PROCEDURE actualAbility @type NVARCHAR(15), @name_good NVARCHAR(15), @finalAbility NVARCHAR(100) OUTPUT, @color_good NVARCHAR(15)
AS BEGIN 
		BEGIN
			IF (@type = 'flowers')
				BEGIN
					DECLARE @abFl INT = (SELECT Actual_availability FROM Flowers 
					                     WHERE (@name_good = LOWER(Name_flower) AND @color_good = LOWER(Color)))
					SET @finalAbility = 'Actual ability of ' + @color_good + ' ' + @name_good + ' is ' + CONVERT(NVARCHAR, @abFl)
				END
			IF (@type = 'bouquets') 
				BEGIN
					DECLARE @abBq INT = (SELECT Actual_availability FROM Bouquets WHERE @name_good = LOWER(Name_bouquet))
				--PRINT( 'Actual ability of bouquet ' + @name_good +' is ' + CONVERT(NVARCHAR, @abBq))
					SET @finalAbility = 'Actual ability of bouquet ' + @name_good +' is ' + CONVERT(NVARCHAR, @abBq)
				END
			IF (@type = 'accessories') 
				BEGIN
					DECLARE @abAc INT = (SELECT Actual_availability 
					                     FROM Accessories 
										 WHERE (@name_good = LOWER(Name_accessory) AND @color_good = LOWER(Color_accessory)))
					SET @finalAbility = 'Actual ability of ' + @color_good + ' ' + @name_good + ' is ' + CONVERT(NVARCHAR, @abAc)
				END
		END
   END
   
--�������� ���������
--DROP PROCEDURE actualAbility

----�������� ���������
----1 ������
--DECLARE @typeCheck1 NVARCHAR(15) = 'flowers'
--DECLARE @nameGoodCheck1 NVARCHAR(15) = 'camomile' 
--DECLARE @colorCheck1 NVARCHAR(15) = 'yellow'
--DECLARE @finalAbilityCheck1 NVARCHAR(100) 

--EXEC actualAbility @typeCheck1, @nameGoodCheck1, @finalAbilityCheck1 OUTPUT, @colorCheck1
--PRINT @finalAbilityCheck1

--SELECT * FROM Flowers
----2 ������
--DECLARE @typeCheck2 NVARCHAR(15) = 'bouquets'
--DECLARE @nameGoodCheck2 NVARCHAR(15) = 'candy' 
--DECLARE @colorCheck2 NVARCHAR(15) = NULL
--DECLARE @finalAbilityCheck2 NVARCHAR(100) 

--EXEC actualAbility @typeCheck2, @nameGoodCheck2, @finalAbilityCheck2 OUTPUT, @colorCheck2
--PRINT @finalAbilityCheck2

--SELECT * FROM Bouquets

----3 ������
--DECLARE @typeCheck3 NVARCHAR(15) = 'accessories'
--DECLARE @nameGoodCheck3 NVARCHAR(15) = 'tape' 
--DECLARE @colorCheck3 NVARCHAR(15) = 'pink'
--DECLARE @finalAbilityCheck3 NVARCHAR(100) 

--EXEC actualAbility @typeCheck3, @nameGoodCheck3, @finalAbilityCheck3 OUTPUT, @colorCheck3
--PRINT @finalAbilityCheck3

--SELECT * FROM Accessories

--���������_3. ����� ������� ��������� ���������, ������� ����� �� ��������� ����� �� �������� ����, 
--���� ��� �� ������ ����������� ������� ������ � ��� ����
GO
CREATE PROCEDURE florists @dateOr DATE, @sur NVARCHAR(1000) OUTPUT
AS BEGIN 
		DECLARE @surNamE NVARCHAR(15)
		--���������� ��������
		DECLARE cur CURSOR local scroll for
		SELECT Surname_of_empl
		FROM Employees

		OPEN cur --�������� �������
		FETCH cur INTO @surNamE --���������� ������

		DECLARE @ID_Or INT = (SELECT ID_order FROM Orders WHERE @dateOr = Date_order)
		IF (ISNULL(@ID_Or, -1) = -1)
			BEGIN
				WHILE @@FETCH_STATUS = 0
					BEGIN
						DECLARE @postt INT = (SELECT Post FROM Employees WHERE @surNamE = Surname_of_empl)
						IF (@postt = 2)
							BEGIN
								SET  @sur = @surNamE
							END
						FETCH NEXT FROM cur INTO @surNamE
					END
			END
		ELSE
			BEGIN
				DECLARE @id_ex INT = (SELECT EmployeeID FROM Executer_of_the_order WHERE OrderID = @ID_Or)
				DECLARE @ex_sur NVARCHAR(15) = (SELECT Surname_of_empl FROM Employees WHERE ID_employee = @id_ex)
				WHILE @@FETCH_STATUS = 0
					BEGIN
						DECLARE @p INT = (SELECT Post FROM Employees WHERE @surNamE = Surname_of_empl)
						IF (@surNamE <> @ex_sur AND @p = 2)
							BEGIN
								--DECLARE @id_ex2 INT = (SELECT ID_employee FROM Employees WHERE Surname_of_empl = @surNamE)
								--DECLARE @ID_Or2 INT = (SELECT OrderID FROM Executer_of_the_order WHERE EmployeeID = @id_ex2)
								--IF (@ID_Or2 > 0 )
								--	BEGIN
								--		SET @sur = 'null'
								--	END
								--ELSE
								--	BEGIN
										SET @sur = @surNamE
									--END
							END
						FETCH NEXT FROM cur INTO @surNamE
					END
			END
		CLOSE cur
		DEALLOCATE cur
   END

--�������� ���������
--DROP PROCEDURE florists

------�������� ���������
------1 ������
--DECLARE @dateCheck1 date = '14.11.2022' --������ ���� ������ ��� � �������, ������ ��� �������� ��������
--DECLARE @floristasCheck1 NVARCHAR(1000)

--EXEC florists @dateCheck1, @floristasCheck1 OUTPUT
--PRINT @floristasCheck1

--SELECT * FROM Executer_of_the_order 
--SELECT * FROM Employees 
--SELECT * FROM Positions

----2 ������
--DECLARE @dateCheck2 date = '25.02.2023' --�� ��� ���� ��� �������� �������, 
--                                        --������� ����� �� ������ ��������� ������� ����� ��������
--DECLARE @floristasCheck2 NVARCHAR(1000)

--EXEC florists @dateCheck2, @floristasCheck2 OUTPUT
--PRINT @floristasCheck2


--SELECT * FROM Orders 
--SELECT * FROM Executer_of_the_order 
--SELECT * FROM Employees 
--SELECT * FROM Positions

--���������_4. ����� �������, ������ �� ������� ��� ������ ������� �� ���. 
--������������ ������ ����� �������� � ����������� �� ������, ������� ����� ��������:
-- 1 - ����� ������� �� ���
-- 2 - ����� ������ �� ������� � �� �������� ����������� �� ��� 
-- 3 - ����� ������ ������� �� ��� 
GO
CREATE PROCEDURE moneyOfYear @operation INT, @year INT, @money1 INT OUTPUT
AS BEGIN 
		DECLARE @dateFirst DATE = CONVERT(NVARCHAR, @year) + '-01-01'
		DECLARE @dateLast DATE = CONVERT(NVARCHAR, @year) + '-12-31' 
		DECLARE @moneyFromClients INT = ( SELECT SUM(Cost)
										  FROM Orders
										  WHERE DATEDIFF(day, @dateFirst, Date_order) >= 0 AND 
												DATEDIFF(day, @dateLast, Date_order) <= 0 )
		DECLARE @moneyForSuppliers INT = ( SELECT SUM(Numbers * Price_from_supplier)
										   FROM Supply
										   WHERE DATEDIFF(day, @dateFirst, Date_of_supply) >= 0 AND 
												 DATEDIFF(day, @dateLast, Date_of_supply) <= 0 )
		DECLARE @moneyForEmployees INT = (SELECT SUM(Salary_amount * 12) FROM Salary)

		DECLARE @moneyForCompany INT = @moneyFromClients - @moneyForSuppliers - @moneyForEmployees

		IF (@operation = 1) 
			BEGIN
				SET @money1 = @moneyFromClients

			END
		IF (@operation = 2) 
			BEGIN
				SET @money1 = @moneyForSuppliers + @moneyForEmployees
			END
		IF (@operation = 3) 
			BEGIN
				SET @money1 = @moneyForCompany

			END
	END

--�������� ���������
DROP PROCEDURE moneyOfYear

------�������� ���������
------1 ������
DECLARE @year1 INT = 2022
DECLARE @operation1 INT = 2
DECLARE @money1 INT

EXEC moneyOfYear @operation1, @year1, @money1 OUTPUT--������� � 2022 ���� ��������� 10350
print @money1
--SELECT * FROM Orders

------2 ������
--DECLARE @year2 INT = 2022
--DECLARE @operation2 INT = 2
--DECLARE @money2 INT

--EXEC @money2 = moneyOfYear @operation2, @year2--������� � 2022 ���� ��������� 1722420
--PRINT @money2

--SELECT * FROM Supply

----3 ������
DECLARE @year3 INT = 2022
DECLARE @operation3 INT = 3
DECLARE @money3 INT

EXEC @money3 = moneyOfYear @operation3, @year3 --������ ������� -1712070
PRINT @money3

--SELECT * FROM Goods
--SELECT * FROM Orders
--SELECT * FROM Supply

--���������_5. ����� ������ ��� ����������� � ���������� � ���������� �������
GO
CREATE PROCEDURE supplyDay @dateOrder date, @IDgoodForOr INT, @num INT, @ordor INT
AS BEGIN 
		DECLARE @Price INT = (SELECT MIN (Price_from_supplier) FROM SuppliersAndPriceDays WHERE @IDgoodForOr = GoodID)
		DECLARE @IDSup INT = (SELECT MIN(ID_supplier) From SuppliersAndPriceDays WHERE (@Price = Price_from_supplier AND @IDgoodForOr = GoodID))
		DECLARE @days INT = (SELECT DaysS FROM SuppliersAndPriceDays WHERE @IDSup = ID_supplier AND @IDgoodForOr = GoodID)
		DECLARE @dtype INT = (SELECT Type_good FROM Goods WHERE @IDgoodForOr = ID_good)

		INSERT Supply VALUES (@IDSup, @IDgoodForOr, @dtype, @num, DATEADD(DAY, @days, @dateOrder), @Price, @ordor) 
   END

--�������� ���������
--DROP PROCEDURE supplyDay

----�������� ���������
----1 ������
--DECLARE @dateOrderCheck1 date = '20.11.2022'
--DECLARE @IDgoodForOrCheck1 INT = 3
--DECLARE @numCheck1 INT = 15
--DECLARE @ordorCheck1 INT = NULL

--EXEC supplyDay @dateOrderCheck1, @IDgoodForOrCheck1, @numCheck1, @ordorCheck1






GO
CREATE VIEW goodsOnSale
AS SELECT Goods.Name_good, Type_of_goods.Type_of, Goods_on_sale.Number_of_goods
FROM Goods_on_sale
INNER JOIN Goods ON Goods_on_sale.ID_good = Goods.ID_good
INNER JOIN Type_of_goods ON Type_of_goods.ID_type = Goods_on_sale.Type_good
--SELECT * FROM goodsOnSale

--drop view goodsOnSale
GO
CREATE VIEW goodsInTheOrder
AS SELECT Goods_int_the_order.ID_order, Goods.Name_good, Type_of_goods.Type_of, Goods_int_the_order.Number_of_goods
FROM Goods_int_the_order
INNER JOIN Goods ON Goods_int_the_order.ID_good = Goods.ID_good
INNER JOIN Type_of_goods ON Type_of_goods.ID_type = Goods_int_the_order.Type_good

--SELECT * FROM goodsInTheOrder

--drop TRIGGER trig_90

--SELECT * FROM goodsInTheOrder
GO
CREATE TRIGGER trig_90
ON goodsInTheOrder
INSTEAD OF INSERT
AS  BEGIN 
		DECLARE @namee nvarchar(30) = (SELECT Name_good FROM Inserted)
		DECLARE @ID_g INT = (SELECT ID_good FROM Goods WHERE @namee = Name_good)
		DECLARE @num INT = (SELECT Number_of_goods FROM Inserted)
		DECLARE @type INT = (SELECT Type_good FROM Goods WHERE ID_good = @ID_g)
		DECLARE @Id_or INT = (SELECT ID_order FROM inserted )
		DECLARE @cost INT = 0

		BEGIN
			INSERT INTO Goods_int_the_order (ID_good, Type_good, ID_order, Number_of_goods)values (@ID_g, @type, @Id_or, @num) 
			if (@type = 1)
				BEGIN
					UPDATE Flowers SET Actual_availability -= @num WHERE FlowerID = @ID_g
					DECLARE @nummm1 INT = (SELECT Actual_availability FROM Flowers WHERE FlowerID = @ID_g)
					UPDATE Goods_on_sale SET Number_of_goods = @nummm1 WHERE ID_good = @ID_g AND @type = Type_good
					UPDATE Orders SET Cost += @cost WHERE ID_order = @Id_or
				END
			if (@type = 2)
				BEGIN
					UPDATE Bouquets SET Actual_availability -= @num WHERE BouquetID = @ID_g
					DECLARE @nummm2 INT = (SELECT Actual_availability FROM Bouquets WHERE BouquetID = @ID_g)
					UPDATE Goods_on_sale SET Number_of_goods = @nummm2 WHERE ID_good = @ID_g AND @type = Type_good
					UPDATE Orders SET Cost += @cost WHERE ID_order = @Id_or
				END
			if (@type = 3)
				BEGIN
					UPDATE Accessories SET Actual_availability -= @num WHERE AccessoryID = @ID_g
					DECLARE @nummm3 INT = (SELECT Actual_availability FROM Accessories WHERE AccessoryID = @ID_g)
					UPDATE Goods_on_sale SET Number_of_goods = @nummm3 WHERE ID_good = @ID_g AND @type = Type_good
					UPDATE Orders SET Cost += @cost WHERE ID_order = @Id_or
				END

		END
	END


GO
CREATE TRIGGER trig_91
ON goodsInTheOrder
INSTEAD OF UPDATE
AS  BEGIN 
		DECLARE @Id_or INT = (SELECT ID_order FROM inserted )

		DECLARE @namee nvarchar(30) = (SELECT Name_good FROM goodsInTheOrder WHERE ID_order = @Id_or)

		DECLARE @typee nvarchar(30) = (SELECT Type_of FROM goodsInTheOrder WHERE ID_order = @Id_or)

		DECLARE @ID_g INT = (SELECT ID_good FROM Goods WHERE @namee = Name_good)

		DECLARE @num INT = (SELECT Number_of_goods FROM inserted)

		DECLARE @type INT = (SELECT ID_type FROM Type_of_goods WHERE Type_of = @typee)
		UPDATE Goods_int_the_order SET Number_of_goods = @num WHERE ID_order = @Id_or and ID_good = @ID_g
		
	END

--drop view goodsInTheOrder
--drop TRIGGER trig_91

--Select * from goodsInTheOrder
--Select * from Goods_int_the_order
--Select * from Bouquets

--UPDATE goodsInTheOrder SET Number_of_goods = 11 WHERE ID_order = 4 and Name_good = 'Candy'


GO
CREATE TRIGGER trig_92
ON goodsInTheOrder
INSTEAD OF DELETE
AS  BEGIN 
		DECLARE @Id_or INT = (SELECT ID_order FROM deleted )
		DECLARE @name nvarchar(30) = (SELECT Name_good FROM deleted )
		DECLARE @id_g int = (SELECT ID_good FROM Goods WHERE Name_good = @name)

			DELETE Goods_int_the_order WHERE ID_order = @Id_or and ID_good = @id_g

	END

--Select * from goodsInTheOrder
--DELETE goodsInTheOrder WHERE ID_order = 8 and Name_good = 'Roses white'
--			DELETE Goods_int_the_order WHERE ID_order = 6 and ID_good = 4



GO
CREATE TRIGGER trig_900
ON Goods_int_the_order
AFTER UPDATE
AS  BEGIN 
		DECLARE @ID_g INT = (SELECT ID_good FROM Inserted)
		DECLARE @num INT = (SELECT Number_of_goods FROM Inserted)
		DECLARE @type INT = (SELECT Type_good FROM Goods WHERE ID_good = @ID_g)

		BEGIN
			if (@type = 1)
				BEGIN
					UPDATE Flowers SET Actual_availability -= @num WHERE FlowerID = @ID_g
				END
			else if (@type = 2)
				BEGIN
					UPDATE Bouquets SET Actual_availability -= @num WHERE BouquetID = @ID_g
				END
			else if (@type = 2)
				BEGIN
					UPDATE Accessories SET Actual_availability -= @num WHERE AccessoryID = @ID_g
				END

		END
	END

SELECT * FROM Orders WHERE CONCAT(ID_order, ID_client, Surname, Name, Phone_number, Bonus,  CONVERT(VARCHAR(25), Date_order), Cost, Surname_of_empl) LIKE '%29.%'

























	--1 ������ �� �������� ���� ������� �� �������
--DELETE FROM Salary


--1 ������  � �������� WHERE ��������� ������� �� �������
--DELETE FROM Flowers WHERE FlowerID = 11

----------------------------������� � �������������� ��������� ����� ���������� ������ 

--Inner join(���������� ������ ������, ������� ������� � ����� ��������)
--����� ����� ����� ������ ������ � ����� ���� � ����� ��������� ��� ��������
SELECT Orders.ID_order, Clients.Surname, Clients.Name, Orders.Date_order, Executer_of_the_order.EmployeeID, Employees.Surname_of_empl, Employees.Name_of_empl
FROM Orders
INNER JOIN Clients ON Clients.ID_client = Orders.ClientID
INNER JOIN Executer_of_the_order ON Orders.ClientID = Executer_of_the_order.OrderID
INNER JOIN Employees ON Executer_of_the_order.EmployeeID = Employees.ID_employee

--Left join (���������� ��� ������ �� ����� �������, � ��� �� ��������� ������ �� ������ ������� ��������� �������� NULL)
--���������� �����, ������� ������� �� ���������� ������ � �� ����������� 
SELECT Bouquets.BouquetID, Bouquets.Name_bouquet, Flowers.Name_flower, Composition_of_bouquet.Number_of_flowers
FROM Bouquets
LEFT JOIN Composition_of_bouquet ON Composition_of_bouquet.ID_bouquet = Bouquets.BouquetID
LEFT JOIN Flowers ON Composition_of_bouquet.ID_flower = Flowers.FlowerID

--Right join (�� �� �����, ��� � left join, �� ��� ������ �������)
--���������� �����, ������� ������� �� ���������� �����������
SELECT Bouquets.BouquetID, Bouquets.Name_bouquet, Accessories.Name_accessory
FROM Bouquets
RIGHT JOIN Composition_of_accessories ON Composition_of_accessories.ID_bouquet = Bouquets.BouquetID
RIGHT JOIN Accessories ON Composition_of_accessories.ID_accessory = Accessories.AccessoryID

--Full Join (���������� ��� ������)
--�������, ������������ ����� ������ ���������� � �������, � ����� ���
SELECT Goods.ID_good, Goods.Name_good, Goods_int_the_order.Number_of_goods
FROM Goods
FULL JOIN Goods_int_the_order ON Goods.ID_good = Goods_int_the_order.ID_good

--Cross Join (���������� ������������)
--����� � ��������� ����������
SELECT Flowers.Name_flower, Suppliers.Surname, Suppliers.Name_of_supplier
FROM Suppliers
CROSS JOIN Flowers 

--Cross Aply(������ � ���������� �����������)
--������� ������������ � ����������� ���� ������ ���������� ������ ���������
SELECT Positions.Name_of_position, Experience.MaxExperience, Experience.MinExperience
FROM Positions
CROSS APPLY
  (
    SELECT max(Employees.Work_experience) MaxExperience, min(Employees.Work_experience) MinExperience
	from Employees
	where Positions.ID_position = Employees.Post
  ) Experience;

--Self Join(��������������)
--������� �������� � ���������� �������
SELECT A.Name Name1, A.Surname Surname1, B.Name Name2, B.Surname Surname2, A.Bonus
FROM Clients A, Clients B
WHERE A.ID_client <> B.ID_client AND A.Bonus = B.Bonus

----------------------------------------���������� �������� ��� ����������� 

--UNION (���������� ��� ������ ������)
--��������� ������ ����������� � �����������
SELECT Phone_number FROM Suppliers
UNION
SELECT Phone_number FROM Employees

--UNION ALL (���������� ��� ������ ������ ������ � �������������� ��������)
--��������� ������ � ������
SELECT Name_bouquet FROM Bouquets
UNION ALL
SELECT Name_good FROM Goods

--EXCEPT (�������� ���� ������� �� ������ ������� � ������)
--������ ��� ������ �� �������
SELECT Name_good FROM Goods
EXCEPT
SELECT Name_bouquet FROM Bouquets

--INTERSECT(����� ���� ������������� �����)
--������� ������ ���������� �� �������
SELECT Name_accessory FROM Accessories
INTERSECT
SELECT Name_good FROM Goods 

----------------------------���������� ������ � �������� � �������������� ���������� 

--EXISTS(���������� ���� �� ���� �� ���� ����� ������)
--����� �����������, � ������� �������� ��������
SELECT Suppliers.ID_supplier
  FROM Suppliers
 WHERE EXISTS 
  (SELECT *
     FROM Supply
    WHERE Supply.SupplierID = Suppliers.ID_supplier);

--IN(����� ����� � ����������� ����������)
--����� ����� � ��������� � ������
SELECT *
  FROM Flowers
 WHERE Name_flower IN ('Camomile', 'Roses');

--ALL(���������� TRUE, ���� ��� �������� ���������� ������������� �������)
SELECT Surname, Name
FROM Clients
WHERE Bonus > ALL (SELECT min(Bonus) FROM Clients);

--ANY( ���������� TRUE, ���� �����-���� �� �������� ���������� ������������� �������)
--����� ��������, � ������� ��� ������ ������ ������ 15 ���������
SELECT Orders.ID_order, Orders.ID_order
FROM Orders
WHERE ClientID = ANY (SELECT ID_client FROM Clients WHERE Bonus > 15);

--BETWEEN(������� ������ � �������� ���������)
--����� ������� � ID � ��������� �� 5 �� 15
SELECT *
  FROM Goods
 WHERE ID_good BETWEEN 5 AND 15;

--LIKE(�������� ������������ �������������� �������(% � _) ��� ������������� � �������� � �������)
--����� ���� �����������, � ������� ������� ���������� � ����� �
SELECT *
  FROM Suppliers
 WHERE Surname LIKE '�%';
 --����� ���� �����������, � ������� ��� �������� ����� �
SELECT *
  FROM Suppliers
 WHERE Name_of_supplier LIKE '%�%';
 --����� ���� �����������, � ������� ����� ���������� �� 8906
SELECT *
  FROM Suppliers
 WHERE Phone_number LIKE '8906_______';

----------------------------------------------������� � �������������� ��������� CASE
--�������� ������� �� �����
SELECT Bouquets.Name_bouquet, Bouquets.Price,
CASE
    WHEN Price <= 1000 THEN '��������� �������'
    WHEN Price > 1000 AND Price < 5000 THEN '������� �������'
    WHEN Price >= 5000 THEN '������� �������'
END Collection
FROM Bouquets;

-------------------------------------------������������� ���������� ������� 
--������� �������������� ����� (CAST, CONVERT)
--CAST
SELECT CAST('25.12.2017' AS datetime) AS Res;
--CONVERT
SELECT CONVERT(int, '52') AS Res;

--������� ��� �������� �������� NULL (ISNULL, NULLIF)
--�������� IS NULL(���������� ������ � ��������� NULL � ��������� �������)
--����� ��������, � ������� ��� ������
SELECT Clients.ID_client, Clients.Bonus
FROM Clients
WHERE Bonus IS NULL;

--ISNULL(��������� ������� �������������� ��������, ����� ��������� ����� NULL, ���� ������ �������� �� ����� NULL, �� ������� ���������� ���) 
SELECT ISNULL(NULL, 22) AS Res;
SELECT ISNULL(23, NULL) AS Res;
SELECT ISNULL(NULL, NULL) AS Res;

--NULLIF(���������� NULL, ���� expr1 � expr2 ����� ��� ���������� expr1, ���� �� �����)
SELECT NULLIF(12, 12) AS Res;
SELECT NULLIF(12, 13) AS Res;

--COALESCE(���������� ������ �� null ��������� � ������, 
--���� ��� ��������� ����������� ��� null, �� ������ �������� null) 
--���������� ������� 
--CHOOSE(���������� �� ������ ������� ������ ���� �������� ����� �������, 
--������� ������������� ������������� �������)
--IIF(���������� ���� �� ���� �������� � ����������� �� ���������� ����������� ���������)
SELECT COALESCE(CHOOSE (2, 1, 2, 3), IIF(1 < 2, 'TRUE', 'FALSE')) AS Res;
SELECT COALESCE(CHOOSE (1, NULL, 2, 3), IIF(1 < 2, 3, NULL)) AS Res;
SELECT COALESCE(CHOOSE (1, NULL, 2, 3), IIF(1 < 2, NULL, 3)) AS Res;

-------------------------------������� � �������������� ������� ���  ������ �� �������� 

--REPLACE(�������� ������������������ �������� � ������ ������ ������� ��������)
SELECT REPLACE('����� ������', '�����', '������') AS Res

--SUBSTRING(��������� ��������� ��������� �� ������)
SELECT SUBSTRING('����� ������', 7, 12) AS Res

--STUFF(������� ������������������ �������� �� �������� ������ � 
--����� ��������� ������ ������������������ �������� � �������� ������, 
--������� � ��������� �������)
SELECT STUFF('����� ������', 7, 12, '������') AS Res;

--STR( ���������� ��������� ������������� �����)
--����� ������ �����
SELECT STR(123) AS Res;
--����� ������������� ����� ��� ���� ����� �������, ��� ��� ��������� ����������� �������������
SELECT STR(123.5) AS Res;
--����� ������������� ����� � ����� ������ ����� �������
SELECT STR(123.5, 5, 1) AS Res;

--UNICODE(���������� ����������� �������� ������� Unicode, ������ ���� ������� ��������� ��������, 
--�������� ������ �������� ������� �������)
SELECT UNICODE('t') AS Res;
SELECT UNICODE('Atlanta') AS Res;

--LOWER(����������� ��� ����� � ��������� ������ � ������ �������)
SELECT LOWER('����� ������') AS Res;
SELECT LOWER('����� ������') AS Res;

--UPPER(����������� ��� ����� � ��������� ������ � ������� �������)
SELECT UPPER('����� ������') AS Res;
SELECT UPPER('����� ������') AS Res;
 
-------------------------------------������� � �������������� ������� ���� � ������� 

--DATEPART(���������� �������� ����� �������� ���� � ���� �������������� ��������)
SELECT DATEPART(year, '25.12.2017 10:24:18') AS Year; 
SELECT DATEPART(month, '25.12.2017 10:24:18') AS Month;
SELECT DATEPART(day, '25.12.2017 10:24:18') AS Day; 
SELECT DATEPART(hour,'25.12.2017 10:24:18') AS Hour; 
SELECT DATEPART(minute, '25.12.2017 10:24:18')AS Minute; 
SELECT DATEPART(second, '25.12.2017 10:24:18') AS Second;
SELECT DATEPART(quarter, '25.12.2017 10:24:18') AS Quarter;

--DATEADD(���������� ����, ����� ������� ��� �������� ������������ �������� ������� / ����)
SELECT DATEADD(year, 1, '25.12.2017') AS Res;
SELECT DATEADD(year, -4, '25.12.2017') AS Res;
SELECT DATEADD(day, 4, '25.12.2017') AS Res;
SELECT DATEADD(day, -3, '25.12.2017') AS Res;
SELECT DATEADD(month, 1, '25.12.2017') AS Res;
SELECT DATEADD(month, -13, '25.12.2017') AS Res;

--DATEDIFF(���������� �������� ����� ����� ���������� ���� � ����������� �� ���������� ���������)
SELECT DATEDIFF(year, '25.12.2015', '25.12.2017') AS Res;
SELECT DATEDIFF(month, '01.09.2017', '25.12.2017') AS Res;
SELECT DATEDIFF(day, '01.09.2017', '25.12.2017') AS Res;
SELECT DATEDIFF(hour, '25.12.2017 08:00', '25.12.2017 10:45') AS Res;
SELECT DATEDIFF(minute, '25.12.2017 08:00', '25.12.2017 10:45') AS Res;

--GETDATE()(���������� ������� ���� � �����)
SELECT GETDATE() AS Res

--SYSDATETIMEOFFSET()(��������� ��������� �������� ��������� ���� � �������)
SELECT SYSDATETIMEOFFSET() AS Res

-----------------------------------------������� � �������������� ���������� �������

--GROUP BY(��������� ������������ ���������� ��� ������� �� ���� ������)
--����� ���������� ���������� ������ ���������
SELECT Post, COUNT(ID_Employee) CountEmployee
FROM Employees
GROUP BY Post
--���������� ������� ������� ������ ��� ����������� �� �����
SELECT SUM(Actual_availability) Availability
FROM Flowers
GROUP BY Name_flower;

--HAVING(������������ � ��������� � ���������� GROUP BY, 
--����� ���������� ������ ������������ ����� �� ������-�� ��������)
--����� ���������� ��������� ����� �����������
SELECT Post, COUNT(ID_Employee) CountEmployee
FROM Employees
GROUP BY Post
HAVING Post = 2;
