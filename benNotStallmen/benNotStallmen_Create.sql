
--create database BenNotStallmen
--	on (name = BenNotStallmen,
--		filename = 'C:\classData\CWEB2020DatabaseServers\databases\BenNotStallmen.dbf')

--log on
--	(name = BenNotStallmen_log,
--	fileName = 'C:\classData\CWEB2020DatabaseServers\databases\BenNotStallmen_log.ldf')

--;

create table Customer
(
	customerID int Identity(1,1) primary key,
	custFName nvarchar(50),
	custLname nvarchar(50),
	custEmailAdd nvarchar(100),
	custStreet nvarchar(100),
	custCity nvarchar(70),
	custState char(2),
	custZip varchar(10),
	isCurrent bit,
	cutomerSince datetime not null
);

create table CustomerPassword
(
	customerId int primary key not null,
	passwordHash varchar(128) not null,
	passwordSalt varchar(10) not null,
	modifiedDate datetime not null,
);

alter table CustomerPassword
add constraint FK_customerID
	foreign key (customerID)
	references Customer(customerID);

create table Product
(
	productID int Identity(1, 100000) primary key not null,
	productNum nvarchar(20) not null,
	price money not null,
	prodWeight decimal(8,3) not null,
	color varchar(15) not null,
	shelf nvarchar(10) not null,
	bin tinyint not null,
	quantity smallint not null,
	productDesc nvarchar(400) null,
	productPhotoThumb varbinary(max) null,
	productPhotoLarge varbinary(max) null,
	productPhotoFileName nvarchar(50) null
);

create table Sales
(
	orderNumber int Identity(100000, 1) primary key,
	customerID int not null,
	dateOrdered datetime not null,
	orderShipped bit,
);

alter table Sales
add constraint FK_Sales_customerID
	foreign key (customerID)
	references Customer(customerID);

create table SalesOrderLine
(
	salesOrderLineNumber tinyint not null,
	orderNumber int foreign key references Sales (orderNumber) not null,
	productID int foreign key references Product (productID) not null,
	quantityOrdered smallint not null,
	price money not null,
);

alter table SalesOrderLine
add primary key nonclustered (salesOrderLineNumber, orderNumber);

create table GamePlay
(
	customerID int primary key not null,
	winFlag bit null,
	timesWon smallint null,
	lastPlayed datetime null
);

alter table GamePlay
add constraint FK_GamePlay_customerID
	foreign key (customerID)
	references Customer(customerID);

create view vSalesOrderLine_Totals
as

select SalesOrderLine.salesOrderLineNumber, Sum(SalesOrderLine.quantityOrdered * SalesOrderLine.price) as lineTotal
from SalesOrderLine
	join Sales
	on SalesOrderLine.orderNumber = Sales.orderNumber
where Sales.orderShipped = 'true'
group by SalesOrderLine.salesOrderLineNumber;


--select customerID, lastPlayed
--from GamePlay
--where lastPlayed = GETDATE()
--;

create nonclustered index idk_customerIDlastPlyed
	on dbo.GamePlay
(
	customerID
	, lastPlayed ASC
);

--Select Customer.customerID, Customer.custFName, Customer.custLName, CustomerPassword.passwordHash, CustomerPassword.passwordSalt
--from Customer
--	join CustomerPassword
--	on Customer.customerID = CustomerPassword.customerId;

create nonclustered index idk_Customer_customerIDcustFNamecustLName
	on dbo.Customer
(
	customerID ASC,
	custFName ASC,
	CustLName ASC
);

create nonclustered index idk_CustomerPassword_passwordHashpasswordSalt
	on dbo.CustomerPassword
(
	passwordHash,
	passwordSalt
);

/*
select productNum, price, color, quantity, productPhotoThumb
from Product
*/

create nonclustered index idk_Product_productNumPriceColorProductPhotoThumb
	on dbo.Product
(
	productNum ASC
	, price ASC
	, color
);

