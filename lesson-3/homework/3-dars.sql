--Easy-Level

--1

--BULK INSERT in SQL Server is used to quickly import large amounts of data from a file 
--(such as a CSV or text file) into a database table. It’s designed for efficiency, allowing 
--the insertion of millions of records in a single operation, which is much faster than using individual 
--`INSERT` statements.
--It provides options to control how the data is formatted and minimizes transaction log usage for faster performance.

--2

--CSV (Comma-Separated Values): A plain text file where data values are separated by commas.

--TXT (Text File): A plain text file where data values are separated by spaces, tabs, or other delimiters.

--XML (eXtensible Markup Language): A markup language file format that can store hierarchical data.

--JSON (JavaScript Object Notation): A lightweight data-interchange format that is easy for both humans and machines to read and write.

--3 

CREATE DATABASE Homework3;
USE Homework3;
CREATE TABLE Products (ProductID INT PRIMARY KEY, 
					   ProductName VARCHAR(50) , 
					   Price DECIMAL(10,2))

--4

INSERT INTO Products (ProductID,ProductName,Price)
VALUES (1,'Apple',10000),
       (2,'Banana',20000),
	   (3,'Tomato',30000);
	   
SELECT * FROM Products

--5
--NULL vs NOT NULL

---NULL: A column can store missing or undefined values (i.e., no value is provided).
--Example: `birth_date DATE` (can be `NULL`).
-- Query: `INSERT INTO employees (name, birth_date) VALUES ('John', NULL);`

--NOT NULL: A column must have a value; it cannot be `NULL`.
--Example: `name VARCHAR(100) NOT NULL` (cannot be `NULL`).
--Query: `INSERT INTO employees (name) VALUES (NULL);`  → This will cause an error.

--Key Difference:
--NULL allows missing values, **NOT NULL** requires values.


--6

ALTER TABLE Products
ADD CONSTRAINT unique_product_name UNIQUE (ProductName);

--7
--This query adds a UNIQUE constraint to the ProductName column in the Products table.
--It ensures that no two products in the table have the same product name.


--8
CREATE TABLE Categories (CategoriesID INT PRIMARY KEY,
						CategoriesName VARCHAR(50) UNIQUE)

SELECT * FROM Categories

--9
--The IDENTITY column in SQL Server automatically generates unique, sequential numbers for each row. It’s commonly used for primary keys.

--Key Points:
--Automatic Increment: Values are generated automatically starting from a specified value and incrementing by a set amount.

--Syntax: column_name INT IDENTITY(start_value, increment_value)

--Purpose: Typically used for primary keys to ensure unique values.


--Medium-Level 

--10

BULK INSERT [Homework3].[dbo].[Products]

FROM 'C:\Users\user\Desktop\AZIZ\BULK\Products.csv'

WITH

(FIRSTROW=5,
ROWTERMINATOR='\n',
FIELDTERMINATOR=';'

)


CREATE TABLE Products (ProductID INT PRIMARY KEY, 
					   ProductName VARCHAR(50) , 
					   Price DECIMAL(10,2)
					   									  	   
					   );
drop table Categories

CREATE TABLE Categories (
	CategoriesID INT PRIMARY KEY,                                       --11
	CategoriesName VARCHAR(50) UNIQUE,
	FOREIGN KEY (CategoriesID) REFERENCES Products(ProductID));

	SELECT * FROM Categories
	SELECT * FROM Products

                                                                        --12
--PRIMARY KEY
--Uniqueness: Ensures values are unique.

--Nullability: Cannot be null.

--Index: Automatically creates a unique index.

--Quantity: Only one per table.

--Example:

--sql

--CREATE TABLE Employees (
   -- EmployeeID INT PRIMARY KEY,
   -- FirstName VARCHAR(50),
    --LastName VARCHAR(50));
--UNIQUE KEY
--Uniqueness: Ensures values are unique.

--Nullability: Allows null values.

--Index: Automatically creates a unique index.

--Quantity: Can have multiple per table.

--Example:

--sql

