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
        private int UserID;
        Controller ControllerObj;
        public Employees(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();

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
            EmployeesDataGrid.ItemsSource = dt.DefaultView;
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
            else
            {
                /*
                 * TODO
                 * BOOKING CLERK
                 * MANAGER 
                 * STATION MANAGER
                 */
                Welcome WelcomeWindow = new Welcome(UserID);
                WelcomeWindow.Show();
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
            throw new NotImplementedException();
        }
    }
}
