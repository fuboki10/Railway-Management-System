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
    /// Interaction logic for AddEmpPhone.xaml
    /// </summary>
    public partial class AddEmpPhone : UserControl
    {
        Employees Employee;
        Controller mycontroller;
        public AddEmpPhone(Employees E)
        {
            InitializeComponent();
            Employee = E;
            mycontroller = new Controller();
            Employee.BindPhonesDataGrid();
        }

        private void DeletePhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if (PhCode.Text == "" || Phone.Text == "")
            {
                MessageBox.Show("type all information");
            }
            else
            {

                try
                {
                    mycontroller.DeleteEmpPhone(FirstName.Text, LastName.Text, PhCode.Text, Phone.Text);
                    Employee.BindPhonesDataGrid();
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }
        }

        private void AddPhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if (FirstName.Text == "" || LastName.Text == "" || PhCode.Text == "" || Phone.Text == "")
            {
                MessageBox.Show("type all information");
            }
            else
            {

                try
                {
                    mycontroller.AddEmpPhone(FirstName.Text, LastName.Text, PhCode.Text, Phone.Text);
                    Employee.BindPhonesDataGrid();
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }
        }

        
    }
}
