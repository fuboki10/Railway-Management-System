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
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    /// 
    public partial class Welcome : Window
    {
        Controller ControllerObj;
        private int UserID;
        public Welcome(int U)
        {
            InitializeComponent();
            UserID = U;
            ControllerObj = new Controller();
        }
        private void XClicked(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            string username = ControllerObj.GetUsername(UserID);
            NameTextBox.Text = username;
        }
    }
}
