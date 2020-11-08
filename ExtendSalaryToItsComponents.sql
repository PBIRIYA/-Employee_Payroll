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
select salary from employee_payroll where Fname = 'Bill';
select * from employee_payroll where startd between '2018-01-01' and GETDATE();

--UC4
select salary from employee_payroll where Fname = 'Bill';

--UC5
select * from employee_payroll where startd between '2018-01-01' and GETDATE();

--UC6
Alter table employee_payroll
Add Gender char;
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'employee_payroll';
update employee_payroll set Gender = 'M' where Fname = 'Bill' or Fname = 'Charlie';
update employee_payroll set Gender = 'F' where Fname = 'Terissa';
select * from employee_payroll;

--UC7
select SUM(salary) from employee_payroll
where Gender = 'M'
group by Gender;
select AVG(salary), Gender from employee_payroll
group by Gender;
select MIN(salary), Gender from employee_payroll
group by Gender;
select MAX(salary), Gender from employee_payroll
group by Gender;
select COUNT(Gender), Gender from employee_payroll
group by Gender;

--UC8
select * from employee_payroll;
ALTER TABLE EMPLOYEE_PAYROLL ADD PHONE_NUMBER VARCHAR(25);
ALTER TABLE EMPLOYEE_PAYROLL ADD DEPARTMENT VARCHAR(25)
SELECT * FROM employee_payroll
ALTER TABLE EMPLOYEE_PAYROLL ADD ADDRESS VARCHAR(150)NOT NULL DEFAULT 'INDIA';
ALTER TABLE EMPLOYEE_PAYROLL ADD CONSTRAINT DF_ADDRESS DEFAULT 'INDIA' FOR ADDRESS
SELECT * FROM EMPLOYEE_PAYROLL;
 INSERT into employee_payroll (Fname, salary, startd) values
('Billi',20000.00,'2018-04-07');
INSERT into employee_payroll (Fname, salary, startd) values
('Billi',20000.00,'2018-04-07');
insert into employee_payroll(Fname, salary, gender, startd) values
('Mohan',250000.00,'M','2019-10-10');

--UC9
alter table employee_payroll add deduction float, taxable_pay real, income_tax real, net_pay real
EXEC sp_rename 'employee_payroll.salary', 'basic_pay', 'COLUMN';
