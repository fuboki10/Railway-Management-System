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
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for Employees.xaml
    /// </summary>
    public partial class Employees : Window
    {
        public int UserID;
        Controller ControllerObj;
        public Employees(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();

        }
        public int GetUserId()
        {
            return UserID;
        }
        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void XClicked(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            NameTextBox.Text = ControllerObj.GetUsername(UserID);
            BindEmployeesDataGrid();
        }

        private void BindEmployeesDataGrid()
        {
            DataTable dt = ControllerObj.GetAllEmployees();
            if (dt != null)
            {
                EmployeesDataGrid.ItemsSource = dt.DefaultView;
            }
            else
            {
                EmployeesDataGrid.ItemsSource = null;
            }
        }
        public void BindContactsDataGrid()
        {
            DataTable dt = ControllerObj.GetAllEContacts();
            if (dt != null)
            {
                EmployeesDataGrid.ItemsSource = dt.DefaultView;
            }
            else
            {
                EmployeesDataGrid.ItemsSource = null;
            }
        }
        public void BindPhonesDataGrid()
        {
            DataTable dt = ControllerObj.GetAllEmpPhones();
            if (dt != null)
            {
                EmployeesDataGrid.ItemsSource = dt.DefaultView;
            }
            else
            {
                EmployeesDataGrid.ItemsSource = null;
            }
        }
        public void Addbuttons(UIElement A)
        {
            this.newButtons.Children.Clear();
            this.newButtons.Children.Add(A);

        }
       
        public void BindEmployeesGrid()
        {
            this.BindEmployeesDataGrid();
        }
        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void Logout()
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }

        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void HomeTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void HomeButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void GoHome()
        {
            string job = ControllerObj.GetUserJob(UserID);
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else if(job == "Station Manager")
            {
                StManagerDashboard stManager = new StManagerDashboard(UserID);
                stManager.Show();
            }
            else if (job == "Manager")
            {
                ManagerDashboard M = new ManagerDashboard(UserID);
                M.Show();
            }
            this.Close();
        }

        private void StatisticsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStatistics();
        }

        private void StatisticsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStatistics();
        }

        private void GoStatistics()
        {
            //throw new NotImplementedException();
        }

        private void AddEmployeeButton_Click(object sender, RoutedEventArgs e)
        {
            BindEmployeesDataGrid();
            UserControlEmp A = new UserControlEmp(this);
            Addbuttons(A);
        }

        private void ManageEmployeeContentButton_Click(object sender, RoutedEventArgs e)
        {
            BindContactsDataGrid();
            EmpContact A = new EmpContact(this);
            Addbuttons(A);
        }

        private void EmployeesDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void ManageEmployeePhonesButton_Click(object sender, RoutedEventArgs e)
        {
            BindPhonesDataGrid();
            AddEmpPhone A = new AddEmpPhone(this);
            Addbuttons(A);
        }
    }
}
