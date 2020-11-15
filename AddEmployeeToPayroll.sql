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

--UC10
UPDATE EMPLOYEE_PAYROLL SET DEPARTMENT = 'SALES' WHERE ID =1;
UPDATE EMPLOYEE_PAYROLL SET DEPARTMENT = 'MARKETING' WHERE ID =2;
insert into employee_payroll (Fname, startd, basic_pay, department) values
('Terissa', '2019-11-13', '200000', 'Sales');
select * from employee_payroll

--UC11
CREATE TABLE EMPLOYEEDEPARTMENT
(
ID INT IDENTITY NOT NULL,
NAME VARCHAR(25) NOT NULL,
DEPARTMENT VARCHAR(25)NOT NULL,
);
INSERT INTO EMPLOYEEDEPARTMENT VALUES
('1','BILL','SALES'),
('2','TERISSA','MARKETING'),
('2','CHARLIE','SALES'),
('3','TERISSA','SALES'),
('1','BILL','MARKETING');

CREATE TABLE EMPLOYEE
(
ID  INT IDENTITY (1,1),
NAME VARCHAR(50)NOT NULL,
GENDER VARCHAR(1)NOT NULL,
PHONENUMBER VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(25)NOT NULL DEFAULT 'INDIA'
);

INSERT INTO employee VALUES
('Bill', 'M', '9424787443', 'MATA MANDIR'),
('Terissa', 'F', '8109322276', 'NEW MARKET'),
('Charlie', 'M', '9926707344', 'TT NAGAR')

create table Payroll
(
Id int not null,
Name varchar(25) not null,
Start date not null,
Basic_pay money not null,
Deduction money,
Taxable_pay money,
Income_tax money,
Net_pay money not null
);

--UC11_insert data in tables
insert into employee values
('Bill', 'M', '9424787443', 'Shanti Nagar'),
('Terissa', 'F', '8109322276', 'Damoh Naka'),
('Charlie', 'M', '9926707344', 'Panchsheel Nagar');

insert into EmployeeDepartment values
(101, 'Sales',1),
(102, 'Sales',2),
(103, 'HR', 3),
(104,'Marketting',2);

insert into Payroll values
(1,'2018-01-03', 100000, 10000, 90000, 1000, 89000),
(2, '2019-11-13', 200000, 10000, 190000,3000,187000),
(3, '2020-05-21', 300000, 20000, 280000, 5000, 275000);

--UC12
--Retrieve all data
select * from ((employee emp inner join Payroll payroll on (emp.Id = payroll.Id)) 
inner join EmployeeDepartment department on (emp.Id = department.EmployeeId))
--retrieve salary information of bill 
select emp.Name, pay.Basic_pay from Payroll pay inner join employee emp
on pay.Id = emp.Id
where emp.Name = 'Bill';
--retrieve employee names who started after 2018
select emp.Name from employee emp left join payroll pay 
on emp.Id = pay.Id
where pay.Start between cast('2018-01-01' as date) and GETDATE();

--Aggregate operationsby gender
--Total of basic pay by gender
select emp.gender, Sum(payroll.Basic_pay)  
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;
--Average of basic pay by gender
select emp.gender, AVG(payroll.Basic_pay)  
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;
--Count number of employees by gender
select gender, Count(Name)  
from employee 
group by gender;
--Minimum salary of male employees
select MIN(payroll.Basic_pay)  
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
where emp.Gender = 'M'
group by gender;
--Maximum salary of male employees
select MAX(payroll.Basic_pay)  
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
where emp.Gender = 'M'
group by gender;

--UC21
--Add procedure to store data
create procedure SpAddEmployeeDetails
(
@EmployeeName varchar(255),
@PhoneNumber varchar(255),
@Address varchar(255),
@Department varchar(255),
@Gender char(1),
@BasicPay float,
@Deductions float,
@TaxablePay float,
@Tax float,
@NetPay float,
@StartDate Date
)
as
begin
insert into employee_payroll values
(
@EmployeeName,@BasicPay,@StartDate,@Gender,@PhoneNumber,@Address,@Department,@Deductions,@TaxablePay,@Tax,@NetPay
)
end
--View Newly Added Records
select * from employee
select * from Payroll