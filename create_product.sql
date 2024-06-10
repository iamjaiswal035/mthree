show databases;
use sys;


create table Products (
ProductID int not null primary key,
ProductName varchar(25) not null,
price float not null
)