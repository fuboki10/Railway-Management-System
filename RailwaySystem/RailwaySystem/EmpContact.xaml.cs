﻿using System;
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
    /// Interaction logic for EmpContact.xaml
    /// </summary>
    public partial class EmpContact : UserControl
    {
        Employees Employee;
        public EmpContact(Employees E)
        {
            InitializeComponent();
            Employee = E;
        }

        private void AddContactButton_Click(object sender, RoutedEventArgs e)
        {
            AddEmpContact A = new AddEmpContact(Employee);
            Employee.Addbuttons(A);
        }

        private void DeleteContactButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void EditContactButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}