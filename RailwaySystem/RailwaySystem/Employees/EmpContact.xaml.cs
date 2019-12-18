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
    /// Interaction logic for EmpContact.xaml
    /// </summary>
    public partial class EmpContact : UserControl
    {
        Controller mycontroller;
        Employees Employee;
        public EmpContact(Employees E)
        {
            InitializeComponent();
            mycontroller = new Controller();
            Employee = E;
            Employee.BindContactsDataGrid();

        }

        private void AddContactButton_Click(object sender, RoutedEventArgs e)
        {
            AddEmpContact A = new AddEmpContact(Employee);
            Employee.Addbuttons(A);
        }

        

        private void EditContactButton_Click(object sender, RoutedEventArgs e)
        {
            EditEmpContact E = new EditEmpContact(Employee);
            Employee.Addbuttons(E);
        }
    }
}
