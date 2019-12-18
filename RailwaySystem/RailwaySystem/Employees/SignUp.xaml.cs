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
    /// Interaction logic for SignUp.xaml
    /// </summary>
    public partial class SignUp : Window
    {
        public string Username { get; set; }
        public string Pass { get; set; }

        Controller ControllerObj;
        public SignUp()
        {
            InitializeComponent();

            ControllerObj = new Controller();

            UsernameTextBox.MaxLength = 20;
            Password.MaxLength = 8;
            ConfirmPassword.MaxLength = 8;
        }

        private void SignUpButton_Click(object sender, RoutedEventArgs e)
        {
            if (UsernameTextBox.Text == "")
            {
                MessageBox.Show("Please Enter Username");
                return;
            }

            if (Password.Password == "")
            {
                MessageBox.Show("Please Enter Password");
                return;
            }

            if (ConfirmPassword.Password == "")
            {
                MessageBox.Show("Please Enter Password Again");
                return;
            }

            if (Password.Password != ConfirmPassword.Password)
            {
                MessageBox.Show("Password is wrong");
                return;
            }

            int result = ControllerObj.CheckUsername(UsernameTextBox.Text);
            if (result == 1)
            {
                MessageBox.Show("Username Already Used");
                return;
            }

            this.Username = UsernameTextBox.Text;
            this.Pass = Password.Password;
            this.DialogResult = true;
            this.Close();
        }
    }
}
