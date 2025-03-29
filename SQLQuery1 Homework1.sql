--EASY
--1 
--Data: Raw facts or figures without context.
--Database: A structured collection of data stored and managed for easy access.
--Relational Database: A type of database that stores data in tables with relationships between them.
--Table: A collection of data organized in rows and columns within a database.
--2
--Data Security: Provides robust security features like encryption, authentication, and access control.
--Scalability: Can handle large volumes of data and scale as needed for growth.
--High Availability: Features like Always On Availability Groups and database mirroring for uptime.
--Data Integrity: Enforces data consistency and integrity through constraints and transactions.
--Advanced Analytics: Supports built-in data analytics, reporting, and integration with tools like Power BI.
--3
--Windows Authentication: Uses Windows credentials to authenticate users.
--SQL Server Authentication: Uses a SQL Server-specific username and password for authentication.




--MEDIUM
CREATE DATABASE SchoolDB
CREATE TABLE Students ( StudentID int, Name varchar(50),Age int)
 SELECT * FROM Students

--SQL Server: A relational database management system (RDBMS) developed by Microsoft for storing and managing data.
--SSMS (SQL Server Management Studio): A tool for managing, configuring, and administering SQL Server databases, 
--providing an interface for writing queries, managing database objects, and monitoring server performance.

--SQL (Structured Query Language): A programming language used to query, update, 
--and manage data in a relational database. It is used within SQL Server to interact with data.

--HARD
INSERT INTO Students ( StudentID, Name, Age)
values (1,'Azizbek',23);
 SELECT * FROM Students

 BACKUP DATABASE  SchoolDB
 TO DISK= 'D:\Aziz\SchoolDB.bak'
 WITH INIT

 RESTORE DATABASE SchoolDB
FROM DISK = 'D:\Aziz\SchoolDB.bak'
WITH REPLACE;


