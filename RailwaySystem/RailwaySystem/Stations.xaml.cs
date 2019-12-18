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
            RefreshStations();
            refresh();
            Station.Visibility = Visibility.Hidden;
            Yards.Visibility = Visibility.Hidden;
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
            Station.Visibility = Visibility.Visible;
            if (Yards.Visibility == Visibility.Visible)
            {
                Yards.Visibility = Visibility.Hidden;
            }
        }

        private void Yard_Click(object sender, RoutedEventArgs e)
        {
            GBox.Visibility = Visibility.Visible;
            GBox.Header = "Yards";
            Yards.Visibility = Visibility.Visible;
            if (Station.Visibility == Visibility.Visible)
            {
                Station.Visibility = Visibility.Hidden;
            }
        }

        private void RefreshStations()
        {
            // Update the combobox of the stations
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
        }

        private void refresh()
        {
            DataTable dt;
            if ( station_id != -1)
            {
                dt = c.getCyards(station_id);
                if (dt != null)
                {
                    coachgrid.ItemsSource = dt.DefaultView;
                }
                else
                {
                    coachgrid.ItemsSource = null;
                }

                dt = c.GetRyards(station_id);
                if (dt != null)
                {
                    repgrid.ItemsSource = dt.DefaultView;
                }
                else
                {
                    repgrid.ItemsSource = null;
                }
            }

            dt = c.GetAllCyards();
            if (dt != null)
            {
                cYardscombo.ItemsSource = dt.DefaultView;
                cYardscombo.DisplayMemberPath = "ID";
                cYardscombo.SelectedValuePath = "ID";
            }
            else
            {
                cYardscombo.ItemsSource = null;
            }

            dt = c.GetAllRyards();
            if (dt != null)
            {
                rYards.ItemsSource = dt.DefaultView;
                rYards.DisplayMemberPath = "ID";
                rYards.SelectedValuePath = "ID";
            }
            else
            {
                rYards.ItemsSource = null;
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
            if (size.Text == "" || station_id == -1)
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
               
            int x = c.InsertYard(station_id, Convert.ToInt32(size.Text), iscoach);
            if (x != 0)
            {
                MessageBox.Show("Successful");
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

        private void updatecyard_Click(object sender, RoutedEventArgs e)
        {
            if (upcsize.Text == "" || cYardscombo.Text == "")
            {
                MessageBox.Show("Please select the car id and insert the new size");
                return;
            }

            int x = c.UpdateCSize(Convert.ToInt32(cYardscombo.SelectedValue), Convert.ToInt32(upcsize.Text));
            if (x == 0)
            {
                MessageBox.Show("Something Went wrong");
            }
            else
            {
                MessageBox.Show("Successful");
                refresh();
            }
        }

        private void updateryard_Click(object sender, RoutedEventArgs e)
        {
            if (uprsize.Text == "" || rYards.Text == "")
            {
                MessageBox.Show("Please select the yard id and insert the new size");
                return;
            }

            int x = c.UpdateRSize(Convert.ToInt32(rYards.SelectedValue), Convert.ToInt32(uprsize.Text));
            if (x == 0)
            {
                MessageBox.Show("Something Went wrong");
            }
            else
            {
                MessageBox.Show("Successful");
                refresh();
            }
        }

        private void deletecyard_Click(object sender, RoutedEventArgs e)
        {
            if (cYardscombo.Text == "")
            {
                MessageBox.Show("Please select the yard id");
                return;
            }
            int x = c.RemoveCyard(Convert.ToInt32(cYardscombo.SelectedValue));
            if (x == 0)
            {
                MessageBox.Show("Something Went wrong");
            }
            else
            {
                MessageBox.Show("Successful");
                refresh();
            }
        }

        private void deleteryard_Click(object sender, RoutedEventArgs e)
        {
            if (rYards.Text == "")
            {
                MessageBox.Show("Please select the yard id");
                return;
            }
            int x = c.RemoveRyard(Convert.ToInt32(rYards.SelectedValue));
            if (x == 0)
            {
                MessageBox.Show("Something Went wrong");
            }
            else
            {
                MessageBox.Show("Successful");
                refresh();
            }
        }
    }
}
