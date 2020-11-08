CREATE DATABASE payroll_service
USE payroll_service;
SELECT DB_NAME()

--UC2
create table employee_payroll
(
ID int identity(1,1),
Fname varchar(25) not null,
Salary money not null,
startd date not null
);