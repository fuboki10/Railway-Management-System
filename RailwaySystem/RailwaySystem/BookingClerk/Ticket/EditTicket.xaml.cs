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
    /// Interaction logic for EditTicket.xaml
    /// </summary>
    public partial class EditTicket : UserControl
    {
        Ticket T;
        Controller mycontroller;
        public EditTicket(Ticket t)
        {
            T = t;
            mycontroller = new Controller();
            InitializeComponent();


        }

        private void EditTicketButton1_Click(object sender, RoutedEventArgs e)
        {
            if (TicketID.Text==""||type.Text=="")
            {
                MessageBox.Show("Type all data");
            }
            else {
                try
                {
                    string today = DateTime.Now.ToString();
                    int id = mycontroller.EditTicket(Convert.ToInt32(TicketID.Text), type.Text, mycontroller.get_emp_id_userId(T.UserID)
                        , today);
                    T.TicketData.ItemsSource = mycontroller.GetPassengerTicket(id).DefaultView;
                    MessageBox.Show("succesful");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }

        
    }
}
