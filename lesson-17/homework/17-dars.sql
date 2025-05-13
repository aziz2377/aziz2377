
--Task 1

CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);

INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

with AllREgions as (
select distinct Region from #RegionSales),
AllDistributors as (
select distinct Distributor from #RegionSales)

Select r.Region, 
    d.Distributor, 
    COALESCE(s.Sales, 0) AS Sales from AllREgions as R
cross join AllDistributors as D
left join  #RegionSales s
on R.Region=S.Region and D.Distributor=S.Distributor
order by d.Distributor

--TAsk 2
CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

SELECT 
    m.id AS ManagerID,
    m.Name AS ManagerName,
    COUNT(e.id) AS DirectReportCount
FROM Employee e
JOIN Employee m ON e.ManagerID = m.id
GROUP BY m.id, m.Name
HAVING COUNT(e.id) >= 5;
--TAsk3 

CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);

INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');

INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

Select P.product_name,sum(o.unit) as unit from Products as P
inner join Orders as O
on p.product_id=o.product_id
where month(o.order_date)=2
group by P.product_name
having sum(o.unit)>=100


--TAsk 4

CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  Order_Count    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');


WITH VendorCounts AS (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID, Vendor
),
MaxVendor AS (
    SELECT 
        CustomerID,
        MAX(OrderCount) AS MaxCount
    FROM VendorCounts
    GROUP BY CustomerID
)
SELECT 
    vc.CustomerID,
    vc.Vendor,
    vc.OrderCount
FROM VendorCounts vc
JOIN MaxVendor mv
  ON vc.CustomerID = mv.CustomerID AND vc.OrderCount = mv.MaxCount
ORDER BY vc.CustomerID;


--Task 5
DECLARE @Check_Prime INT = 91;
@isprime = 1
while
if (@Check_Prime % @i=0)=>@isprime=0



DECLARE @Check_Prime INT = 91;  
DECLARE @IsPrime BIT = 1;      
DECLARE @i INT = 2;

IF @Check_Prime <= 1
BEGIN
    SET @IsPrime = 0;
END
ELSE
BEGIN
    WHILE (@i * @i <= @Check_Prime)
    BEGIN
        IF (@Check_Prime % @i = 0)
        BEGIN
            SET @IsPrime = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END
END

IF @IsPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';


--Task 6

CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');


WITH LocationCounts AS (
  SELECT Device_id, Locations, COUNT(*) AS Signal_Count
  FROM Device
  GROUP BY Device_id, Locations
),
RankedLocations AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY Signal_Count DESC) AS rn
  FROM LocationCounts
),
DistinctLocations AS (
  SELECT Device_id, COUNT(DISTINCT Locations) AS Num_Locations
  FROM Device
  GROUP BY Device_id
),
TotalSignals AS (
  SELECT Device_id, COUNT(*) AS Total_Signals
  FROM Device
  GROUP BY Device_id
)

SELECT d.Device_id,
       dl.Num_Locations,
       rl.Locations AS Most_Signals_Location,
       ts.Total_Signals
FROM DistinctLocations dl
JOIN TotalSignals ts ON dl.Device_id = ts.Device_id
JOIN (
  SELECT Device_id, Locations
  FROM RankedLocations
  WHERE rn = 1
) rl ON dl.Device_id = rl.Device_id
JOIN Device d ON d.Device_id = dl.Device_id
GROUP BY d.Device_id, dl.Num_Locations, rl.Locations, ts.Total_Signals
ORDER BY d.Device_id;



--Task 7
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

Select E.EmpID,E.EmpName,E.Salary from  Employee as E
inner join (Select DeptID,AVG(Salary) as AvgSalary from  Employee
group by DeptID) as M
on e.DeptID=m.DeptID and e.Salary>m.AvgSalary
order by E.EmpID asc

--Task 8

WITH TicketCounts AS (
  SELECT TicketID, COUNT(*) AS Total_Numbers
  FROM Tickets
  GROUP BY TicketID
),
MatchingCounts AS (
  SELECT t.TicketID, COUNT(*) AS Match_Count
  FROM Tickets t
  JOIN WinningNumbers w ON t.Number = w.Number
  GROUP BY t.TicketID
),
TicketResults AS (
  SELECT 
    tc.TicketID,
    COALESCE(mc.Match_Count, 0) AS Match_Count,
    tc.Total_Numbers,
    CASE 
      WHEN COALESCE(mc.Match_Count, 0) = tc.Total_Numbers AND tc.Total_Numbers > 0 THEN 100
      WHEN COALESCE(mc.Match_Count, 0) > 0 THEN 10
      ELSE 0
    END AS Winnings
  FROM TicketCounts tc
  LEFT JOIN MatchingCounts mc ON tc.TicketID = mc.TicketID
)

SELECT SUM(Winnings) AS Total_Winnings
FROM TicketResults;




--Task 9
CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

WITH UserPlatform AS (
  SELECT Spend_date, User_id,
         MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS Used_Mobile,
         MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS Used_Desktop
  FROM Spending
  GROUP BY Spend_date, User_id
),
UserCategory AS (
  SELECT Spend_date, User_id,
         CASE 
           WHEN Used_Mobile = 1 AND Used_Desktop = 1 THEN 'Both'
           WHEN Used_Mobile = 1 AND Used_Desktop = 0 THEN 'Mobile_Only'
           WHEN Used_Mobile = 0 AND Used_Desktop = 1 THEN 'Desktop_Only'
         END AS Platform_Type
  FROM UserPlatform
),
UserSpending AS (
  SELECT Spend_date, User_id, SUM(Amount) AS Amount
  FROM Spending
  GROUP BY Spend_date, User_id
)
SELECT 
  u.Platform_Type,
  u.Spend_date,
  COUNT(*) AS Total_Users,
  SUM(s.Amount) AS Total_Amount
FROM UserCategory u
JOIN UserSpending s 
  ON u.User_id = s.User_id AND u.Spend_date = s.Spend_date
GROUP BY u.Spend_date, u.Platform_Type
ORDER BY u.Spend_date, u.Platform_Type;


--TAsk 10

CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

Select * from Grouped


with cte as (
select Product,1 as Quantity from Grouped
union all
select cte.Product,cte.Quantity + 1 from Grouped as A
inner join cte on cte.Product = A.Product and cte.Quantity < A.Quantity)
select cte.Product,1 as Quantity from cte
order by cte.Product
