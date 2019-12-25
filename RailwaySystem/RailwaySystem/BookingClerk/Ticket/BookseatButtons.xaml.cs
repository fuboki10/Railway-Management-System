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
    /// Interaction logic for BookseatButtons.xaml
    /// </summary>
    public partial class BookseatButtons : UserControl
    {
        Ticket T;
        Controller mycontroller;
        public BookseatButtons(Ticket t)
        {
            T = t;
            mycontroller = new Controller();
            InitializeComponent();
            DataTable dt =mycontroller.GetSoucre();
            if (dt != null)
            {
                source.ItemsSource = dt.DefaultView;
                source.DisplayMemberPath = "Name";
                source.SelectedValuePath = "ID";
                source.SelectedIndex = 1;
                source.SelectedIndex = 0;
            }
            else
            {
                source.ItemsSource = null;
            }

        }
        private void BookSeatButton1_Click(object sender, RoutedEventArgs e)
        {
            if (Date1.Text == "" || Date2.Text == "" || source.Text == "" || dest.Text == "" || PassengerID.Text == "" || type.Text == "")
            {
                MessageBox.Show("Type all of the information");
            }
            else
            {
                try
                {
                    string today = DateTime.Now.ToString();
                    int ticketID = Convert.ToInt32(mycontroller.TicketID(Convert.ToInt32(source.SelectedValue),
                     Convert.ToInt32(dest.SelectedValue),
                     Convert.ToString(Date1.Text), Convert.ToString(Date2.Text), type.Text));
                    mycontroller.ConnectTicket(Convert.ToInt32(PassengerID.Text), mycontroller.get_emp_id_userId(T.UserID),
                   today, ticketID);
                    T.TicketData.ItemsSource = mycontroller.GetPassengerTicket(Convert.ToInt32(PassengerID.Text)).DefaultView;
                    MessageBox.Show("succesful");
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }
        private void bDest(object sender, SelectionChangedEventArgs e)
        {
            bindDest();
        }
        private void bindDest()
        {
            if (source.Text == "")
            {
                return;
            }
            DataTable dt = mycontroller.GetDest((int)source.SelectedValue);
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

        private void ViewPrice_Click(object sender, RoutedEventArgs e)
        {
            if (Date1.Text == "" || Date2.Text == "" || source.Text == "" || dest.Text == ""  || type.Text == "")
            {
                MessageBox.Show("Type all of the information");
            }
            else
            {

                var textprice = mycontroller.TicketPrice(Convert.ToInt32(source.SelectedValue), Convert.ToInt32(dest.SelectedValue),
                    Convert.ToString(Date1.Text), Convert.ToString(Date2.Text), type.Text);
                if (textprice != null)
                    Price.Content = textprice.ToString();
                else Price.Content = "no ticket with this attributes";
            }
        }
    }
}
