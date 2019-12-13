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
    /// Interaction logic for ChangePassword.xaml
    /// </summary>
    public partial class ChangePassword : Window
    {
        private int UserId;
        Controller ControllerObj;
        public ChangePassword(int U)
        {
            UserId = U;
            ControllerObj = new Controller();
            InitializeComponent();
        }

        private void Confirm_Click(object sender, RoutedEventArgs e)
        {
            if (OldPassword.Password == "")
            {
                MessageBox.Show("Please Enter Old Password", "Enter Password");
                return;
            }

            if (NewPassword.Password == "")
            {
                MessageBox.Show("Please Enter New Password", "Enter Password");
                return;
            }

            int ret = ControllerObj.ChangePassword(UserId, OldPassword.Password, NewPassword.Password);
            if (ret != 1)
            {
                MessageBox.Show("Please Enter Old Password", "Enter Password");
                return;
            }

            this.Close();
        }
    }
}
