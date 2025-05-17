




--Task 1

CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(10,2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)

Select 
S.ProductID,
sum(S.Quantity) as TotalQuantity,
Sum(P.Price*S.Quantity) as TotalRevenue  
from  Sales as S
inner join  Products as P
on S.ProductID =P.ProductID
where MONTH(S.SaleDate)=MONTH(GETDATE()) and
      year(S.SaleDate)=year(GETDATE())

group by  S.ProductID


--TAsk 2

Create view vw_ProductSalesSummary as

Select P.ProductID, p.ProductName, p.Category,Sum(S.quantity) as TotalQuantitySold
from  Products as P
left join  Sales as S
on P.ProductID=S.ProductID
group by P.ProductID, p.ProductName , p.Category

--Task 3

create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns table
as
return(Select Sales.ProductID,Sum(Products.Price*Sales.Quantity) as TotalRevenue   from Sales  
inner join Products 
on Sales.ProductID=Products.ProductID
where Sales.ProductID=@ProductID
group by Sales.ProductID)

SELECT * FROM dbo.fn_GetTotalRevenueForProduct(1);

--TAsk 4

create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table
as
return(Select 
P.ProductName,
sum(S.Quantity) as TotalQuantity,
Sum(P.Price*S.Quantity) as TotalRevenue  
from  Sales as S
inner join  Products as P
on S.ProductID =P.ProductID
where P.category=@Category
group by  P.ProductName
);


SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

--Task 5



CREATE FUNCTION fn_IsPrime(@num INT)
RETURNS VARCHAR(3)
AS
BEGIN
    declare @number int =23
declare @inc int = 2
declare @checker int

while @inc < @number
  begin
    if @number % @inc != 0
      begin
        set @checker = 1
        set @inc = @inc + 1
      end
    else
      begin
        set @checker = 0
        break
      end
  end
if @checker = 0
  begin
    print 'No'
  end
else
  begin
      print 'Yes'
  end



SELECT dbo.fn_IsPrime(7) AS Result;  -- Natija: 'Yes'
SELECT dbo.fn_IsPrime(10) AS Result; -- Natija: 'No'



--Task 6



CREATE FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
RETURNS TABLE
AS
RETURN (
    SELECT Number
    FROM (VALUES (1), (2), (3), (4), (5), (6)) AS t(Number)
    WHERE number BETWEEN @Start AND @End
);

SELECT * FROM dbo.fn_GetNumbersBetween(2, 5);

--TAsk 7
create table Employess(id int ,Salary decimal(10,2))

insert into Employess values
(1,100),(2,200),(3,300)
select * from  Employess

create function  getNthHighestSalary(@Salary int )
returns int 
as
begin
return(select max(Salary) from  Employess as E1
where @Salary = (select count(Salary) from Employess as E2 where E1.Salary <= E2.Salary ))
end;

Select dbo.getNthHighestSalary(2)





--TAsk 8



;with F1 as (select count(*) as NumFriends from (
select requester_id from Friendship
union all
select accepter_id from Friendship
) as A
group by A.requester_id),
F2 as (Select * from F1
where NumFriends in  (select max(NumFriends)from F1))
select * from F2


--TAsk 9

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers





CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name;


--Task 10




SELECT g.RowNumber, filled.TestCase
FROM Gaps g
OUTER APPLY (
    SELECT TOP 1 TestCase
    FROM Gaps g2
    WHERE g2.RowNumber <= g.RowNumber AND g2.TestCase IS NOT NULL
    ORDER BY g2.RowNumber DESC
) AS filled;


