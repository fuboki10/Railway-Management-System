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
    /// Interaction logic for AddContact.xaml
    /// </summary>
    public partial class AddContact : UserControl
    {
        Passenger P;
        Controller mycontroller;
        public AddContact(Passenger p)
        {
           
            P = p;
            mycontroller = new Controller();
            InitializeComponent();
        }

        private void AddContactButton_Click(object sender, RoutedEventArgs e)
        {
            
            if(PassengerID.Text == ""||City.Text==""|| this.Street.Text == "" || Email.Text == "" || State.Text == "")
            {
                MessageBox.Show("Please type all the contact data");
            }
            else
            {


                

                mycontroller.AddPContact(Convert.ToInt32(this.PassengerID.Text), this.City.Text, this.Email.Text, this.State.Text, this.Street.Text);
                P.BindPassengersGrid(P.veiwPassengerContact, Convert.ToInt32(PassengerID.Text));
                
                
            }
        }
    }
}