--CREATE TABLE Employees (
    --EmployeeID INT PRIMARY KEY,
   -- Email VARCHAR(100) UNIQUE,
   -- FirstName VARCHAR(50),
    --LastName VARCHAR(50));
--Key Differences:
--PRIMARY KEY: No nulls, one per table.

--UNIQUE KEY: Allows nulls, multiple per table.


ALTER TABLE Products ADD CONSTRAINT Price CHECK (Price>0)    --13



ALTER TABLE Products ADD Stock INT ;                         --14


SELECT ProductID, ProductName,Price, ISNULL(Stock, '0')+ 500 AS Stock   --15
FROM Products;

SELECT * FROM Products


--16

---A FOREIGN KEY in SQL Server is used to enforce a relationship between two tables and ensure data integrity. It ensures that a value in the child table matches a value in the parent table (usually in the primary key column). 

-- Key Points:
--Purpose: Maintains referential integrity between tables.
--Usage: Links a column in the child table to the primary key of the parent table.
--Cascading: Allows actions like **ON DELETE CASCADE** or **ON UPDATE CASCADE** to automatically update or delete related records.

--Syntax:
--sql
--ALTER TABLE child_table
--ADD CONSTRAINT fk_name
--FOREIGN KEY (child_column)
--REFERENCES parent_table(parent_column)
--ON DELETE CASCADE
--ON UPDATE CASCADE;


--Example:
--sql
--CREATE TABLE Orders (
  -- OrderID INT PRIMARY KEY,
   -- CustomerID INT,
   -- FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));


--This ensures that every `CustomerID` in `Orders` exists in `Customers`.
-- Benefits:
--Data Integrity: Ensures valid data relationships.
--Cascading: Automatically updates or deletes related records when changes happen in the parent table.



--Hard-Level Tasks

CREATE TABLE Customers (CustomerID INT PRIMARY KEY,       --17
                       CustomerName Varchar(50),
					   Age int CHECK (Age>=18));
    
SELECT * FROM Customers


CREATE TABLE Sale (SaleID INT PRIMARY KEY IDENTITY(100,10),  --18
                   SaleName Varchar(50));

SELECT * FROM Sale



CREATE TABLE OrderDetails (                               --19
    OrderID INT  ,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID)  -- Composite Primary Key
);

SELECT * FROM OrderDetails



--20

 --ISNULL vs COALESCE

--Both **`ISNULL`** and **`COALESCE`** are used to handle **NULL** values, but they have key differences:

--ISNULL
--Syntax**: `ISNULL(expression, replacement_value)`
--Purpose**: Replaces **NULL** with a specified value.
--Example**:
  --sql
  --SELECT ISNULL(Salary, 0) AS Salary FROM Employees;
  
  --Replaces NULL in `Salary` with `0`.

--COALESCE
--Syntax**: `COALESCE(expression1, expression2, ..., expressionN)`
--Purpose**: Returns the **first non-NULL** value from a list of expressions.
--Example**:
 --sql
  --SELECT COALESCE(Salary, Bonus, 0) AS SalaryOrBonus FROM Employees;
  
  --Returns the first non-NULL value between `Salary` and `Bonus`, or `0` if both are NULL.

--Key Differences:
--ISNULL**: Only checks 2 values.
--COALESCE**: Can check multiple values and returns the first non-NULL.

--ISNULL is faster for simple cases, while **COALESCE** is more flexible for multiple columns.


CREATE TABLE Employees (EmpID int PRIMARY KEY,        --21
                        NAME VARCHAR(50) UNIQUE);

SELECT * FROM Employees


DROP TABLE Customers


CREATE TABLE Customers (CustomerID INT PRIMARY KEY,        --22
                       CustomerName Varchar(50),
					   Age int CHECK (Age>=18)
					   FOREIGN KEY (CustomerID) REFERENCES Sale(SaleID)  
					   ON DELETE CASCADE
                       ON UPDATE CASCADE );

SELECT * FROM Customers
SELECT * FROM Sale

CREATE TABLE Sale (SaleID INT PRIMARY KEY IDENTITY(100,10),  
                   SaleName Varchar(50));
				   
				   
