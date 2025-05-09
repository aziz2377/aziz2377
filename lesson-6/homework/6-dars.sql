CREATE TABLE InputTbl ( col1 VARCHAR(10), 
                        col2 VARCHAR(10) );

INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'), 
('a', 'b'), 
('b', 'a'), 
('c', 'd'),
('c', 'd'), 
('m', 'n'),
('n', 'm');


select distinct col1, col2 from InputTbl                           --Step 1



select * from InputTbl



CREATE TABLE TestMultipleZero ( A INT NULL,                          --Step 2
                                B INT NULL, 
								C INT NULL, 
								D INT NULL );

INSERT INTO TestMultipleZero(A,B,C,D) VALUES 
(0,0,0,1), 
(0,0,1,0),
(0,1,0,0), 
(1,0,0,0), 
(0,0,0,0), 
(1,1,1,0);

SELECT *
FROM TestMultipleZero
WHERE A <> 0 OR B <> 0 OR C <> 0 OR D <> 0;


select * from TestMultipleZero



create table section1(id int, 
                      name varchar(20)) 
insert into section1 values 
(1, 'Been'),
(2, 'Roma'),
(3, 'Steven'),
(4, 'Paulo'), 
(5, 'Genryh'),
(6, 'Bruno'), 
(7, 'Fred'), 
(8, 'Andro');



select * from section1                    --step 3
where iif(id % 2=1,1,0)=1 


SELECT *                                                --Step 4
FROM section1 
WHERE id = (SELECT MIN(id) FROM section1);
   
SELECT top 1  id,name                                         --Step 4
FROM section1   
order by id asc

SELECT *                                                 --Step 5
FROM section1 
WHERE id = (SELECT Max(id) FROM section1);

SELECT top 1  id,name                                         --Step 4
FROM section1   
order by id desc


SELECT *                                                 --Step 6
FROM section1 
where name like 'B%'



CREATE TABLE ProductCodes ( Code VARCHAR(20) );

INSERT INTO ProductCodes (Code) VALUES 
('X-123'), 
('X_456'), 
('X#789'),
('X-001'),
('X%202'), 
('X_ABC'), 
('X#DEF'), 
('X-999');

select * from ProductCodes


select * from ProductCodes                                --Step 7
where Code like '%X_%' escape 'X';
