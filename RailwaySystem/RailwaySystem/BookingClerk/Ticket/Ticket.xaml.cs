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
    public partial class Ticket : Window
    {
        Controller ControllerObj;
        string job;
        private int UserID;
        public Ticket(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();
            job = ControllerObj.GetUserJob(UserID);
            RemoveButtons();
        }
        private void RemoveButtons()
        {
           
            if (job != "Booking Clerk")
            {
                BookSeatButton.Visibility = Visibility.Hidden;
                CancelTicktButton.Visibility = Visibility.Hidden;
                EditTicktButton.Visibility = Visibility.Hidden;
            }
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
        private void BookSeatButton_Click(object sender, RoutedEventArgs e)
        {
            this.newButtons.Children.Clear();
            BookseatButtons b = new BookseatButtons(this);
            this.newButtons.Children.Add(b);
        }

       
        private void CancelTicktButton_Click(object sender, RoutedEventArgs e)
        {
            this.newButtons.Children.Clear();
            CancelTicketButton c = new CancelTicketButton();
            this.newButtons.Children.Add(c);
        }

        private void EditTicktButton_Click(object sender, RoutedEventArgs e)
        {
            this.newButtons.Children.Clear();
            EditTicket E = new EditTicket();
            this.newButtons.Children.Add(E);
        }

        private void Add_sub_Click(object sender, RoutedEventArgs e)
        {
            this.newButtons.Children.Clear();
            connectsubscription Connect = new connectsubscription(this);
            this.newButtons.Children.Add(Connect);
        }
    }
}
