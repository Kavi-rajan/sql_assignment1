USE world;

CREATE table Salespeople (Snum int PRIMARY KEY,Sname varchar(10) UNIQUE,city varchar(15),comm int);
INSERT INTO Salespeople 
VALUES(1001,'Peel','London',12),
(1002,'Serres', 'Sanjose' ,13),
(1004, 'Motika', 'London',11),
(1007, 'Rifkin','Barcelona',15),
(1003,'Axelrod', 'Newyork',10);


CREATE TABLE Customers(Cnum int PRIMARY KEY,Cname VARCHAR(15),city VARCHAR(15) NOT NULL,Snum INT,
FOREIGN KEY(Snum) REFERENCES Salespeople(Snum));

DESCRIBE Customers;

INSERT INTO Customers
VALUES(2001,'Hoffman', 'London' ,1001),
(2002,'Giovanni', 'Rome',1003),
(2003,'Liu', 'Sanjose', 1002),
(2004,'Grass', 'Berlin', 1002),
(2006,'Clemens','London', 1001),
(2008,'Cisneros','Sanjose', 1007),
(2007,'Pereira','Rome',1004);

CREATE TABLE Orders(Onum INT PRIMARY KEY,Amt FLOAT,Odate DATE,Cnum INT,Snum INT,
FOREIGN KEY(Snum) REFERENCES Salespeople(Snum),
FOREIGN KEY(Cnum) REFERENCES Customers(Cnum));

INSERT INTO Orders
VALUES(3001, 18.69,'1990-10-3',2008, 1007),
(3003,767.19,'1990-10-3', 2001, 1001),
(3002, 1900.10,'1990-10-3', 2007, 1004),
(3005,  5160.45,'1990-10-3', 2003, 1002),
(3006,  1098.16, '1990-10-3', 2008, 1007),
(3009, 1713.23,'1990-10-4', 2002, 1003),
(3007, 75.75, '1990-10-4', 2004, 1002),
(3008,  4273.00,'1990-10-5', 2006, 1001),
(3010,  1309.95,'1990-10-6', 2004, 1002),
(3011,  9891.88,'1990-10-6', 2006, 1001);

#1  Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT COUNT(Sname) AS numberOfNamesWithA FROM Salespeople WHERE Sname LIKE 'A%' OR 'a%';
#2  Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT Amt,Sname from Orders 
join Salespeople on orders.Snum=Salespeople.Snum WHERE Amt>2000;
#3 Count the number of Salesperson belonging to Newyork.
SELECT COUNT(Snum) FROM Salespeople WHERE city='Newyork';
#4  Display the number of Salespeople belonging to London and belonging to Paris.
SELECT COUNT(Snum) FROM Salespeople WHERE city='London' OR 'Paris';
#5 Display the number of orders taken by each Salesperson and their date of orders.
SELECT Sname,Onum,Odate FROM Orders JOIN salespeople
on salespeople.snum=orders.snum ;





