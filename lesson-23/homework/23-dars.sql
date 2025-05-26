

--Task 1

Select *, CASE 
    WHEN MONTH(dt) < 10 THEN CONCAT('0', MONTH(dt))
    ELSE CAST(MONTH(dt) AS CHAR)
  END AS  MonthPrefixedWithZero   from Dates


--Task 2



;with cte as (Select  Id  ,rID,max(Vals) as MaxVals  from MyTabel 
group by Id,rID )

select COUNT(distinct Id) as Distinct_Ids  ,rID,Sum(MaxVals) as TotalOfMaxVals  from cte
group by rID




--Task 4


SELECT *
FROM TestMaximum t
WHERE Vals = (
    SELECT MAX(Vals)
    FROM TestMaximum
    WHERE ID = t.ID
)





--Task 5

SELECT Id, SUM(MaxVal) AS SumOfMax
FROM (
    SELECT Id, DetailedNumber, MAX(Vals) AS MaxVal
    FROM SumOfMax
    GROUP BY Id, DetailedNumber
) AS max_per_group
GROUP BY Id;


CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

--Task 6

SELECT 
    Id, 
    a, 
    b, 
    CASE 
        WHEN a - b = 0 THEN '' 
        ELSE CAST(a - b AS VARCHAR)
    END AS OUTPUT
FROM TheZeroPuzzle;




--Task 7
Select sum(QuantitySold*UnitPrice) as TotalRevenue from Sales



--Task 8
Select avg(UnitPrice) as AvgPrice from Sales

--Task 9
SELECT COUNT(*) AS TotalTransactions
FROM Sales;

--TAsk 10



SELECT MAX(QuantitySold) AS MaxUnitsSold
FROM Sales

--TAsk 11
Select Category,sum(QuantitySold) SumSold from Sales
group by Category



--Task 12
Select Region,sum(QuantitySold*UnitPrice) as TotalRev from Sales
group by Region


--Task 13

SELECT TOP 1
    Product,
    SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM 
    Sales
GROUP BY
    Product
ORDER BY
    TotalRevenue DESC;


--Task 14

Select s1.SaleID,
       s1.SaleDate,
	   (s1.QuantitySold*s1.UnitPrice) as revenue,
	   (Select Sum(QuantitySold*UnitPrice) FRom Sales as S2
	   where s2.SaleDate<=s1.SaleDate) as runningtotal
		
from Sales as s1
order by s1.SaleDate


--Task 15


SELECT
    category,
    sum (QuantitySold*UnitPrice) as Revenue ,
    ROUND(100.0 * SUM(QuantitySold*UnitPrice) / (SELECT SUM(QuantitySold*UnitPrice) FROM sales), 2) AS percentage_of_total
FROM sales
GROUP BY category
ORDER BY Revenue DESC;





--Task 17
Select s.SaleID,c.CustomerName from Customers as C
join Sales as S
on c.CustomerID=s.CustomerID

--TAsk 18

Select c.CustomerID,c.CustomerName from Customers as C
 left join Sales as S
on c.CustomerID=s.CustomerID
where c.CustomerID is null


--TAsk 19
Select c.CustomerName, sum(s.QuantitySold*s.UnitPrice) as Revenue from Customers as C
join Sales as S
on c.CustomerID=s.CustomerID
group by c.CustomerName
ORDER BY Revenue DESC;

--Task 20

;with cte as (Select  c.CustomerName, 
        sum(s.QuantitySold*s.UnitPrice) as Revenue,
		ROW_NUMBER() over (order by sum(s.QuantitySold*s.UnitPrice) desc) as rankrev
		from Customers as C
join Sales as S
on c.CustomerID=s.CustomerID
group by c.CustomerName)

Select CustomerName,Revenue from cte
where rankrev=1
group by CustomerName,Revenue


--TAsk 21
Select c.CustomerName, sum(s.QuantitySold*s.UnitPrice) as totalsales from Customers as C
left join Sales as S
on c.CustomerID=s.CustomerID
group by c.CustomerName
ORDER BY totalsales DESC;



--Task 22
Select DISTINCT P.* from Products AS p
JOIN Sales AS S
ON P.ProductName=S.Product


--Task 23



Select ProductName,CostPrice  from Products 
where CostPrice =(Select max(CostPrice)  from Products )

--Task 24
Select Category,SellingPrice  from Products p
where SellingPrice >(Select avg(SellingPrice)  from Products
where Category=p.Category)
