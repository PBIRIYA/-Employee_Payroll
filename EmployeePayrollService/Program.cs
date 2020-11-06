using System;

namespace EmployeePayrollService
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Emplyee Payroll problem!");
            EmployeeRepo repo = new EmployeeRepo();
            //EmployeeModel model = new EmployeeModel();
            //repo.GetAllEmployee();
            EmployeeModel employee = new EmployeeModel();
            employee.EmployeeName = "Indal";
            employee.Department = "Tech";
            employee.PhoneNumber = "6302907918";
            employee.Address = "02-Khajauli";
            employee.Gender = 'M';
            employee.BasicPay = 10000.00M;
            employee.Deductions = 1500.00;
            employee.StartDate = employee.StartDate = Convert.ToDateTime("2020-11-03");

            if (repo.AddEmployee(employee))
                Console.WriteLine("Records added successfully");
            Console.ReadKey();
        }
    }
}
