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
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for AdminDashboard.xaml
    /// </summary>
    public partial class AdminDashboard : Window
    {
        Controller ControllerObj;
        private int UserID;
        public AdminDashboard(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();
            AdminUsername.MaxLength = 20;
            AdminPassword.MaxLength = 8;
        }

        private void XClicked(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            string username = ControllerObj.GetUsername(UserID);
            NameTextBox.Text = username;

            AdminsDataDrid.ItemsSource = ControllerObj.GetAllAdmins().DefaultView;
        }

        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
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

        private void EmployeesTextButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO EMPLOYEES FORM
        }
        private void StationsTextButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO STATIONS FORM
        }

        private void TrainsTextButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO TRAINS FORM
        }

        private void TrainsButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO TRAINS FORM
        }

        private void StationsButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO STATIONS FORM
        }

        private void EmployeesButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO EMPLOYEES FORM
        }

        private void AddAdminButton_Click(object sender, RoutedEventArgs e)
        {
            this.AddAdmin();
        }

        private void AddAdmin()
        {
            if (AdminUsername.Text == "")
            {
                string msg = "Please Enter your username";
                string title = "Enter Username";
                MessageBox.Show(msg, title);
            }
            else if (AdminPassword.Password.ToString() == "")
            {
                string msg = "Please Enter your password";
                string title = "Enter Password";
                MessageBox.Show(msg, title);
            }
            else
            {
                int id = ControllerObj.AddAdmin(AdminUsername.Text, AdminPassword.Password.ToString());
                if (id == 0)
                {
                    string msg = "This username Already Exists";
                    string title = "Enter Username";
                    MessageBox.Show(msg, title);
                }
            }
        }
    }
}
