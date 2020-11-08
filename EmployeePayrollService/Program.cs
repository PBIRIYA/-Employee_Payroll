using System;

namespace EmployeePayrollService
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Emplyee Payroll problem!");
            EmployeeRepo repo = new EmployeeRepo();
            repo.GetAllEmployee();
        }
    }
}
