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
    /// Interaction logic for ManageContact.xaml
    /// </summary>
    public partial class ManageContact : UserControl
    {
        Passenger P;
        public ManageContact(Passenger p)
        {
            P = p;
            InitializeComponent();
        }

        private void AddContactButton_Click(object sender, RoutedEventArgs e)
        {
            AddContact AD = new AddContact(P);
            P.Addbuttons(AD);
        }

        private void DeleteContactButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void EditContactButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
