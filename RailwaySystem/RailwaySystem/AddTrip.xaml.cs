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
            DataTable dt = c.GetallStations();
            if (dt != null)
            {
                source.ItemsSource = dt.DefaultView;
                source.DisplayMemberPath = "Name";
                source.SelectedValuePath = "ID";
                dest.ItemsSource = dt.DefaultView;
                dest.DisplayMemberPath = "Name";
                dest.SelectedValuePath = "ID";
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

        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            //source.SelectedValue, dest.SelectedValue, arr.SelectedDate.ToString(), dep.SelectedDate.ToString(), type.Text, train.SelectedValue
            if (source.Text == "" || dest.Text == "" || arr.SelectedDate == null || dep.SelectedDate == null || type.Text == "" || train.Text == "")
            {
                MessageBox.Show("Please enter the required data");
                return;
            }
            
            c.AddTrip(dep.SelectedDate.ToString(), arr.SelectedDate.ToString(), Convert.ToInt32(type.Text), source.SelectedValue, dest.SelectedValue, 0);
        }
    }
}
