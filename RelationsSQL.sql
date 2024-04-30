

--TASK1
CREATE TABLE Roles
(
Id int IDENTITY PRIMARY KEY,
NAME NVARCHAR(25) NOT NULL
)

CREATE TABLE Users
(
Id Int IDENTITY PRIMARY KEY,
Name NVARCHAR(30) NOT NULL,
Pasword NVARCHAR(50) NOT NULL,
RoleId INT  FOREIGN KEY REFERENCES Roles(Id)
)
INSERT INTO Roles 
VALUES('Admin'),('Moderator'),('User')

INSERT INTO Users 
VALUES ('admin_name','admin_pasword',1),('moderator_name','moderator_pasword',2),('user_name','user_pasword',3)

SELECT * FROM Users as u
INNER JOIN Roles as r 
ON u.RoleId=r.Id


CREATE TABLE Categories 
(
 Id INT PRIMARY KEY,
 Name VARCHAR(50)
)

CREATE TABLE Sizes
(
Id INT PRIMARY KEY,
Name VARCHAR(50)
)


CREATE TABLE Products
(
Id int  PRIMARY KEY,
Name NVARCHAR(20) Not Null,
Price Decimal (8,2),
Cost Decimal(8,2),
CategoryId Int REFERENCES Categories(Id)
)

CREATE TABLE ProductSizes 
(
ProductId INT,
SizeId INT,
FOREIGN KEY (ProductId) REFERENCES Products(Id),
FOREIGN KEY (SizeId) REFERENCES Sizes(Id),
PRIMARY KEY (ProductId, SizeId)
)



INSERT INTO Categories 
VALUES
(1, 'Elektronika'),
(2, 'Geyim'),
(3, 'Avtomobil aksesuarlarý')

INSERT INTO Sizes  
VALUES
(1, 'Balaca'),
(2, 'Orta'),
(3, 'Boyuk')

INSERT INTO Products 
VALUES
(1, 'Telefon', 600, 250, 1),
(2, 'Þalvar', 21, 9, 2),
(3, 'Fara', 30, 15,3)


INSERT INTO ProductSizes  (ProductId, SizeId) VALUES
(1, 1), (1, 2), (1, 3), 
(2, 1), (2, 2), (2, 3), 
(3, 2)

SELECT p.Name AS ProductName, c.Name AS CategoryName, s.Name AS SizeName
FROM Products p
INNER JOIN Categories as c ON p.CategoryId = c.Id
INNER JOIN ProductSizes as ps ON p.Id = ps.ProductId
INNER JOIN Sizes as s ON ps.SizeId = s.Id
