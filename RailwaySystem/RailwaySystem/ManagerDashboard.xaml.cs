using System;
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
using System.Windows.Shapes;

namespace RailwaySystem
{
    /// <summary>
    /// Interaction logic for ManagerDashboard.xaml
    /// </summary>

    public partial class ManagerDashboard : Window
    {
        Controller controllerobj;
        int userid;
        public ManagerDashboard(int id)
        {
            InitializeComponent();
            controllerobj = new Controller();
            userid = id;
            NameTextBox.Text = controllerobj.GetUsername(id);           // Display the username once the Form is opened

            DataTable dt = controllerobj.GetUserAdress(id);
            if (dt != null)
                Address.ItemsSource = dt.DefaultView;
            dt = controllerobj.GetUserPhones(id);
            if (dt != null)
                Phones.ItemsSource = dt.DefaultView;

        }


        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Managers_button(object sender, RoutedEventArgs e)
        {
            // do some managerial things 
        }

        private void Employee_Click(object sender, RoutedEventArgs e)
        {
            Employees emp = new Employees(userid);
            emp.Show();
            this.Close();
        }

        private void Passenger_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Stations_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void Trains_Click(object sender, RoutedEventArgs e)
        {
            Trains TW = new Trains(userid);
            TW.Show();
            this.Close();
        }

        private void Trips_Click(object sender, RoutedEventArgs e)
        {
            Trips t = new Trips(userid);
            t.Show();
            this.Close();
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            // to do
        }

        private void XClicked(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void ChangeUsernameButton_Click(object sender, RoutedEventArgs e)
        {
            if (NewUsernameTextbox.Text == "")
            {
                MessageBox.Show("Please enter a valid username");
                return;
            }

            int res = 0;
            res = controllerobj.ChangeUsername(userid, NewUsernameTextbox.Text);
            if (res == 0)
            {
                MessageBox.Show("Something went wrong, this username may be already taken");

            }
            else
            {
                MessageBox.Show("The username was changed Successfully!");
            }

        }

        private void ChangePasswordButton_Click(object sender, RoutedEventArgs e)
        {
            ChangePassword change = new ChangePassword(userid);
            change.Show();
        }

        private void ChangeemailButton_Click(object sender, RoutedEventArgs e)
        {
            if (newemail.Text == "")
            {
                MessageBox.Show("Please enter a valid E-mail");
                return;
            }
            int x = 0;
            x = controllerobj.ChangeEmail(userid, newemail.Text);
            if (x == 0)
            {
                MessageBox.Show("Please enter a valid E-mail");
            }
        }

        private void ADDphone(object sender, RoutedEventArgs e)
        {
            if (code.Text == "" || newphone.Text == "")
            {
                MessageBox.Show("Please fill in all data");
                return;
            }
            int x = 0;
            x = controllerobj.AddUserphone(userid, code.Text, newphone.Text);
            if (x == 0)
            {
                MessageBox.Show("Invalid phone number or code");
            }
            else
            {
                MessageBox.Show("Succeed !");
            }
        }

        private void DeletePhone(object sender, RoutedEventArgs e)
        {

        }
    }
}
