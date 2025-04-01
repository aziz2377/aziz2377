--Basic-Level Tasks (10)

CREATE DATABASE Homework2;
CREATE TABLE Employees1 (EmpID int,Name VARCHAR(50), Salary DECIMAL(10,2)); --Step 1
INSERT INTO Employees1 (EmpID,Name,Salary)                                  --Step 2
values (1,'Aziz',30000),
       (2,'Azim',25000),
	   (3,'Xurshid',35000);

	   
	   
SELECT * FROM Employees1

UPDATE Employees1 SET Salary=40000 where Empid=1                             --Step 3
DELETE FROM Employees1 WHERE EmpID=2                                         --Step 4

--DROP TABLE Employees1                                                      --Step 5
--TRUNCATE TABLE Employees1                                                  --Step 6
ALTER TABLE Employees1 Add Department VARCHAR(50)                            --Step 7

ALTER TABLE  Employees1 ALTER COLUMN SALARY FLOAT;                           --Step 8

CREATE TABLE Departments (DepartmentID INT, DepartmentName  VARCHAR(50));    --Step 9

 SELECT * FROM Departments

 TRUNCATE TABLE Employees1                                                       --Step 10

 INSERT INTO Departments (DepartmentID,DepartmentName)
VALUES (1,'HR'),
 (2,'Finance'),
 (3,'Sales and Marketing'),
 (4,'Product Development'),
 (5,'Management');

 drop table Departments


-- Intermediate-Level Tasks (6)

 CREATE TABLE Departments (DepartmentID INT, DepartmentName  VARCHAR(50));   --Step 11
 INSERT INTO Departments (DepartmentID,DepartmentName)
VALUES (1,'HR'),
 (2,'Finance'),
 (3,'Sales and Marketing'),
 (4,'Product Development'),
 (5,'Management');

UPDATE Employees1
SET Department = 'Management'
WHERE Salary > 5000;                                                           --Step 12

ALTER TABLE Employees1 DROP COLUMN Department;                                 --Step 14

EXEC sp_rename 'Employees1', 'StaffMembers';

SELECT * FROM StaffMembers                                                     --Step 15

 SELECT * FROM Departments

 DROP TABLE Departments;                                                      --Step 16


 --Advanced-Level Tasks (9)


  CREATE TABLE Products                                                       --Step 17
(ProductID INT,
ProductName VARCHAR(50), 
Category VARCHAR(50),
Price DECIMAL(10,2));

ALTER TABLE Products                                                       --Step 18
ADD CONSTRAINT chk_Price_Positive CHECK (Price > 0);

ALTER TABLE Products                                                         --Step 19
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';             --Step 20

INSERT INTO Products (ProductID,ProductName,ProductCategory,Price,StockQuantity)  --Step 21
Values (1,'Hoodie','Clothes',25,45),
       (2,'T-shirt','Clothes',20,35),
	   (3,'Apple','Fruit',15,25),
	   (4,'Banana','Fruit',20,25),
	   (5,'Potato','Vegetable',10,20);

	    SELECT * INTO Products_Backup                                              --Step 22
FROM Products;

EXEC sp_rename 'Products', 'Inventory';                                           --Step 23

SELECT * FROM Products;

ALTER TABLE Inventory drop constraint chk_Price_Positive ;  
ALTER TABLE Inventory ALTER COLUMN Price FLOAT                                --Step 24

ALTER TABLE Inventory ADD  ProductCode INT iDENTITY(1000,5);                  --Step 25
SELECT * FROM Inventory;
