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
        private string job;
        private int EmpID;
        private int StationID;
        public Trains(int U)
        {
            ControllerObj = new Controller();

            InitializeComponent();
            UserID = U;
            job = ControllerObj.GetUserJob(UserID);
                
            if (job == "Station Manager")
            {
                ColorComboBox.Visibility = Visibility.Hidden;
                AddTrains.Visibility = Visibility.Hidden;
                ModelTextBox.Visibility = Visibility.Hidden;
                SpeedTextBox.Visibility = Visibility.Hidden;
                CoachYardComboBox.Visibility = Visibility.Hidden;
                ModelLabel.Visibility = Visibility.Hidden;
                ColorLabel.Visibility = Visibility.Hidden;
                DateLabel.Visibility = Visibility.Hidden;
                CoachYardLabel.Visibility = Visibility.Hidden;
                AddButton.Visibility = Visibility.Hidden;
                DeleteButton.Visibility = Visibility.Hidden;
                No_CarsTextBox.Visibility = Visibility.Hidden;
                No_SeatsTextBox.Visibility = Visibility.Hidden;
                TrainDatePicker.Visibility = Visibility.Hidden;
                label1.Visibility = Visibility.Hidden;
                label2.Visibility = Visibility.Hidden;
                label3.Visibility = Visibility.Hidden;
            }
            if (job != "Admin" && job != "Manager")
            {
                EmpID = ControllerObj.get_emp_id_userId(UserID);
                StationID = ControllerObj.EmployeeStation(EmpID);
            }
        }

        private void BindCoachYard()
        {
            DataTable dt = ControllerObj.GetAllCyards();
            if (dt != null)
                CoachYardComboBox.ItemsSource = dt.DefaultView;
            else
                CoachYardComboBox.ItemsSource = null;
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
            DataTable dt;
            if (job == "Station Manager")
            {
                dt = ControllerObj.GetAllTrains(StationID);
            }
            else
                dt = ControllerObj.GetAllTrains();
            if (dt != null)
            {
                TrainsID_ComboBox.ItemsSource = dt.DefaultView;
                TrainsDataGrid.ItemsSource = dt.DefaultView;
            }
            else
            {
                TrainsID_ComboBox.ItemsSource = null;
                TrainsDataGrid.ItemsSource = null;
            }
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
            if (job == "Admin")
            {
                AdminDashboard AdminDashboard = new AdminDashboard(UserID);
                AdminDashboard.Show();
            }
            else if (job == "Station Manager")
            {
                StManagerDashboard stManager = new StManagerDashboard(UserID);
                stManager.Show();
            }
            else if (job == "Manager")
            {
                ManagerDashboard M = new ManagerDashboard(UserID);
                M.Show();
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
            TrainStatistics1 TS = new TrainStatistics1();
            TS.Show();
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

            int ret = ControllerObj.InsertTrain(model, true, color, No_Seats, No_Cars, date, speed, 0, 0, Coach_Yard_ID, 0);
            if (ret == 0)
            {
                MessageBox.Show("Coach Yard Is Full");
                return;
            }
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

        private void ChangeStatusButton_Click(object sender, RoutedEventArgs e)
        {
            if (TrainsID_ComboBox.SelectedValue == null)
            {
                MessageBox.Show("Enter Train ID");
            }
            else
            {
                int trainID = Int32.Parse(TrainsID_ComboBox.SelectedValue.ToString());
                int ret = ControllerObj.ChangeTrainStatus(trainID);
                if (ret == 0)
                {
                    MessageBox.Show("Error : Don't Have Enough Yards");
                }
                else 
                {
                    BindTrains();
                } 
            }
        }
    }
}
