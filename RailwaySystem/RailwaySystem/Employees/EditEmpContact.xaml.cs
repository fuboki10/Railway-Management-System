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
    /// Interaction logic for EditEmpContact.xaml
    /// </summary>
    public partial class EditEmpContact : UserControl
    {
        Employees Employee;
        Controller mycontroller;
        public EditEmpContact(Employees E)
        {
            Employee = E;   
            mycontroller = new Controller();
            InitializeComponent();
        }

        private void AddContactButton_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeeID.Text == "" || City.Text == "" || this.Street.Text == "" || Email.Text == "" || State.Text == "")
            {
                MessageBox.Show("Please type all the contact data");
            }
            else
            {
                mycontroller.ChangeEmpContact(Convert.ToInt32(this.EmployeeID.Text), this.City.Text, this.Email.Text, this.State.Text, this.Street.Text);
            }
            Employee.BindContactsDataGrid();
        }

        private void EmployeeID_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
