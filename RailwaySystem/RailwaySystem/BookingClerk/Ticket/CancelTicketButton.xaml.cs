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
    /// Interaction logic for BookSeatButton.xaml
    /// </summary>
    public partial class CancelTicketButton : UserControl
    {
        Ticket T;
        Controller mycontroller;
        public CancelTicketButton(Ticket t)
        {
            T = t;
            mycontroller = new Controller();
            InitializeComponent();
            

        }



        private void CancelTicketButton_Click(object sender, RoutedEventArgs e)
        {
            if (ticketid.Text == "")
            {
                MessageBox.Show("insert all data");
            }
            else
            {
                try
                {
                    mycontroller.CancelTicket(Convert.ToInt32(ticketid.Text));
                    MessageBox.Show("succesful");
                    T.TicketData.ItemsSource = null;

                }
                catch (Exception ex) {
                    MessageBox.Show(ex.ToString());
                }

            }
        }

        

       
    }
}
