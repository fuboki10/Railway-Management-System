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
    /// Interaction logic for DeletePContact.xaml
    /// </summary>
    public partial class DeletePContact : UserControl
    {
        Passenger P;
        Controller mycontroller;
        public DeletePContact(Passenger p)
        {

            P = p;
            mycontroller = new Controller();
            InitializeComponent();
        }

        private void DeletePContactButton_Click(object sender, RoutedEventArgs e)
        {
            if (Email.Text == "")
            {
                MessageBox.Show("Type Contact Email");
            }
            else {
                int passenger_ID=0;
                passenger_ID=Convert.ToInt32(mycontroller.DeletePContact(Email.Text));
                if(passenger_ID>0)
                P.BindPassengersGrid(P.veiwPassengerContact,passenger_ID);
                else
                {
                    MessageBox.Show("can't delete this Contact");
                }
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
