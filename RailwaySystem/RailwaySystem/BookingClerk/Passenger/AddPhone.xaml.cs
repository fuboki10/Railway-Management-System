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
    /// Interaction logic for AddPhone.xaml
    /// </summary>
    public partial class AddPhone : UserControl
    {
        Passenger P;
        Controller mycontroller;
        public AddPhone(Passenger p)
        {

            P = p;
            mycontroller = new Controller();
            InitializeComponent();
        }

        
        private void DeletePhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if( PhCode.Text == "" || Phone.Text == ""||PassengerID.Text=="")
            {
                MessageBox.Show("type all informatio");
            }
            else
            {

                try
                {
                    mycontroller.DeletePPhone(Convert.ToInt32(PassengerID.Text), Convert.ToInt32(PhCode.Text), Convert.ToInt32(Phone.Text));
                    P.BindPassengersGrid(P.veiwPassengerPhone, Convert.ToInt32(PassengerID.Text));
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }
        }

        private void AddPhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if (PassengerID.Text == ""  || PhCode.Text == "" || Phone.Text == "")
            {
                MessageBox.Show("type all informatio");
            }
            else
            {

                try
                {
                    mycontroller.AddPPhone(Convert.ToInt32(PassengerID.Text), Convert.ToInt32(PhCode.Text), Convert.ToInt32(Phone.Text));
                    P.BindPassengersGrid(P.veiwPassengerPhone, Convert.ToInt32(PassengerID.Text));
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }

        }

        private void EditPhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if (PassengerID.Text == "" || PhCode.Text == "" || Phone.Text == "")
            {
                MessageBox.Show("type all information");
            }

            else
            {

                try
                {
                    mycontroller.EditPPhone(Convert.ToInt32(PassengerID.Text), Convert.ToInt32(PhCode.Text), Convert.ToInt32(Phone.Text));
                    P.BindPassengersGrid(P.veiwPassengerPhone, Convert.ToInt32(PassengerID.Text));
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }
        }
        private void ViewPhonesButton_Click(object sender, RoutedEventArgs e)
        {
            if ( PassengerID.Text == "")
            {
                MessageBox.Show("type Passenger ID");
            }
            else 
            P.BindPassengersGrid(P.veiwPassengerPhone,Convert.ToInt32(PassengerID.Text));
        }
    }
}
