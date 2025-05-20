

--Task 1

Select SaleID, 
       ProductName,
	   SaleAmount, 
	   Quantity, 
	   CustomerID,
	   SaleDate,
	   ROW_NUMBER() over (order by SaleDate) as SaleDateNum  
from ProductSales

--Task 2


Select
       ProductName,
	   Sum(Quantity)  as TotalQuantity ,
       Dense_rank() over (Order by Sum(Quantity)) as RankTotalQuantity
from ProductSales
group by  
       ProductName
	  



--Task 3
;with RankedSales  as (Select CustomerID,
       SaleAmount,
	   ROW_NUMBER() over (partition by CustomerID order by Saleamount desc) as RowSaleamount 
from ProductSales
       where  CustomerID = (Select MAX(CustomerID) from ProductSales))

Select * from RankedSales 
where RowSaleamount=1

--Task 4

Select CustomerID,
       SaleAmount,
	   LEAD(SaleAmount) over ( order by SaleDate ) as NextSaleamount ,
	   SaleDate
from ProductSales
       
--Task 5

Select CustomerID,
       SaleAmount,
	   lag(SaleAmount) over ( order by SaleDate ) as PreviousSaleAmount ,
	   SaleDate
from ProductSales


--Task 6

;with cte as (Select 
       CustomerID,
       SaleAmount,
	   lag(SaleAmount) over ( order by SaleDate ) as PreviousSaleAmount ,
	   SaleDate
from ProductSales)

select * from cte
where SaleAmount>PreviousSaleAmount


--Task 7

SELECT 
    ProductName,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PreviousSaleAmount,
    SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DifferenceFromPrevious
FROM ProductSales;



--Task 8

Select CustomerID,
       SaleAmount,
	   LEAD(SaleAmount) over ( order by SaleDate ) as NextSaleamount ,
	  ( (LEAD(SaleAmount) over ( order by SaleDate )-SaleAmount)/SaleAmount )*100 as PercentageChange
from ProductSales


--Task 9
SELECT 
    ProductName,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PreviousSaleAmount,
     SaleAmount / nullif(LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate),0) AS RatioFromPrevious
FROM ProductSales;

--Task 10
Select ProductName,
       SaleAmount,First_value(SaleAmount) over(partition by ProductName order by SaleDate asc) as FirstValue,
       SaleAmount-First_value(SaleAmount) over(partition by ProductName order by SaleDate asc) as Difference
from ProductSales


--Task 11

;with cte as (Select ProductName,
       SaleAmount,
       lag(SaleAmount) over (partition by ProductName order by Saledate asc) as PreviousSaleAmount
from ProductSales)

Select * from cte
where SaleAmount>PreviousSaleAmount


--Task 12
Select SaleID,
       SaleDate,
	   SaleAmount,
	   Sum(SaleAmount) over (order by SaleDate) as RunningTotal 
from ProductSales


--Task 13

Select 
SaleID,
       SaleDate,
	   SaleAmount,
	   avg(SaleAmount) over (order by SaleDate  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as MovingAverage 
from ProductSales

--Task 14

Select 
SaleID,
       SaleDate,
	   SaleAmount,
	   SaleAmount-avg(SaleAmount) over () as DifferenceFromAverage 
from ProductSales




--Task 15

;with RankedSalaries  as (
SELECT 
        Name,
        Department,
        Salary,
		DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1),
RankCounts  as (
Select 
    SalaryRank
	from RankedSalaries
group by SalaryRank
having Count(*)>1)

Select 
    r.Name,
    r.Department,
    r.Salary from RankedSalaries as r
join RankCounts as rn
on R.SalaryRank=rn.SalaryRank


WITH RankedSalaries AS (
    SELECT 
        Name,
        Department,
        Salary,
        DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
),
RankCounts AS (
    SELECT 
        SalaryRank
    FROM RankedSalaries
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
)
SELECT 
    r.Name,
    r.Department,
    r.Salary
FROM 
    RankedSalaries r
JOIN 
    RankCounts rc
ON 
    r.SalaryRank = rc.SalaryRank;

--Task 16
;with cte as (Select  Name,
        Department,
		Salary,
		dense_rank() over (partition by Department order by Salary desc) as RankSalary from Employees1
)

Select Name,Department,Salary,RankSalary from cte
where RankSalary<=2
order by Department,RankSalary


--Task 17
;with cte as (Select  Name,
        Department,
		Salary,
		dense_rank() over (partition by Department order by Salary ) as RankSalary from Employees1
)


Select Name,Department,Salary,RankSalary from cte
where RankSalary=1
order by Department,RankSalary

--Task 18
;with cte as (Select Name,
       Department,
	   Salary,
	   Sum(Salary) over (partition by Department order by Name) as RunningTotal 
from Employees1)

Select Department,sum(RunningTotal)as SumRunningTotal from cte
group by Department




--Task 19
Select distinct
Department,
sum(salary) over (partition by Department) as TotalAmount
from Employees1


--Task 20


Select distinct
Department,
avg(salary) over (partition by Department) as TotalAmount
from Employees1



--Task 21

SELECT
    Name,
    Department,
    Salary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS SalaryDifference
FROM Employees1;



--Task 22



SELECT 
    Name,
    Department,
    Salary,
    AVG(Salary) OVER (
        ORDER BY HireDate
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS MovingAverage
FROM Employees1
ORDER BY HireDate, Name;



--Task 23

;with cte as (Select Name,Department,Salary,HireDate,  ROW_NUMBER() OVER (ORDER BY HireDate DESC) as RowNum
from Employees1)

Select RowNum,HireDate,Sum(Salary) as LastHired from cte
where RowNum<=3
group by RowNum,HireDate
