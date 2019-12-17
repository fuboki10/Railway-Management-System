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
    /// Interaction logic for EditButtons.xaml
    /// </summary>
    public partial class EditButtons : UserControl
    {

        Passenger P;
        Controller mycontroller;
        public EditButtons(Passenger p)
        {

            P = p;
            mycontroller = new Controller();
            InitializeComponent();
        }

        private void EditContactButton_Click(object sender, RoutedEventArgs e)
        {
            if (Email.Text == "")
            {
                MessageBox.Show("Type contact email");
            }
            else
            {
                int passenger = 0;
                passenger=Convert.ToInt32(mycontroller.EditPContact(City.Text,Email.Text,State.Text,Street.Text));
                P.BindPassengersGrid(P.veiwPassengerContact, Convert.ToInt32(PassengerID.Text));
            }
        }

        private void ViewContactsButton_Click(object sender, RoutedEventArgs e)
        {
            if (PassengerID.Text == "")
            {
                MessageBox.Show("Type Passenger ID");
            }
            {
                P.BindPassengersGrid(P.veiwPassengerContact, Convert.ToInt32(PassengerID.Text));
            }
        }
    }
}
