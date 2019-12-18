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
    /// Interaction logic for AdminDashboard.xaml
    /// </summary>
    /// 
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
            NewUsernameTextbox.MaxLength = 20;

            BindAdmin();
        }

        private void BindAdmin()
        {
            DataTable dt = ControllerObj.GetAllAdmins();
            AdminsDataGrid.ItemsSource = dt.DefaultView;
            AdminsCombobox.ItemsSource = dt.DefaultView;
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

        private void GoTrains()
        {
            Trains TW = new Trains(UserID);
            TW.Show();
            this.Close();
        }

        private void EmployeesTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoEmployees();
        }
        private void StationsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStations();
        }

        private void TrainsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrains();
        }

        private void TrainsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrains();
        }

        private void StationsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStations();
        }

        private void GoStations()
        {
            Stations ST = new Stations(UserID);
            ST.Show();
            this.Close();
        }

        private void EmployeesButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoEmployees();
        }

        private void GoEmployees()
        {
            Employees EM = new Employees(UserID);
            EM.Show();
            this.Close();
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
                else
                {
                    BindAdmin();
                }
            }
           
        }

        private void AdminPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.AddAdmin();
            }
        }

        private void AdminUsername_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.AddAdmin();
            }
        }

        private void DeleteAdminButton_Click(object sender, RoutedEventArgs e)
        {
            if (AdminsCombobox.SelectedValue == null)
            {
                MessageBox.Show("Please Select Admin Name");
                return;
            }

            int id = Int32.Parse(AdminsCombobox.SelectedValue.ToString());
            var count = AdminsCombobox.Items.Count;
            if (count == 1)
            {
                MessageBox.Show("You Can't Delete All Admins", "Delete Admin");
                return;
            }
            ControllerObj.DeleteUser(id);
            // Update
            BindAdmin();
            // Logout if your user is deleted
            if (id == UserID)
            {
                this.Logout();
            }
        }

        private void ChangePasswordButton_Click(object sender, RoutedEventArgs e)
        {
            ChangePassword CP = new ChangePassword(UserID);
            CP.Show();
        }

        private void ChangeUsername()
        {
            if (NewUsernameTextbox.Text == "")
            {
                MessageBox.Show("Please Enter Username", "Enter Username");
                return;
            }
            string username = NewUsernameTextbox.Text;
            int ret = ControllerObj.ChangeUsername(UserID, username);
            if (ret == 0)
            {
                MessageBox.Show("This Username Already Exited", "Enter Username");
            }
            else
            {
                NameTextBox.Text = username;
                BindAdmin();
            }
        }

        private void NewUsernameTextbox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.ChangeUsername();
            }
        }

        private void ChangeUsernameButton_Click(object sender, RoutedEventArgs e)
        {
            this.ChangeUsername();
        }

        private void AdminsDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
