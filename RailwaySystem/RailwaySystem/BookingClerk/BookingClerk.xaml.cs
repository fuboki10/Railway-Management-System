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
    /// Interaction logic for Window1.xaml
    /// </summary>
    /// 
    public partial class BookingClerk : Window
    {
        Controller ControllerObj;
        private int UserID;
        public BookingClerk(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();
        }
        private void XClicked(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            string username = ControllerObj.GetUsername(UserID);
            NameTextBox.Text = username;
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }

        private void TripButton_Click(object sender, RoutedEventArgs e)
        {
            GoTrips();
        }
        private void TripsTextButton_Click(object sender,RoutedEventArgs e)
        {
            GoTrips();
        }
        private void GoTrips()
        {
            Trips T = new Trips(UserID);
            T.Show();
            this.Close();
        }


        private void PassengersButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoPassenger();
        }

        private void PassengersTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoPassenger();
        }

        private void GoPassenger()
        {
            Passenger P = new Passenger(UserID);
            P.Show();
            this.Close();
        }

        private void TicketTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTicket();
        }

        private void TicketButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoTicket();
        }

        private void GoTicket()
        {
            Ticket T = new Ticket(UserID);
            T.Show();
            this.Close();
        }
        private void ChangeUsernameButton_Click(object sender, RoutedEventArgs e)
        {
            this.ChangeUsername();
        }
        private void NewUsernameTextbox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.ChangeUsername();
            }
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
        private void ChangePasswordButton_Click(object sender, RoutedEventArgs e)
        {
            ChangePassword CP = new ChangePassword(UserID);
            CP.Show();
        }
    }
}
