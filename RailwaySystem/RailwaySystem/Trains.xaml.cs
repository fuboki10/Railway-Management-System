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
    /// Interaction logic for Trains.xaml
    /// </summary>
    public partial class Trains : Window
    {
        private int UserID;
        Controller ControllerObj;
        public Trains(int U)
        {
            ControllerObj = new Controller();
            InitializeComponent();
            UserID = U;
            NameTextBox.Text = ControllerObj.GetUsername(UserID);

            BindTrainsGrid();
            BindTrainsID_ComboBox();
        }

        private void BindTrainsID_ComboBox()
        {
            RailWaySystemDBEntities3 db = new RailWaySystemDBEntities3();
            var item = db.GetAllTrains().ToList();
            TrainsID_ComboBox.ItemsSource = item;
        }

        private void BindTrainsGrid()
        {
            RailWaySystemDBEntities3 db = new RailWaySystemDBEntities3();
            var item = db.GetAllTrains().ToList();
            TrainsDataGrid.ItemsSource = item;
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

        private void HomeTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void GoHome()
        {
            string job = ControllerObj.GetUserJob(UserID);
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
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

        private void HomeButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void Logout()
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            int id;
            if (TrainsID_ComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please select ID");
                return;
            }
            if (Int32.TryParse(TrainsID_ComboBox.SelectedValue.ToString(), out id))
            {
                ControllerObj.RemoveTrain(id);
                // Update 
                BindTrainsID_ComboBox();
                BindTrainsGrid();
            }
            
        }
    }
}
