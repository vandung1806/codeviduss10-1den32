create database Task09
go
use AdventureWorks2019

--vi du 1
create view vwProductInfo AS
select ProductID, ProductNumber, Name, SafetyStockLevel
from Production.Product;
go

--vi du 2
select * from vwProductInfo

--vi du 3
create view vwPersonDetails as
select
	p.Title
	,p.[FirstName]
	,p.[MiddleName]
	,p.[LastName]
	,e.[JobTitle]
from [HumanResources] . [Employee] e
	inner join [Person] . [Person] p
	on p. [BusinessEntityID] = e. [BusinessEntityID]
go

--vi du 4
select * from vwPersonDetails

--vi du 5
create view vwPersonDetailsNew
as
select 
	coalesce(p.Title, '') as title
	,p. [FirstName]
	,coalesce (p.MiddleName, '') as MiddleName
	,p.[LastName]
	,e.[JobTitle]
from [HumanResources] . [Employee] e
	inner join [Person] . [Person] p
	on p.[BusinessEntityID] =e.[BusinessEntityID]
go

--vi du 6
create view vwSortePersonDetails as
select top 10 coalesce(p.Title, '') as Title
,p.[FirstName]
,COALESCE (p.MiddleName, '') as MiddleName
,p. [LastName]
,e. [JobTitle]
from [HUmonResources].[Employee] e inner join [Person].[Person] p
on p.[BusinessEntityID] = e.[BusinessEntityID] order by p.FirstName
go
--Retrieve records from the view
select * from vwSortePersonDetails

--7
create table Employee_Personal_Details (
	EmpID int not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null, 
	Address varchar(30)
	)
go

--8
create table Employee_Salary_Details (
	EmpID
	int not null,
	Designation varchar(30),
	Salary int not null
)
go

--9
create view vwEmployee_Personal_Details
as
select e1.EmpID,FirstName, LastName, Designation, Salary
from Employee_Personal_Details e1
join Employee_Personal_Details e2
on e1.EmpID=e2.EmpID
go

--10
insert into vwEmployee_Personal_Details values (2, 'Jack', 'Wilson', 'Software Developer', 16000)
go

--11
create view vwEmpDetails as
select FirstName, Address
from Employee_Personal_Details
go

--12
insert into vwEmpDetails(FirstName, Address) values ('Jack', 'NYC')
go

--13
create table Product_Details(
	Product int,
	ProductName varchar(30),
	Ratemoney int,
)
go

--14
create view vwProduct_Details
as
select ProductName, Ratemoney from Product_Details

--15
update vwProduct_Details
set Ratemoney= 3000
where ProductName='DVDWriter'

--16
create view vwProduct_Details as
select
PeoductName,
Description,
rate from Product_Details

--17
update vwProduct_Details
set Description.WRITE(N'Ex',0,2)
where ProductName='Portable Hard Drive'

--18
delete from vwCustDetails where CustID='C0004'

--19
ALTERVIEW vwProductInfo AS
SELECT ProductID, ProductNumber, Name, SafetyStockLevel, ReOrderPoint
FROM Production.Product;

--20
drop view vwProductInfo

--21
EXEC sp helptext vwEmployee Personal Details

-22
CREATE VIEW vwProduct Details AS
SELECT
ProductName,
AVG (Rate) AS AverageRate FROM
Product Details GROUP BY ProductName

--23
CREATE VIEW vwProductInfo AS
SELECT ProductID, ProductNumber, Name, SafetyStockLevel,
ReOrderPoint
FROM Production.Product
WHERE SafetyStockLevel<=1000
WITH CHECK OPTION;
GO

--24
UPDATE vwProductInfo SET SafetyStockLevel=2500
WHERE ProductID-321

--25
CREATE VIEWvwNewProductInfo WITH SCHEMABINDING AS
SELECT ProductID, ProductNumber, Name, SafetyStockLevel
FROM Production.Product;
GO

--26
CREATE TABLE Customers
Cust ID int,
CustName varchar (50),
Address varchar (60)

--27
CREATE VIEW vwCustomers
AS
SELECT FROM Customers

--28
SELECT FROM vwCustomers

--29
ALTER TABLE Customers ADD Age int

--30
SELECT FROM vwCustomers

--31
EXEC sp_refreshview 'vwCustomers'

--32
ALTER TABLE Production.Product ALTER COLUMN ProductIDvarchar(7)


