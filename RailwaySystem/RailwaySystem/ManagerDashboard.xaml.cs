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
    /// Interaction logic for ManagerDashboard.xaml
    /// </summary>
   
    public partial class ManagerDashboard : Window
    {
        Controller controllerobj;           
        int userid;
        public ManagerDashboard(int id)
        {
            InitializeComponent();
            controllerobj = new Controller();
            userid = id;
            NameTextBox.Text = controllerobj.GetUsername(id);           // Display the username once the Form is opened
        }


        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Managers_button(object sender, RoutedEventArgs e)
        {
            // do some managerial things 
        }

        private void Employee_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Passenger_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Stations_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Trains_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Trips_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void XClicked(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
    }
}
