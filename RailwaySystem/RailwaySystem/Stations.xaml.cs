using System;
using System.Data;
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
    /// Interaction logic for Stations.xaml
    /// </summary>
    public partial class Stations : Window
    {
        int userid;
        Controller c;
        public Stations(int id)
        {
            InitializeComponent();
            c = new Controller();
            userid = id;
            NameTextBox.Text = c.GetUsername(id);
            GBox.Visibility = Visibility.Hidden;

            refresh();
        }

        private void Home_button(object sender, RoutedEventArgs e)
        {
            LoginPage L = new LoginPage();
            L.Show();
            this.Close();
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            LoginPage l = new LoginPage();
            l.Show();
            this.Close();
        }

        private void HomeTextButton_Click(object sender, RoutedEventArgs e)
        {
            ManagerDashboard M = new ManagerDashboard(userid);
            M.Show();
            this.Close();
        }

        private void Employee_Click(object sender, RoutedEventArgs e)
        {
            Employees E = new Employees(userid);
            E.Show();
            this.Close();
        }

        private void Passenger_Click(object sender, RoutedEventArgs e)
        {
            Passenger P = new Passenger(userid);
            P.Show();
            this.Close();
        }

        private void Trains_Click(object sender, RoutedEventArgs e)
        {
            Trains T = new Trains(userid);
            T.Show();
            this.Close();
        }

        private void Trips_Click(object sender, RoutedEventArgs e)
        {
            Trips S = new Trips(userid);
            S.Show();
            this.Close();
        }

        private void XClicked(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Station_Click(object sender, RoutedEventArgs e)
        {
            GBox.Visibility = Visibility.Visible;
            GBox.Header = "Stations";
        }

        private void Yard_Click(object sender, RoutedEventArgs e)
        {
            GBox.Visibility = Visibility.Visible;
            GBox.Header = "Yards";
        }

        private void refresh()
        {
            DataTable dt = c.GetallStations();
            if (dt != null)
            {
                stations_grid.ItemsSource = dt.DefaultView;
                stationsbox.ItemsSource = dt.DefaultView;
                stationsbox.DisplayMemberPath = "Name";
            }

        }

        private void ADD_Click(object sender, RoutedEventArgs e)
        {
            if (SName.Text == "" || SState.Text == "" || SCity.Text == "" || SStreet.Text == "")
            {
                MessageBox.Show("Please Fill in all the data");
                return;
            }

            int x = c.InsertStation(SName.Text, SCity.Text, SState.Text, System.Convert.ToInt32(SStreet.Text));
            if (x == 0)
            {
                MessageBox.Show("Something went wronge!");
            }
            else
            {
                MessageBox.Show("Inserted Successfully");
                refresh();
            }
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            if (stationsbox.Text == "")
            {
                MessageBox.Show("Please choose a station to update");
                return;
            }
            else if (UPName.Text == "")
            {
                MessageBox.Show("Please enter the new name of the station");
                return;
            }

            int x = c.UpdateStation(stationsbox.Text, UPName.Text);
            if (x == 0)
            {
                MessageBox.Show("Something Went wronge");
            }
            else
            {
                MessageBox.Show("Successfull");
                refresh();
            }
        }
    }
}
