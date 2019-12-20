using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for AddSub.xaml
    /// </summary>
    /// 
    public partial class AddSub : UserControl
    {
        Controller c;
        Trips trip;
        public AddSub(Trips T)
        {
            InitializeComponent();
            c = new Controller();
            trip = T;

            BindGrid();
        }

        private void BindGrid()
        {
            DataTable dt = c.GetAllSubscriptions();
            if (dt != null)
                trip.TripsDataGrid.ItemsSource = dt.DefaultView;
            else
                trip.TripsDataGrid.ItemsSource = null;
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (classcombo.Text == "" || fees.Text == "" || Tno.Text == "")
            {
                MessageBox.Show("Please fill all the required data (remember to choose a class)");
                return;
            }

            int x = c.Add_subscrition(Convert.ToInt32(fees.Text), classcombo.Text, Convert.ToInt32(Tno.Text));
            if (x == 0)
            {
                MessageBox.Show("Something went wrong");
            }
            else
            {
                MessageBox.Show("Successful");
                BindGrid();
            }
            return;
        }
    }
}
