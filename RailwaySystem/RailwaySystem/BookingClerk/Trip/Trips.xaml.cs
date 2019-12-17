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
    /// Interaction logic for Trips.xaml
    /// </summary>
    public partial class Trips : Window
    {

        private int UserID;
        Controller ControllerObj;
        public Trips(int U)
        {
            ControllerObj = new Controller();
            InitializeComponent();
            UserID = U;
        }
        private void Logout()
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }
        private void HomeButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }
        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }
        private void GoHome()
        {
            string job = ControllerObj.GetUserJob(UserID);
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else if(job=="Booking Clerk")
            {
                BookingClerk BookingClerk = new BookingClerk(UserID);
                BookingClerk.Show();
            }
            else if (job == "Station Manager")
            {
                StManagerDashboard stManager = new StManagerDashboard(UserID);
                stManager.Show();
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
        private void XClicked(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void ManageTripsButton_Click(object sender, RoutedEventArgs e)
        {

            EditTrip A = new EditTrip(this);
            Addbuttons(A);
        }
        public void Addbuttons(UIElement A)
        {
            this.newButtons.Children.Clear();
            this.newButtons.Children.Add(A);

        }
        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
        private void StatisticsButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void StatisticsTextButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void HomeTextButton_Click(object sender ,RoutedEventArgs e)
        {
            GoHome();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }
        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        { 
            NameTextBox.Text = ControllerObj.GetUsername(UserID);
            BindTripsGrid();
        }
        public void BindTripsGrid()
        {
            DataTable dt = ControllerObj.GetAllTrips();
            TripsDataGrid.ItemsSource = dt.DefaultView;
        }

        private void AddTripButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
