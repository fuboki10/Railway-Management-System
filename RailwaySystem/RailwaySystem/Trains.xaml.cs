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
    /// Interaction logic for Trains.xaml
    /// </summary>
    /// 

    public partial class Trains : Window
    {
        private int UserID;
        Controller ControllerObj;
        public Trains(int U)
        {
            ControllerObj = new Controller();

            InitializeComponent();
            UserID = U;
        }

        private void BindCoachYard()
        {
            DataTable dt = ControllerObj.GetCoachYard();
            CoachYardComboBox.ItemsSource = dt.DefaultView;
        }

        private void BindColorComboBox()
        {
            List<Utils.Color> colors = new List<Utils.Color>();
            // Available Colors
            colors.Add(new Utils.Color { color = "Black" });
            colors.Add(new Utils.Color { color = "White" });
            colors.Add(new Utils.Color { color = "Red" });
            colors.Add(new Utils.Color { color = "Green" });
            colors.Add(new Utils.Color { color = "Blue" });
            colors.Add(new Utils.Color { color = "Yellow" });
            colors.Add(new Utils.Color { color = "Orange" });
            colors.Add(new Utils.Color { color = "Pink" });
            colors.Add(new Utils.Color { color = "Grey" });

            ColorComboBox.ItemsSource = colors;
            ColorComboBox.DisplayMemberPath = "color";
            ColorComboBox.SelectedValuePath = "color";

            ColorComboBox.SelectedIndex = 0;
        }

        private void BindTrains()
        {
            DataTable dt = ControllerObj.GetAllTrains();
            TrainsID_ComboBox.ItemsSource = dt.DefaultView;
            TrainsDataGrid.ItemsSource = dt.DefaultView;
        }
        private void XClicked(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Canvas_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void HomeTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void GoHome()
        {
            string job = ControllerObj.GetUserJob(UserID);
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else
            {
                /*
                 * TODO
                 * BOOKING CLERK
                 * MANAGER 
                 * STATION MANAGER
                 */
                Welcome WelcomeWindow = new Welcome(UserID);
                WelcomeWindow.Show();
            }
            this.Close();
        }

        private void HomeButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoHome();
        }

        private void LogoutTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void Logout()
        {
            LoginPage LoginPage = new LoginPage();
            LoginPage.Show();
            this.Close();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            this.Logout();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            int id;
            if (TrainsID_ComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please select ID");
                return;
            }
            if (Int32.TryParse(TrainsID_ComboBox.SelectedValue.ToString(), out id))
            {
                ControllerObj.RemoveTrain(id);
                // Update 
                BindTrains();
            }
            
        }

        private void StatisticsTextButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStatistics();
        }

        private void GoStatistics()
        {
            throw new NotImplementedException();
        }

        private void StatisticsButton_Click(object sender, RoutedEventArgs e)
        {
            this.GoStatistics();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (ModelTextBox.Text == "")
            {
                MessageBox.Show("Please Enter Train Model");
                return;
            }
            string model = ModelTextBox.Text;

            if (No_SeatsTextBox.Text == "")
            {
                MessageBox.Show("Please Enter Train No Seats");
                return;
            }

            int No_Seats;

            if (!Int32.TryParse(No_SeatsTextBox.Text, out No_Seats))
            {
                MessageBox.Show("Please Enter No Seats");
                return;
            }

            if (No_CarsTextBox.Text == "")
            {
                MessageBox.Show("Please Enter Train No Cars");
                return;
            }

            int No_Cars;

            if (!Int32.TryParse(No_CarsTextBox.Text, out No_Cars))
            {
                MessageBox.Show("Please Enter No Cars");
                return;
            }

            if (SpeedTextBox.Text == "")
            {
                MessageBox.Show("Please Enter Train Speed");
                return;
            }

            int speed;
            if (!Int32.TryParse(SpeedTextBox.Text, out speed))
            {
                MessageBox.Show("Please Enter Speed");
                return;
            }

            if (ColorComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please Select Train Color");
                return;
            }

            string color = ColorComboBox.SelectedValue.ToString();

            if (CoachYardComboBox.SelectedValue == null)
            {
                MessageBox.Show("Please Select Coach Yard ID");
                return;
            }

            int Coach_Yard_ID = Int32.Parse(CoachYardComboBox.SelectedValue.ToString());

            string date = TrainDatePicker.SelectedDate.ToString();

            ControllerObj.InsertTrain(model, true, color, No_Seats, No_Cars, date, speed, 0, 0, Coach_Yard_ID, 0);

            // Update
            BindTrains();
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            BindTrains();
            BindColorComboBox();
            BindCoachYard();
            NameTextBox.Text = ControllerObj.GetUsername(UserID);
        }
    }
}
