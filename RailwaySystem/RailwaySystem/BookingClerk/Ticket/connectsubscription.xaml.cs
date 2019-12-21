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
    /// Interaction logic for connectsubscription.xaml
    /// </summary>
    public partial class connectsubscription : UserControl
    {
        Ticket T;
        Controller mycontroller;
        public connectsubscription(Ticket t)
        {

            T = t;
            mycontroller = new Controller();
            InitializeComponent();
            Attributes.ItemsSource = mycontroller.Getsubs().DefaultView;

        }

        private void ConfirmSubButton_Click(object sender, RoutedEventArgs e)
        {
            if (PassenegerID.Text==""||Attributes.Text==""||monthes.Text=="")
            {
                MessageBox.Show("type Passenger ID");
            }
            else
            {
                var today = DateTime.Now;
                
                mycontroller.InsertPsub(Convert.ToInt32(PassenegerID.Text), Convert.ToInt32(Attributes.SelectedValue),
                    Convert.ToString(today.AddMonths(Convert.ToInt32(monthes.Text))));
            }
        }
    }
}
