﻿using System;
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
    /// Interaction logic for AddTrip.xaml
    /// </summary>
    public partial class AddTrip : UserControl
    {
        Controller c;
        Trips trip;
        TimeControl TC;
        public AddTrip(Trips T)
        {
            InitializeComponent();
            c = new Controller();
            trip = T;
            //this.newButtons.Children.Clear();
            TC = new TimeControl();
            TC.Name = "DepTime";
            TC.Width = 100;
            TC.Height = 24;
            TC.Margin = new Thickness(-400, -120, 0, 0);
            this.newButtons.Children.Add(TC);

            DataTable dt = c.GetSoucre();
            trip.BindTripsGrid();
            if (dt != null)
            {
                source.ItemsSource = dt.DefaultView;
                source.DisplayMemberPath = "Name";
                source.SelectedValuePath = "ID";
                source.SelectedIndex = 1;
                source.SelectedIndex = 0;
            }
            else
            {
                source.ItemsSource = null;
            }
            
            BindTrains();
            BindDrivers();
        }

        private void BindTrains()
        {
            if (source.Text != "")
            {
                DataTable dt = c.unassin_Trains((int)source.SelectedValue);
                if (dt != null)
                {
                    train.ItemsSource = dt.DefaultView;
                    train.DisplayMemberPath = "Model";
                    train.SelectedValuePath = "ID";
                    train.SelectedIndex = 1;
                    train.SelectedIndex = 0;
                }
                else
                {
                    train.ItemsSource = null;
                }
            }
        }

        private void BindDrivers()
        {
            DataTable dt = c.GetAllDrivers();
            if (dt != null)
            {
                Driver.ItemsSource = dt.DefaultView;
                Driver.DisplayMemberPath = "name";
                Driver.SelectedValuePath = "ID";
            }
            else
            {
                Driver.ItemsSource = null;
            }
        }
        private void Add_Click(object sender, RoutedEventArgs e)
        {
            DateTime dep_time = TC.DateTimeValue.Value;
            //source.SelectedValue, dest.SelectedValue, arr.SelectedDate.ToString(), dep.SelectedDate.ToString(), type.Text, train.SelectedValue
            if (source.Text == "" || dest.Text == "" || dep.Text == "" || type.Text == "" || train.Text == ""|| Driver.Text == "")
            {
                System.Windows.MessageBox.Show("Please enter the required data");
                return;
            }
            else if (priceA.Text == "" || priceB.Text == "" || priceC.Text == "" || classA.Text == "" || classB.Text == "" || classC.Text == "") 
            {
                System.Windows.MessageBox.Show("Please enter the required data");
                return;
            }
            dep.Text = dep.Text.Replace('/', '-');
            int pA, pB, pC, CA, CB, CC;
            pA = Convert.ToInt32(priceA.Text);
            pB = Convert.ToInt32(priceB.Text);
            pC = Convert.ToInt32(priceC.Text);
            CA = Convert.ToInt32(classA.Text);
            CB = Convert.ToInt32(classB.Text);
            CC = Convert.ToInt32(classC.Text);

            
            int train_id = (int)train.SelectedValue;
            int seats = (int)c.GetNoSeats(train_id);

            if ((CA + CB + CC) > seats)
            {
                Xceed.Wpf.Toolkit.MessageBox.Show("The sum of the classes numbers should equal to the number of seats of the selected train");
                return;
            }

            int driver = (int)Driver.SelectedValue;

            int x;
            DateTime result = dep.SelectedDate.Value.Date.Add(dep_time.TimeOfDay);
            Console.WriteLine(dep_time);
            Console.WriteLine(dep);
            Console.WriteLine(result);
            x = c. InsertTrip(result.ToString(), Convert.ToInt32(type.Text), (int)dest.SelectedValue, (int)source.SelectedValue,
               train_id, driver, trip.UserID, CA, pA, CB, pB, CC, pC);
            if (x == 0)
            {
                System.Windows.MessageBox.Show("Something Went wrong");
            }
            else
            {
                System.Windows.MessageBox.Show("Successful");
                trip.BindTripsGrid();
                BindDrivers();
                BindTrains();
            }
        }


        private void bDest(object sender, SelectionChangedEventArgs e)
        {
            bindDest();
            if (source.Text != "")
            {
                BindTrains();
            }
        }
        private void bindDest()
        {
            if (source.Text == "")
            {
                return;
            }
            DataTable dt = c.GetDest((int)source.SelectedValue);
            if (dt != null)
            {
                dest.ItemsSource = dt.DefaultView;
                dest.DisplayMemberPath = "Name";
                dest.SelectedValuePath = "ID";
            }
            else
            {
                dest.ItemsSource = null;
            }
        }

        private void train_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (train.SelectedValue == null)
            {
                seats.Text = "No. of seats";
            }
            else
                seats.Text = Convert.ToString(c.GetNoSeats((int)train.SelectedValue));  
        }
    }
}
