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
            source.ItemsSource = mycontroller.GetallStations().DefaultView;
            Desntaion.ItemsSource = mycontroller.GetallStations().DefaultView;

        }

        private void BookSeatButton1_Click(object sender, RoutedEventArgs e)
        {
            TicketClass Tc = new TicketClass();
            this.Chosseclassoptions.Children.Add(Tc);
        }
    }
}
