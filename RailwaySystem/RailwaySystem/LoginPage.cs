using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RailwaySystem
{
    public partial class LoginPage : Form
    {
        Controller ControllerObj;
        public LoginPage()
        {
            InitializeComponent();
            ControllerObj = new Controller();

            PasswordTextBox.PasswordChar = '*';
            PasswordTextBox.MaxLength = 8;
            UserNameTextBox.MaxLength = 20;
        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            if (UserNameTextBox.Text == "")
            {
                string msg = "Please Enter your username";
                string title = "Enter Username";
                MessageBox.Show(msg, title);
            }
            else if (PasswordTextBox.Text == "")
            {
                string msg = "Please Enter your password";
                string title = "Enter Password";
                MessageBox.Show(msg, title);
            }
            else
            {
                DataTable response = ControllerObj.Login(UserNameTextBox.Text, PasswordTextBox.Text);
                string msg = response.Rows[0]["response"].ToString();
                int ID;
                Int32.TryParse(response.Rows[0]["ID"].ToString(), out ID);
                MessageBox.Show(msg, ID.ToString());
            }
        }

    }
}
