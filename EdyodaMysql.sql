create database assignement;
use assignement;
create table SalesPerson(Snum int,Sname varchar(50),City varchar(30),Comm int,unique(Sname),primary key(Snum));
insert into SalesPerson(Snum,Sname,City,Comm) values (1001,'Peel','London',12),(1002,'Serres','Sanjos',13),(1004,'Motika','London',11),(1007,'Rifkin','Barcelona',15),(1003,'Axelrod','Newyork',10);
select * from SalesPerson;
create table Customers(Cnum int,Cname varchar(30),City varchar(50),Snum int);
insert into Customers (Cnum,Cname,City,Snum) values (2001,'Hoffman','London',1001),(2002,'Giovanni','Rome',1003),(2003,'Liu','Sanjose',1002),(2004,'Grass','Berlin',1002),(2006,'Clemens','London',1001),(2008,'Cisneros','Sanjose',1007),(2007,'Pereira','Rome',1004);
select * from Customers;
create table Orders(Onum int, Amt float,Odate varchar(20),Cnum int,Snum int);
alter table Orders add foreign key (Snum) references SalesPerson(Snum);
alter table Customers add foreign key (Snum) references SalesPerson(Snum);

insert into Orders (Onum,Amt,Odate,Cnum,Snum)
values
(3001,18.69,'3-10-1990',2008,1007),
(3003,767.19,'3-10-1990',2001,1001),
(3002,1900.10,'3-10-1990',2007,1004),
(3005,5160.45,'3-10-1990',2003,1002),
(3006,1098.16,'3-10-1990',2008,1007),
(3009,1713.23,'4-10-1990',2002,1003),
(3007,75.75,'4-10-1990',2004,1002),
(3008,4273.00,'5-10-1990',2006,1001),
(3010,1309.95,'6-10-1990',2004,1002),
(3011,9891.88,'6-10-1990',2006,1001);


-- Question one

select * from SalesPerson where Sname like 'a%' or Sname like ('A%'); 

-- Question two

select S.Sname,O.amt from SalesPerson as S inner join Orders as O on O.Snum = S.Snum where O.amt>2000;
-- Question Three

select count(Sname) from SalesPerson where city = "Newyork";

-- Question Four

 select Sname from SalesPerson where City in ('London','Paris');
 
-- Question Five
select S.Sname,O.Onum,O.Odate from SalesPerson as S inner join Orders as O on O.Snum = S.Snum;