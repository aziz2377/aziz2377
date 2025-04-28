
Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))


insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')


insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

Select Person.firstName,Person.lastName,Address.city,Address.state from Person
left join Address
on Person.personId=Address.personId



Create table Employee (id int, name varchar(255), salary int, managerId int)

insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

Select E.name as Employee from Employee as E
inner Join Employee as M
on E.managerId=M.id and E.salary>m.salary


Create table  Person (id int, email varchar(255)) 

insert into Person (id, email) values ('1', 'a@b.com') 
insert into Person (id, email) values ('2', 'c@d.com') 
insert into Person (id, email) values ('3', 'a@b.com')

Select P.email as Email from Person  P
inner join Person  M
on P.id<M.id and P.email=M.email 


create table Person (id int, email varchar(255)); 
insert into Person (id, email) values 
(1,'john@example.com'),
(2,'bob@example.com'),
(3,'john@example.com')


Select P.email as Email from Person  P
inner join Person  M
on P.id<M.id and P.email<>M.email 


CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  

Select distinct g.Parentname from girls g
where g.Parentname not in (select)


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

Select distinct g.Parentname from girls g
where g.Parentname not in ( SELECT DISTINCT b.ParentName
    FROM boys b
);





CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

Select isnull(Cart1.Item,'') as ItemCart1,isnull(Cart2.Item,'') as ItemCart2 from Cart2
full join Cart1
on Cart1.Item=Cart2.Item
order by ItemCart1 desc



create table match1 (MatchID int, Match varchar(30), Score varchar(5))
insert into match1 values 
		      (1,'Italy-Spain','2:0'),
              (2,'Spain-France','2:1'),
              (3,'France-Belgium','0:0'),
              (4,'Belgium-Spain','2:2'),
              (5,'Belgium-Italy','0:3'),
              (6,'Italy-France','2:0');

Select * from match1


SELECT MatchID, Match, Score,
    CASE 
        WHEN CAST(SUBSTRING(Score, 1, CHARINDEX(':', Score) - 1) AS INT) > 
		CAST(SUBSTRING(Score, CHARINDEX(':', Score) + 1, LEN(Score)) AS INT) 
       
	   THEN LEFT(Match, CHARINDEX('-', Match) - 1)
        
        WHEN CAST(SUBSTRING(Score, 1, CHARINDEX(':', Score) - 1) AS INT) 
           < CAST(SUBSTRING(Score, CHARINDEX(':', Score) + 1, LEN(Score)) AS INT) 
        THEN 
            SUBSTRING(Match, CHARINDEX('-', Match) + 1, LEN(Match))
        
        ELSE 'Draw'
    END AS Result
FROM match1;


Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)

insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')

insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

Select Customers.name as Customers  from Customers
left join Orders
on Customers.id=Orders.id
where Orders.id is null


Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))


insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')


insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')



insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')


Select Students.student_id,Students.student_name,Subjects.subject_name,count(Examinations.subject_name) as attended_exams from Students
cross join Subjects
left join  Examinations
on Examinations.student_id=Students.student_id and Subjects.subject_name=Examinations.subject_name
group by Students.student_id,Students.student_name,Subjects.subject_name
order by Students.student_id,Subjects.subject_name



