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
    /// Interaction logic for PassengerStats.xaml
    /// </summary>
    public partial class PassengerStats : Window
    {
        int UserID;
        Controller c;
        string job;
        public PassengerStats(int id)
        {
            InitializeComponent();
            c = new Controller();
            UserID = id;
            job = c.GetUserJob(UserID);
            PassengerReport n = new PassengerReport();
            view.ViewerCore.ReportSource = n;
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
            string username = c.GetUsername(UserID);
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
        private void GoHome()
        {
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else if (job == "Station Manager")
            {
                StManagerDashboard stManager = new StManagerDashboard(UserID);
                stManager.Show();
            }
            else if (job == "Manager")
            {
                ManagerDashboard M = new ManagerDashboard(UserID);
                M.Show();
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

        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            LoginPage l = new LoginPage();
            l.Show();
            this.Close();
        }

    }
}
