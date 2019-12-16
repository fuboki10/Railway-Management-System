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
    /// Interaction logic for Passenger.xaml
    /// </summary>
    public partial class Passenger : Window
    {
        Controller ControllerObj;
        private int UserID;
        public Passenger(int U)
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
        private void HomeButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }
        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }
        private void StatisticsButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void StatisticsTextButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void HomeTextButton_Click(object sender, RoutedEventArgs e)
        {
            GoHome();
        }
        private void GoHome()
        {
            string job = ControllerObj.GetUserJob(UserID);
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else if (job == "Booking Clerk")
            {
                BookingClerk BookingClerk = new BookingClerk(UserID);
                BookingClerk.Show();
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

        private void AddPassengerButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
