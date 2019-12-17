using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for UserControlEmp.xaml
    /// </summary>
    public partial class UserControlEmp : UserControl
    {
        Employees Employee;
        Controller mycontroller;
        public UserControlEmp(Employees E)
        {
            InitializeComponent();
            Employee = E;
            mycontroller = new Controller();
        }

       
       
        private void DismissButton_Click(object sender, RoutedEventArgs e)
        {
            if(EmployeeIdText.Text == "")
            {
                MessageBox.Show("Enter Id");
                return;
            }
            mycontroller.DeleteEmployee(int.Parse(EmployeeIdText.Text));
            Employee.BindEmployeesGrid();
        }

        private void UpdateSalaryButton_Click(object sender, RoutedEventArgs e)
        {
            if(IDText.Text == "")
            {
                MessageBox.Show("Enter Id", "Incomplete Data");
                return;
            }
            if (NewSalaryText.Text == "")
            {
                MessageBox.Show("Enter The New Salary", "Incomplete Data");
                return;
            }
            mycontroller.UpdateEmployeeSalary(int.Parse(IDText.Text), int.Parse(NewSalaryText.Text));
            Employee.BindEmployeesGrid();

        }

        private void AddEmployeeButton_Click(object sender, RoutedEventArgs e)
        {
            if(FirstNameText.Text == "")
            {
                MessageBox.Show("Enter The First Name", "Incomplete Data");
                return;
            }
            if (LastNameText.Text == "")
            {
                MessageBox.Show("Enter The Last Name", "Incomplete Data");
                return;
            }
            if (Salary.Text == "")
            {
                MessageBox.Show("Enter The Salary", "Incomplete Data");
                return;
            }
            if (NumHoursText.Text == "")
            {
                MessageBox.Show("Enter Number of Hours", "Incomplete Data");
                return;
            }
            if (JobIdText.Text == "")
            {
                MessageBox.Show("Enter The Job Id", "Incomplete Data");
                return;
            }
            if (StationIdText.Text == "")
            {
                MessageBox.Show("Enter The Station Id", "Incomplete Data");
                return;
            }
            string date = Birthdate.SelectedDate.ToString();
            if(date == "")
            {
                MessageBox.Show("Enter the Birthdate", "Incomplete Data");
                return;
            }
            int j = int.Parse(JobIdText.Text);
            if(j == 1 || j == 2)
            {
                MessageBox.Show("You can't Insert Another Manager", "Invalid Data");
                return;
            }
            mycontroller.AddEmployee(FirstNameText.Text, LastNameText.Text, date, int.Parse(Salary.Text), int.Parse(NumHoursText.Text), int.Parse(JobIdText.Text), int.Parse(StationIdText.Text));
            Employee.BindEmployeesGrid();

        }

        private void IDText_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
