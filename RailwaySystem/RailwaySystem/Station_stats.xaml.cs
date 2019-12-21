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
    /// Interaction logic for Station_stats.xaml
    /// </summary>
    public partial class Station_stats : Window
    {
        int UserID;
        Controller c;
        string job;
        public Station_stats(int id)
        {
            InitializeComponent();
            c = new Controller();
            UserID = id;
            job = c.GetUserJob(UserID);
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
