﻿using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LoginPage : Window
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
            else if (PasswordTextBox.Password.ToString() == "")
            {
                string msg = "Please Enter your password";
                string title = "Enter Password";
                MessageBox.Show(msg, title);
            }
            else
            {
                DataTable response = ControllerObj.Login(UserNameTextBox.Text, PasswordTextBox.Password.ToString());
                string msg = response.Rows[0]["response"].ToString();
                int ID;
                Int32.TryParse(response.Rows[0]["ID"].ToString(), out ID);
                MessageBox.Show(msg, ID.ToString());
            }
        }

    }
}