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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LoginPage : Window
    {
        Controller ControllerObj;
        public LoginPage()
        {
            InitializeComponent();
            ControllerObj = new Controller();

            PasswordTextBox.MaxLength = 8;
            UserNameTextBox.MaxLength = 20;
        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            this.Login();
        }

        private void X_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Rectangle_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void PasswordTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.Login();
            }
        }
        private void UserNameTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.Login();
            }
        }

        private void Login()
        {
            if (UserNameTextBox.Text == "")
            {
                string msg = "Please Enter your username";
                string title = "Enter Username";
                MessageBox.Show(msg, title);
            }
            else if (PasswordTextBox.Password.ToString() == "")
            {
                string msg = "Please Enter your password";
                string title = "Enter Password";
                MessageBox.Show(msg, title);
            }
            else
            {
                DataTable response = ControllerObj.Login(UserNameTextBox.Text, PasswordTextBox.Password.ToString());
                string msg = response.Rows[0]["response"].ToString();
                int ID;
                Int32.TryParse(response.Rows[0]["ID"].ToString(), out ID);
                if (ID != 0)
                {
                    this.GoToDashboard(ID);
                    this.Close();
                }
                else MessageBox.Show(msg);
            }
        }

        private void GoToDashboard(int ID)
        {
            string Job = ControllerObj.GetUserJob(ID);
            if (Job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(ID);
                AdminDashboard.Show();
            }
            else if (Job == "Booking Clerk")
            {
                BookingClerk BookingClerk = new BookingClerk(ID);
                BookingClerk.Show();
            }
            else if (Job == "Manager")
            {
                ManagerDashboard Manager = new ManagerDashboard(ID);
                Manager.Show();
            }
            else
            {
                /*
                 * TODO
                 * BOOKING CLERK
                 * MANAGER 
                 * STATION MANAGER
                 */
                Welcome WelcomeWindow = new Welcome(ID);
                WelcomeWindow.Show();
            }
        }
    }
}
