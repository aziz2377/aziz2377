

CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);



--Easy Tasks

--Task 1

create table NUMBERS ( ID INT PRIMARY KEY)
;WITH NUMBCTE AS (
SELECT 1 AS N
UNION ALL
SELECT N + 1
FROM NUMBCTE
WHERE N < 1000
)
INSERT INTO NUMBERS (ID)
SELECT N
FROM NUMBCTE
OPTION (MAXRECURSION 1000)
SELECT * FROM NUMBERS;

--Task 2
Select E.FirstName,E.LastName,S.SumAmount from Employees as E
join 
(Select EmployeeID,sum(SalesAmount) as SumAmount from Sales
group by EmployeeID) as S
On E.EmployeeID=s.EmployeeID

--Task 3

;with Ecte as (Select Avg(Salary) as AvgSalary from Employees)
select * from  Ecte



--Task 4

Select p.ProductName,S.MaxAmount from Products as P
join (Select ProductID,MAx(SalesAmount) as MaxAmount from Sales
group by ProductID) as S
on P.ProductID=s.ProductID

--Task 5

;with cte as (
  select 0 as first_num, 1 as second_num 
  union all
  select second_num,first_num + second_num from cte
  where first_num < 100)
select first_num from cte


--Task 6
;with Scte as (Select EmployeeID,count(*) as SaleCount from Sales
group by EmployeeID )


Select Employees.EmployeeID,Employees.FirstName  ,Employees.LastName,S.SaleCount from Employees
inner join Scte as S
on Employees.EmployeeID=S.EmployeeID
where  S.SaleCount>5

--Task 7

;with Scte as (Select ProductID,sum(SalesAmount) as TotalAmount  from Sales
group by ProductID )

Select P.ProductID,p.ProductName,s.TotalAmount from Products as P
join Scte as S
on P.ProductID=s.ProductID
where S.TotalAmount>500

--Task 8

;with Ecte as (Select EmployeeID,AVG(Salary) as AvgSalary from Employees
group by EmployeeID)

Select Employees.EmployeeID,Employees.FirstName,Employees.LastName,Ecte.AvgSalary from Employees
cross join Ecte
where Employees.EmployeeID=Ecte.EmployeeID and Employees.Salary>Ecte.AvgSalary



--Medium Tasks

--Task 1

Select  E.FirstName,E.LastName,S.SaleCount from Employees as E
join (Select top 5 EmployeeID,count(*) as SaleCount  from Sales
group by EmployeeID
order by count(*) desc ) as S
On E.EmployeeID=s.EmployeeID

--Task 2

Select p.CategoryID,Sum(s.SumSAle)  AS category_total_sales   from Products as P
join (Select ProductID ,SUM(SalesAmount) as SumSAle from Sales
group by ProductID ) as S
on P.ProductID=s.ProductID
group by CategoryID 






--Task 3

Select * from Numbers1



;with cte as (
	select 1 num, 1 as factorial
	union all
	select (num+1),(num+1) * factorial from cte
	where num+1<10)
select * from cte 
where num in ( select number from Numbers1)







--Task 4

select * from Example

;with cte as (
select id,1 as Pos ,
Substring(String,1,1) as Ch,  String
from Example
union all 
select id, pos+1,
Substring(String,pos+1,1),String
from cte
where Pos<len(String)
)
select * from cte


--Task 5



WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SalesYear,
        MONTH(SaleDate) AS SalesMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
SalesWithDiff AS (
    SELECT 
        SalesYear,
        SalesMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY SalesYear, SalesMonth) AS PreviousMonthSales
    FROM MonthlySales
)
SELECT 
    SalesYear,
    SalesMonth,
    TotalSales,
    PreviousMonthSales,
    TotalSales - ISNULL(PreviousMonthSales, 0) AS SalesDifference
FROM SalesWithDiff
ORDER BY SalesYear, SalesMonth;



--TAsk 6

