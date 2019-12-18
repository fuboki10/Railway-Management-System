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
        int station_id = -1;         // holds the id of the station we are using
        public Stations(int id)
        {
            InitializeComponent();
            c = new Controller();
            userid = id;
            NameTextBox.Text = c.GetUsername(id);
            
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

            nameblock.Visibility = Visibility.Visible;
            cityblock.Visibility = Visibility.Visible;
            streetblock.Visibility = Visibility.Visible;
            stateblock.Visibility = Visibility.Visible;

            ADDButton.Visibility = Visibility.Visible;
            UPdateButton.Visibility = Visibility.Visible;

            SCity.Visibility = Visibility.Visible;
            SState.Visibility = Visibility.Visible;
            SStreet.Visibility = Visibility.Visible;

            stationsbox.Visibility = Visibility.Visible;
            stations_grid.Visibility = Visibility.Visible;
            UPName.Visibility = Visibility.Visible;
            updateblock.Visibility = Visibility.Visible;
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
                stationcombo.ItemsSource = dt.DefaultView;
                stationsbox.DisplayMemberPath = "Name";
                stationcombo.DisplayMemberPath = "Name";
                stationcombo.SelectedValuePath = "ID";
            }
            if ( station_id != -1)
            {
                dt = c.getCyards(station_id);
                if (dt != null)
                {
                    coachgrid.ItemsSource = dt.DefaultView;
                }
                dt = c.GetRyards(station_id);
                if (dt != null)
                {
                    repgrid.ItemsSource = dt.DefaultView;
                }
                else
                {
                    coachgrid.ItemsSource = null;
                    repgrid.ItemsSource = null;
                }
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
                MessageBox.Show("Something went wrong!");
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
                MessageBox.Show("Something Went wrong");
            }
            else
            {
                MessageBox.Show("Successfull");
                refresh();
            }
        }

        private void Addcouch_Click(object sender, RoutedEventArgs e)
        {
            if (size.Text == "" || stationcombo.Text == "")
            {
                MessageBox.Show("Please fill in all required data (make sure you have chosen a station)");
                return;
            }
            bool iscoach = false;
            if (coachyard.IsChecked == true)
            {
                iscoach = true;
            }
            else if (repairyard.IsChecked == false)
            {
                MessageBox.Show("Please select the type of the yard");
                return;
            }
               
            int x = c.InsertYard((int)stationcombo.SelectedValue, Convert.ToInt32(size.Text), iscoach);
            if (x != 0)
            {
                MessageBox.Show("Successfull");
                refresh();
            }
            else
            {
                MessageBox.Show("Something went wrong");
            }
        }

        private void repairyard_Checked(object sender, RoutedEventArgs e)
        {
            if (coachyard.IsChecked == true)
            {
                coachyard.IsChecked = false;
            }
        }

        private void coachyard_Checked(object sender, RoutedEventArgs e)
        {
            if (repairyard.IsChecked == true)
            {
                repairyard.IsChecked = false;
            }
        }

        private void view_button(object sender, RoutedEventArgs e)
        {
            if (stationcombo.Text == "")
            {
                if (station_id == -1)
                {
                    MessageBox.Show("Please choose a station first");
                    return;
                }
            }
            else
            {
                station_id = Convert.ToInt32(stationcombo.SelectedValue);
            }
            refresh();
        }
    }
}
