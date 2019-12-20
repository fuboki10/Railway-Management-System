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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Xceed.Wpf.Toolkit; 

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for AddTrip.xaml
    /// </summary>
    public partial class AddTrip : UserControl
    {
        Controller c;
        Trips trip;
        public AddTrip(Trips T)
        {
            InitializeComponent();
            c = new Controller();
            trip = T;
            DataTable dt = c.GetSoucre();

            trip.BindTripsGrid();
            if (dt != null)
            {
                source.ItemsSource = dt.DefaultView;
                source.DisplayMemberPath = "Name";
                source.SelectedValuePath = "ID";
            }
            else
            {
                source.ItemsSource = null;
            }
            dt = c.unassin_Trains();
            if (dt != null)
            {
                train.ItemsSource = dt.DefaultView;
                train.DisplayMemberPath = "Model";
                train.SelectedValuePath = "ID";
            }

            dt = c.GetAllDrivers();
            if (dt != null)
            {
                Driver.ItemsSource = dt.DefaultView;
                Driver.DisplayMemberPath = "name";
                Driver.SelectedValuePath = "ID";
            }
            else
            {
                Driver.ItemsSource = null;
            }
        }
        private void Add_Click(object sender, RoutedEventArgs e)
        {
            //source.SelectedValue, dest.SelectedValue, arr.SelectedDate.ToString(), dep.SelectedDate.ToString(), type.Text, train.SelectedValue
            if (source.Text == "" || dest.Text == "" || dep.Text == "" || type.Text == "" || train.Text == ""|| Driver.Text == "")
            {
                System.Windows.MessageBox.Show("Please enter the required data");
                return;
            }
            else if (priceA.Text == "" || priceB.Text == "" || priceC.Text == "" || classA.Text == "" || classB.Text == "" || classC.Text == "") 
            {
                System.Windows.MessageBox.Show("Please enter the required data");
                return;
            }
            int pA, pB, pC, CA, CB, CC;
            pA = Convert.ToInt32(priceA.Text);
            pB = Convert.ToInt32(priceB.Text);
            pC = Convert.ToInt32(priceC.Text);
            CA = Convert.ToInt32(classA.Text);
            CB = Convert.ToInt32(classB.Text);
            CC = Convert.ToInt32(classC.Text);
            int train_id = (int)train.SelectedValue;
            int driver = (int)Driver.SelectedValue;

            int x;
            string arrival = "";
            x = c.InsertTrip(dep.Text, arrival, Convert.ToInt32(type.Text), (int)dest.SelectedValue, (int)source.SelectedValue,
               train_id, driver, trip.UserID, CA, pA, CB, pB, CC, pC);
            if (x == 0)
            {
                System.Windows.MessageBox.Show("Something Went wrong");
            }
            else
            {
                System.Windows.MessageBox.Show("Successful");
                trip.BindTripsGrid();
            }
        }
        

        private void bindDest(object sender, SelectionChangedEventArgs e)
        {
            if (source.Text == "")
            {
                return;
            }
            DataTable dt = c.GetDest((int)source.SelectedValue);
            if (dt != null)
            {
                dest.ItemsSource = dt.DefaultView;
                dest.DisplayMemberPath = "Name";
                dest.SelectedValuePath = "ID";
            }
            else
            {
                dest.ItemsSource = null;
            }
        }
    }
}