select A.Quarter,A.EmployeeID,sum(A.Salary) from (
select S.EmployeeID,E.Salary,SaleDate, case when DATEPART(MONTH,SaleDate) in (1,2,3) then 'Q1'
												when DATEPART(MONTH,SaleDate) in (4,5,6) then 'Q2'
												when DATEPART(MONTH,SaleDate) in (7,8,9) then 'Q3'
											else '' end as 'Quarter'
from Employees as E
inner join Sales as S on E.EmployeeID = S.EmployeeID) as A
group by A.Quarter,A.EmployeeID
having sum(A.Salary) > 45000
order by  A.Quarter asc




--Difficult Tasks

----TAsk 1

;with cte as (
	select 0 as first_num, 1 as second_num 
	union all
	select second_num,first_num + second_num from cte
	where first_num < 100)
select first_num from cte

--Task 2

  SELECT *
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND (
        (LEN(Vals) = 2 AND SUBSTRING(Vals, 1, 1) = SUBSTRING(Vals, 2, 1))
     OR (LEN(Vals) = 3 AND SUBSTRING(Vals, 1, 1) = SUBSTRING(Vals, 2, 1) AND SUBSTRING(Vals, 2, 1) = SUBSTRING(Vals, 3, 1))
  );


 --Task 3

 create table Numbers (id int primary key)
 insert into Numbers (id) values (1),(2),(3),(4),(5)
 SELECT * FROM Numbers


WITH RECURSIVE NumberSequence AS (
    -- Anchor: start with '1' as the first number
    SELECT CAST(id AS VARCHAR(255)) AS num, id AS level
    FROM Numbers
    WHERE id = 1  -- Start with the first number
    
    UNION ALL
    
    SELECT CONCAT(num, CAST(level + 1 AS VARCHAR(255))), level + 1
    FROM NumberSequence
    WHERE level < (SELECT MAX(id) FROM Numbers)  -- Limit to n numbers
)
SELECT num
FROM NumberSequence;


 --Task 4


 Select E.FirstName,E.LastName,S.SumAmount from Employees as E
join 
(Select EmployeeID,sum(SalesAmount) as SumAmount from Sales
where SaleDate >= DATEADD(MONTH, -6, GETDATE())
group by EmployeeID) as S
On E.EmployeeID=s.EmployeeID
WHERE SumAmount = (SELECT MAX(SumAmount) FROM 
(Select EmployeeID,sum(SalesAmount) as SumAmount from Sales
where SaleDate >= DATEADD(MONTH, -6, GETDATE())
group by EmployeeID) as Sub)


 --Task 5
  Select * from RemoveDuplicateIntsFromNames

  WITH SplitChars AS (
    SELECT 
        PawanName,
        Pawan_slug_name,
        SUBSTRING(Pawan_slug_name, number, 1) AS CharVal
    FROM RemoveDuplicateIntsFromNames
    JOIN master.dbo.spt_values 
        ON type = 'P' AND number BETWEEN 1 AND LEN(Pawan_slug_name)
),
OnlyDigits AS (
    SELECT 
        PawanName,
        CharVal
    FROM SplitChars
    WHERE CharVal LIKE '[0-9]'
),
CountedDigits AS (
    SELECT 
        CharVal,
        COUNT(*) AS Cnt
    FROM OnlyDigits
    GROUP BY CharVal
    HAVING COUNT(*) > 1  -- faqat takroriy raqamlar qoladi
),
FilteredDigits AS (
    SELECT 
        o.PawanName,
        o.CharVal
    FROM OnlyDigits o
    JOIN CountedDigits c ON o.CharVal = c.CharVal
),
FinalResult AS (
    SELECT 
        r.PawanName,
        r.Pawan_slug_name,
        STRING_AGG(f.CharVal, '') AS CleanedInts
    FROM RemoveDuplicateIntsFromNames r
    LEFT JOIN FilteredDigits f ON r.PawanName = f.PawanName
    GROUP BY r.PawanName, r.Pawan_slug_name
)
-- Natijani ko‘rsatish
SELECT * FROM FinalResult;
