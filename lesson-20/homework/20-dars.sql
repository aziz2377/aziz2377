
--Task 1

SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.CustomerName = s1.CustomerName
      AND s2.SaleDate >= '2024-03-01'
      AND s2.SaleDate < '2024-04-01'
);


--Task 2


SELECT Product, SUM(Quantity * Price) AS TotalRevenue
FROM #Sales
GROUP BY Product
HAVING SUM(Quantity * Price) = (
    SELECT MAX(TotalRev)
    FROM (
        SELECT SUM(Quantity * Price) AS TotalRev
        FROM #Sales
        GROUP BY Product
    ) AS RevenueByProduct
);



--Task 3



	SELECT MAX(SaleAmount)
FROM (
    SELECT Quantity * Price AS SaleAmount
    FROM #Sales
) AS SaleAmounts
WHERE SaleAmount < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);


--Task 4


SELECT 
  YEAR(SaleDate) AS SaleYear,
  MONTH(SaleDate) AS SaleMonth,
  SUM(Quantity) AS TotalQuantity
FROM #Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)


--Task 5
Select distinct SaleID,CustomerName from #Sales as S1
where exists (Select 1 from #Sales as S2
where s1.CustomerName<>s2.CustomerName and S1.SaleID=s2.SaleID )





--Task 6
Select  name ,
 sum( case when Fruit='Apple' then 1 else 0 end) as Apple,
     sum( case when Fruit='Orange' then 1 else 0 end) as Orange,
	 sum( case when Fruit='Banana' then 1 else 0 end) as Banana
	 from Fruits
group by  name 


--Task 7



;with RecursiveFamily as (
select ParentId as pid,ChildID as chid from  Family

union all

Select rf.PID, f.ChildID from  RecursiveFamily as rf
join Family as f 
on rf.chid=f.ParentId)

Select pid,chid from RecursiveFamily
ORDER BY PID, CHID;


--Task 8



 
Select * from  #Orders
where DeliveryState = 'TX' and CustomerID in (Select CustomerID from #Orders where DeliveryState = 'ca' )




--Task 9



UPDATE r
SET fullname = 
    SUBSTRING(address, 
              CHARINDEX('name=', address) + 5, 
              CHARINDEX(' ', address + ' ', CHARINDEX('name=', address)) - (CHARINDEX('name=', address) + 5))
FROM #residents r
WHERE address LIKE '%name=%'
  AND (fullname IS NULL OR fullname NOT IN ( 
       SUBSTRING(address, 
                 CHARINDEX('name=', address) + 5, 
                 CHARINDEX(' ', address + ' ', CHARINDEX('name=', address)) - (CHARINDEX('name=', address) + 5)) 
  ));
;


--Task 10

;with bekat1 as(
select * from #Routes 
where DepartureCity = 'Tashkent'),
destination as(
select concat(bekat1.DepartureCity,'-',bekat1.ArrivalCity,'-',bekat2.ArrivalCity,'-',bekat3.ArrivalCity,'-',bekat4.ArrivalCity) as route,
    bekat1.cost + bekat2.Cost + isnull(bekat3.Cost,0) + isnull(bekat4.Cost,0) as cost from bekat1
  
join #Routes as bekat2 on bekat1.ArrivalCity = bekat2.DepartureCity
left join #Routes as bekat3 on bekat2.ArrivalCity = bekat3.DepartureCity
left join #Routes as bekat4 on bekat3.ArrivalCity = bekat4.DepartureCity )

select * from destination
where cost in (select min(cost) from destination) or cost in (select max(cost) from destination)


--Task 11


Select id, 
      vals,
     SUM(CASE WHEN Vals = 'Product' THEN 1 ELSE 0 END) OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) as SumVals from #RankingPuzzle



--Task 12


;with Avgcte  as (Select EmployeeName, Department,SalesAmount,avg(SalesAmount) over (partition by Department ) as AvgSales
from #EmployeeSales)

Select EmployeeName,Department,SalesAmount,AvgSales from  Avgcte
where AvgSales<SalesAmount
order by Department


--Task 13




SELECT EmployeeID, EmployeeName, Department, SalesAmount, SalesMonth
FROM #EmployeeSales AS E1
WHERE NOT EXISTS (
    SELECT 1 
    FROM #EmployeeSales AS E2
    WHERE E2.SalesMonth = E1.SalesMonth
      AND E2.SalesAmount > E1.SalesAmount
);



--Task 14 


WITH AllMonths AS (
  SELECT DISTINCT SalesMonth
  FROM #EmployeeSales
)


SELECT DISTINCT E.EmployeeName
FROM #EmployeeSales E
WHERE NOT EXISTS (
    SELECT 1
    FROM AllMonths M
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales ES
        WHERE ES.EmployeeName = E.EmployeeName
          AND ES.SalesMonth = M.SalesMonth
    )
)


 


--Task 15


;with AvgPrice as (Select ProductID,
       Name,
	   Category, 
	   Price,
	   Avg(Price) over (partition by Category) as AvgPrice from Products)

Select * from AvgPrice
where AvgPrice<Price


--Task 16




SELECT Name,Stock
FROM products
WHERE Stock < (
    SELECT MAX(Stock)
    FROM products
);


--Task 17
Select * from products 
where Category=(Select Category from products 
where name='Laptop' ) and name<>'Laptop'

--Task 18


 SELECT name, price,Category
FROM products
WHERE price > (
    SELECT MIN(price)
    FROM products
    WHERE Category = 'Electronics'
);

--Task 19

;with Avgcte as (Select ProductID,name,Category,Price,avg(Price) over (partition by category) as AvgPrice from products)

Select * from Avgcte
where Price>AvgPrice

Select p1.name,p1.Category,p1.Price from products as p1
where p1.Price>(Select avg(p2.Price) from products as p2
where p1.Category=p2.Category )



--Task 20
Select OrderID, ProductID,Quantity from Orders
where Quantity>=1

--Task 21


;with Avgcte as (Select OrderID, ProductID,Quantity,avg(Quantity) over () AvgQuantity from Orders)

Select distinct A.ProductID from Avgcte as A
join Orders as O
on a.ProductID=o.ProductID
where o.Quantity>A.AvgQuantity


--Task 22

SELECT o.OrderID,o.ProductID
FROM Orders o
LEFT JOIN Orders o1 ON o.ProductID = o1.ProductID
WHERE o.ProductID IS NULL;

--Task 23 
Select top 1 ProductID,sum(Quantity) as SumQuantity from Orders
group by ProductID
order by sum(Quantity) desc
