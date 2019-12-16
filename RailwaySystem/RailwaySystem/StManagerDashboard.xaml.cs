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

    public partial class StManagerDashboard : Window
    {
        Controller ControllerObj;
        private int UserID;
        public StManagerDashboard(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();
            StMngrPhone.MaxLength = 11;
            StMngrEmail.MaxLength = 30;
            NewUsernameTextbox.MaxLength = 20;

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
        private void GoTickets()
        {
            Ticket tk = new Ticket(UserID);
            tk.Show();
            this.Close();
        }
        private void GoEmployess()
        {
            Employees TW = new Employees(UserID);
            TW.Show();
            this.Close();
        }
        private void GoTrips()
        {
            Trips TW = new Trips(UserID);
            TW.Show();
            this.Close();
        }
        private void EmployeesTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoEmployess();
        }
        private void StationsTextButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO STATIONS FORM
        }

        private void TrainsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrains();
        }

        private void TrainsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrains();
        }
        private void TicketsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTickets();
        }
        private void TicketsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTickets();
        }
        private void TripsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrips();
        }
        private void TripsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTrips();
        }
        private void StationsButton_Click(object sender, RoutedEventArgs e)
        {
            // TODO : GO TO STATIONS FORM
        }

        private void EmployeesButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoEmployess();
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


        private void ChangePh()
        {
            if (StMngrPhone.Text.Length < 11)
            {
                string s = Convert.ToString(UserID);
                MessageBox.Show("Please Enter a valid phone", "Invalid Phone");
                return;
            }
            int phone = int.Parse(StMngrPhone.Text);
            int code = int.Parse(StMngrPhCode.Text);
            int ret = ControllerObj.ChangePhone(UserID, phone, code);
            if (ret == 0)
            {
                MessageBox.Show("You Added This Phone Before", "Phone Exists");
            }
        }
        private void ChangeEm()
        {
            if (!StMngrEmail.Text.Contains('@'))
            {
                MessageBox.Show("Please Enter a valid Email", "Invalid Email");
                return;
            }
            string email = StMngrEmail.Text;
            int ret = ControllerObj.ChangeEmail(UserID, email);
        }

        private void StMngrEmail_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void StMngrPhone_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void StMngrUpdatePhone_Click(object sender, RoutedEventArgs e)
        {
            this.ChangePh();
        }

        private void StMngrUpdateEmail_Click(object sender, RoutedEventArgs e)
        {
            this.ChangeEm();
        }
        private void StMngrPhone_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.ChangePh();
            }
        }
        private void StMngrPhCode_KeyDown(object sender, KeyEventArgs e)
        {

        }
        private void StMngrEmail_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.ChangePh();
            }
        }

        private void StMngrPhCode_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

    }
}