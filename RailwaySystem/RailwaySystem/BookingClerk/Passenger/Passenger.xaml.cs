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
    /// Interaction logic for Passenger.xaml
    /// </summary>
    public partial class Passenger : Window
    {
        public string veiwPassenger = "veiw Passengers";
        public string veiwPassengerContact = "veiw Passenger Contact";
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
            BindPassengersGrid(veiwPassenger);
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
                BookingClerk bookingClerk = new BookingClerk(UserID);
                bookingClerk.Show();
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
            BindPassengersGrid(veiwPassenger);
            AddPassenger A = new AddPassenger(this);
            Addbuttons(A);
        }
        public void Addbuttons(UIElement A)
        {
            this.newButtons.Children.Clear();
            this.newButtons.Children.Add(A);

        }
        public void BindPassengersGrid(string request,int PassengerID=-1)
        {
            if (request == veiwPassenger)
            {
                DataTable dt = ControllerObj.GetAllPassengers();
                if (dt.DefaultView != null)
                PassengersDataGrid.ItemsSource = dt.DefaultView;
            }
            if (request == veiwPassengerContact&&PassengerID!=-1)
            {
                DataTable dt = ControllerObj.GetPContact(PassengerID);
                if(dt.DefaultView!=null)
                PassengersDataGrid.ItemsSource =dt.DefaultView;
            }
        }

        private void ManagePassengerContentButton_Click(object sender, RoutedEventArgs e)
        {
            ManageContact M = new ManageContact(this);
            Addbuttons(M);
        }

        private void AddPassengerPhoneButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
