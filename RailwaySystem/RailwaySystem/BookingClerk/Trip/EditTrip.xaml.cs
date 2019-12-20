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
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for EditTrip.xaml
    /// </summary>
    public partial class EditTrip : UserControl
    {
        Controller mycontroller;
        Trips Trip;
        public EditTrip(Trips T)
        {
            mycontroller = new Controller();
            Trip = T;
            InitializeComponent();
            
        }
       
         

       

        private void ChangeDateButton_Click(object sender, RoutedEventArgs e)
        {
            string arrdate = ArrDate.SelectedDate.ToString();
            string depdate = Dep_Date.SelectedDate.ToString();
            if(arrdate == "")
            {
                MessageBox.Show("Please Enter Arrival Date", "Incomplete Data");
                return;
            }
            if (depdate == "")
            {
                MessageBox.Show("Please Enter Departure Date", "Incomplete Data");
                return;
            }
            if(ID.Text == "")
            {
                MessageBox.Show("Please Enter Trip ID", "Incomplete Data");
                return;
            }
            mycontroller.ChangeTripTime(int.Parse(ID.Text), arrdate, depdate);
            Trip.BindTripsGrid();
        }

        private void Class_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void ChangeClassButton_Click(object sender, RoutedEventArgs e)
        {
            if(IDC.Text == "")
            {
                MessageBox.Show("Please Enter Trip ID", "Incomplete Data");
                return;
            }
            if (Class.Text == "")
            {
                MessageBox.Show("Please Enter Trip Class", "Incomplete Data");
                return;
            }
            int cl = int.Parse(Class.Text);
            if(cl>3 || cl<1)
            {
                MessageBox.Show("Please Enter a Valid Class", "Invalid Data");
                return;
            }
            mycontroller.ChangeTripClass(int.Parse(IDC.Text), cl);
            Trip.BindTripsGrid();
        }
    }
}
