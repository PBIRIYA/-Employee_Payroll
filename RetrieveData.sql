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

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'employee_payroll';
insert into employee_payroll values
('Bill',100000.00,'2018-01-03'),
('Terissa',200000.00,'2019-11-13'),
('Charlie',300000.00,'2020-05-21');
select * from employee_payroll;

--UC4
<<<<<<< HEAD
select Salary from employee_payroll where Fname='Bill';
=======
select Salary from employee_payroll where Fname='Bill';
--UC5
select * from employee_payroll where startd between '2018-01-01' and GETDATE();
>>>>>>> UC5_RetrieveSpecificData
