using System;
using System.Collections.Generic;
using System.Data;
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

            BindEmployeesID();
            BindStationComboBox();
            BindJobComboBox();
        }

        private void BindJobComboBox()
        {
            DataTable dt = mycontroller.GetAllJobs(Employee.UserID);
            if (dt != null)
            {
                JobComboBox.ItemsSource = dt.DefaultView;
            }
            else
            {
                JobComboBox.ItemsSource = null;
            }
        }

        private void BindStationComboBox()
        {
            DataTable dt = mycontroller.GetallStations();
            if (dt != null)
            {
                StationComboBox.ItemsSource = dt.DefaultView;
            }
            else
            {
                StationComboBox.ItemsSource = null;
            }
        }

        private void BindEmployeesID()
        {
            DataTable dt = mycontroller.GetAllEmployees();
            if (dt != null)
            {
                EmployeeID1.ItemsSource = dt.DefaultView;
                EmployeeID2.ItemsSource = dt.DefaultView;
            }
            else
            {
                EmployeeID1.ItemsSource = null;
                EmployeeID2.ItemsSource = null;
            }
        }

       
       
        private void DismissButton_Click(object sender, RoutedEventArgs e)
        {
            if(EmployeeID1.SelectedValue == null)
            {
                MessageBox.Show("Select Employee ID");
                return;
            }
            mycontroller.DeleteEmployee(int.Parse(EmployeeID1.SelectedValue.ToString()));
            
            Employee.BindEmployeesGrid();
            BindEmployeesID();
        }

        private void UpdateSalaryButton_Click(object sender, RoutedEventArgs e)
        {
            if(EmployeeID2.SelectedValue == null)
            {
                MessageBox.Show("Select Employee ID", "Incomplete Data");
                return;
            }
            if (NewSalaryText.Text == "")
            {
                MessageBox.Show("Enter The New Salary", "Incomplete Data");
                return;
            }
            mycontroller.UpdateEmployeeSalary(int.Parse(EmployeeID2.SelectedValue.ToString()), int.Parse(NewSalaryText.Text));
            Employee.BindEmployeesGrid();

        }

        private void AddEmployeeButton_Click(object sender, RoutedEventArgs e)
        {
            if (JobComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please Select Job");
                return;
            }

            string job = JobComboBox.Text;

            if (FirstNameText.Text == "")
            {
                MessageBox.Show("Please Enter First Name");
                return;
            }
            string first_name = FirstNameText.Text;

            if (LastNameText.Text == "")
            {
                MessageBox.Show("Please Enter Last Name");
                return;
            }
            string last_name = LastNameText.Text;

            string date = Birthdate.SelectedDate.ToString();

            if (NumHoursText.Text == "")
            {
                MessageBox.Show("Please Enter Working Hours");
                return;
            }
            int working_hours;
            if (!Int32.TryParse(NumHoursText.Text, out working_hours))
            {
                MessageBox.Show("Please Enter Working Hours in numbers");
                return;
            }

            if (StationComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please Select station");
                return;
            }

            int station_id = Int32.Parse(StationComboBox.SelectedValue.ToString());

            if (Salary.Text == "")
            {
                MessageBox.Show("Please Enter salary");
                return;
            }
            int salary;
            if (!Int32.TryParse(Salary.Text, out salary))
            {
                MessageBox.Show("Please Enter Salary in numbers");
                return;
            }

            int job_id = Int32.Parse(JobComboBox.SelectedValue.ToString());

            if (job == "Driver")
            {
                mycontroller.AddEmployee(first_name, last_name, date, salary, working_hours, job_id, station_id);

                BindEmployeesID();
                Employee.BindEmployeesGrid();
            }
            else
            {
                SignUp SU = new SignUp();
                var result = SU.ShowDialog();
                if (result == true)
                {
                    string username = SU.Username;
                    string password = SU.Pass;

                    mycontroller.AddEmployee(first_name, last_name, date, salary, working_hours, job_id, station_id, username, password);

                    BindEmployeesID();
                    Employee.BindEmployeesGrid();
                }
            }
        }

        private void EmployeeID1_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
