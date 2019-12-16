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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for AddPassenger.xaml
    /// </summary>
    public partial class AddPassenger : UserControl
    {
        Passenger Passenger;
        Controller mycontroller;
        public AddPassenger(Passenger P)
        {
            Passenger = P;
            mycontroller = new Controller();
            InitializeComponent();
        }

        private void AddPassengerButton_Click(object sender, RoutedEventArgs e)
        {
            if (this.Last_Name.Text == "" || this.First_Name.Text == "")
            {
                MessageBox.Show("type first name and last name");
            }
            else {
                mycontroller.AddPassenger(this.First_Name.Text, this.Last_Name.Text);
                Passenger.BindPassengersGrid();
            } 
        }
    }
}
