using System;
using System.Data;
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
            BindEmployeesID();
        }

        private void DeletePhoneButton_Click(object sender, RoutedEventArgs e)
        {
            if (PhCode.Text == "" || Phone.Text == "" || EmployeeID.Text == "")
            {
                MessageBox.Show("type all information");
            }
            else
            {
                int station_id = int.Parse(mycontroller.GetEmployeeStationId(int.Parse(EmployeeID.SelectedValue.ToString())));
                string station = mycontroller.GetUserStationId(Employee.GetUserId());
                if (station == "admin")
                {

                }
                else
                {
                    int userStId = int.Parse(station);
                    if (!(userStId == 0 || userStId == station_id))
                    {
                        MessageBox.Show("You can't UPdate Employees From other stations", "Invalid Input");

                        return;
                    }
                }

                try
                {
                    mycontroller.DeleteEmpPhone(int.Parse(EmployeeID.Text), PhCode.Text, Phone.Text);
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
            if (EmployeeID.Text == "" || PhCode.Text == "" || Phone.Text == "")
            {
                MessageBox.Show("type all information");
            }
            else
            {
                int station_id = int.Parse(mycontroller.GetEmployeeStationId(int.Parse(EmployeeID.SelectedValue.ToString())));
                string station = mycontroller.GetUserStationId(Employee.GetUserId());
                if (station == "admin")
                {

                }
                else
                {
                    int userStId = int.Parse(station);
                    if (!(userStId == 0 || userStId == station_id))
                    {
                        MessageBox.Show("You can't UPdate Employees From other stations", "Invalid Input");

                        return;
                    }
                }
                try
                {
                    mycontroller.AddEmpPhone(int.Parse(EmployeeID.Text), PhCode.Text, Phone.Text);
                    Employee.BindPhonesDataGrid();
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.ToString());
                    throw;
                }
            }
        }

        private void EmployeeID_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        private void BindEmployeesID()
        {
            DataTable dt = mycontroller.GetAllEmployees();
            if (dt != null)
            {

                EmployeeID.ItemsSource = dt.DefaultView;

            }
            else
            {

                EmployeeID.ItemsSource = null;
            }
        }
    }
}
