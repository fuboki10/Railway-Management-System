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

        public int UserID;
        private string job;
        Controller ControllerObj;
        public Trips(int U)
        {
            ControllerObj = new Controller();
            InitializeComponent();
            UserID = U;
            job = ControllerObj.GetUserJob(UserID);

            BindTripsGrid();

            if (job == "Booking Clerk")
            {
                Add_trip.Visibility = Visibility.Hidden;
                UpdateTrip.Visibility = Visibility.Hidden;
                subs_add.Visibility = Visibility.Hidden;
            }
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
            else if (job == "Manager")
            {
                ManagerDashboard Manager = new ManagerDashboard(UserID);
                Manager.Show();
            }
            else
            {
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
            if (dt != null)
                TripsDataGrid.ItemsSource = dt.DefaultView;
            else
                TripsDataGrid.ItemsSource = null;
        }

        private void edit_trip_Click(object sender, RoutedEventArgs e)
        {
            EditTrip A = new EditTrip(this);
            Add_buttons(A);
        }

        public void Add_buttons(UIElement A)
        {
            this.newButtons.Children.Clear();
            this.newButtons.Children.Add(A);
        }

        private void Add_trip_Click(object sender, RoutedEventArgs e)
        {
            AddTrip T = new AddTrip(this);
            Add_buttons(T);
        }

        private void add_sub_Click(object sender, RoutedEventArgs e)
        {
            AddSub A = new AddSub(this);
            Add_buttons(A);
        }
    }
}
