


--Task 1
create procedure TEST 
AS
create table #EmployeeBonus(
EmployeeID INT PRIMARY KEY,
FullName NVARCHAR(50),
Department NVARCHAR(50),
 Salary DECIMAL(10,2),
 BonusAmount DECIMAL(10,2) )

 insert into  #EmployeeBonus
select E.EmployeeID , 
       CONCAT(FirstName,' ',LastName) as FullName,
	   E.Department,
	   E.Salary,(e.Salary*D.BonusPercentage/100) as BonusAmount  from Employees as E
inner join DepartmentBonus as D
on E.Department=D.Department

select * from #EmployeeBonus

Exec TEST

--Task 2


CREATE PROCEDURE UpdateDepartmentSalaries
    @DepartmentName NVARCHAR(50),
    @IncreasePercentage DECIMAL(5,2)
AS
BEGIN
    
    UPDATE Employees
    SET Salary = Salary * (1 + @IncreasePercentage / 100)
    WHERE Department = @DepartmentName;

    SELECT * FROM Employees
    WHERE Department = @DepartmentName;
END;

EXEC UpdateDepartmentSalaries 'Sales', 10;


--Task 3 



MERGE INTO Products_Current AS Target
USING Products_New AS Source
ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN
    UPDATE SET 
        Target.ProductName = Source.ProductName,
        Target.Price = Source.Price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (Source.ProductID, Source.ProductName, Source.Price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

SELECT * FROM Products_Current;


--Task 4



SELECT id,
       CASE
           WHEN p_id IS NULL THEN 'Root'
           WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
           ELSE 'Inner'
       END AS Type
FROM Tree



--Task 5




SELECT 
    s.user_id,
    COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END), 0) * 1.0 
    / COALESCE(COUNT(c.action), 0) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c ON s.user_id = c.user_id
GROUP BY 
    s.user_id;



--Task 6



Select * from  employees
where salary =(Select min(Salary) from  employees
)



--Task 7




create procedure GetProductSalesSummary @ProductID INT
as 
begin 
select P.ProductName ,SUM(s.Quantity), SUM(s.Quantity * p.Price), MIN(s.SaleDate), MAX(s.SaleDate)
 from Products as P
left join Sales as S
on P.ProductID=S.ProductID
where P.ProductID=@ProductID
group by  P.ProductName
end 


EXEC GetProductSalesSummary @ProductID = 1;
