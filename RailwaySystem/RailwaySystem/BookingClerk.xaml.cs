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
        private void TrainsButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void PassengersButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void PassengersTextButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
