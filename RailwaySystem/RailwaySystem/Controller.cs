using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace RailwaySystem
{
    public class Controller
    {
        DBManager dbMan;
        public Controller()
        {
            dbMan = new DBManager();
        }

        public void TerminateConnection()
        {
            dbMan.CloseConnection();
        }
      
        public int InsertTrip(string Dept_Time, string Arr_Time, int type, int Destination_ID, int Source_ID,
                               int Train_ID, int Driver_ID, int St_Manager_ID, int NumClassA, int PriceClassA,
                                int NumClassB, int PriceClassB, int NumClassC, int PriceClassC)
        {
            string StoredProceureName = StoredProcedures.InsertTrip;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Dept_Time", Dept_Time); 
	        Parameters.Add("@Arr_Time", Arr_Time);
	        Parameters.Add("@Type", type); 
	        Parameters.Add("@Destination_ID", Destination_ID);
	        Parameters.Add("@Source_ID", Source_ID);
	        Parameters.Add("@Train_ID", Train_ID);
	        Parameters.Add("@DriverID", Driver_ID);
	        Parameters.Add("@St_Manager_ID", St_Manager_ID);
	        Parameters.Add("@NumClassA", NumClassA);
            Parameters.Add("@PriceClassA", PriceClassA);
            Parameters.Add("@NumClassB", NumClassB);
            Parameters.Add("@PriceClassB", PriceClassB);
            Parameters.Add("@NumClassC", NumClassC);
            Parameters.Add("@PriceClassC", PriceClassC);
            return dbMan.ExecuteNonQuery(StoredProceureName, Parameters);
        }

        public DataTable GetAllEmployees()
        {
            string StoredProceureName = StoredProcedures.GetAllEmps;
            return dbMan.ExecuteReader(StoredProceureName, null);
        }

        public DataTable GetAllJobs(int ID)
        {
            string StoredProceureName = StoredProcedures.GetAllJobs;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            return dbMan.ExecuteReader(StoredProceureName, Parameters);
        }

        public int CheckUsername(string Username)
        {
            string StoredProceureName = StoredProcedures.CheckUsername;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Username", Username);
            return Int32.Parse(dbMan.ExecuteScalar(StoredProceureName, Parameters).ToString());
        }

        public DataTable GetAllEContacts()
        {
            string StoredProceureName = StoredProcedures.GetAllEContacts;
            return dbMan.ExecuteReader(StoredProceureName, null);
        }

        public int InsertTrain(string Model, bool Status, string Color, int No_Seats,
            int No_Cars, string Date, int Speed, int Driver_ID, int Repair_Yard_ID, int Coach_Yard_ID, int BoughtByID)
        {
            string StoredProcedureName = StoredProcedures.InsertTrain;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Model", Model);
            Parameters.Add("@Status", Status);
            Parameters.Add("@No_Seats", No_Seats);
            Parameters.Add("@No_Cars", No_Cars);
            Parameters.Add("@Color", Color);
            Parameters.Add("@Date", Date);
            Parameters.Add("@Speed", Speed);
            
            if (Driver_ID != 0)
                Parameters.Add("@Driver_ID", Driver_ID);

            if (Repair_Yard_ID != 0)
                Parameters.Add("@Repair_Yard_ID", Repair_Yard_ID );


            if (Coach_Yard_ID != 0)
                Parameters.Add("@Coach_Yard_ID", Coach_Yard_ID);


            if (BoughtByID != 0)
                Parameters.Add("@BoughtByID", BoughtByID);


            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        
        public int RemoveTrain(int ID)
        {
            string StoredProcedureName = StoredProcedures.RemoveTrain;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public int AddAdmin(string UserName, string Password)
        {
            string StoredProcedureName = StoredProcedures.InsertUser;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@UserName", UserName);
            Parameters.Add("@Password", Password);
            Parameters.Add("@EmployeeID", null);
            Parameters.Add("@IsAdmin", true);
            DataTable dt = dbMan.ExecuteReader(StoredProcedureName, Parameters);
            if (dt.Rows[0]["response"].ToString() == "Success")
            {
                return Int32.Parse(dt.Rows[0]["ID"].ToString());
            }
            return 0;
        }

        public DataTable GetCoachYard()
        {
            string StoredProcedureName = StoredProcedures.GetCoachYard;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }

        public DataTable GetAllTrains()
        {
            string StoredProcedureName = StoredProcedures.GetAllTrains;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable GetAllTrips()
        {
            string StoredProcedureName = StoredProcedures.GetAllTrips;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable GetAllPassengers()
        {
            string StoredProcedureName = StoredProcedures.GetAllPassengers;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable Login(string UserName, string Password)
        {
            string StoredProcedureName = StoredProcedures.Login;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@UserName", UserName);
            Parameters.Add("@Password", Password);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public string GetUsername(int ID)
        {
            string StoredProcedureName = StoredProcedures.GetUsername;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters).ToString();
        }
        public string GetUserJob(int ID)
        {
            string StoredProcedureName = StoredProcedures.GetUserJob;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@UserID", ID);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters).ToString();
        }
        public string GetUserStationId(int ID)
        {
            string StoredProcedureName = StoredProcedures.GetUserStationId;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@UserID", ID);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters).ToString();
        }
        
        
    public int DeleteEmployee(int ID)
    {
        string StoredProcedureName = StoredProcedures.DeleteEmployee;
        Dictionary<string, object> Parameters = new Dictionary<string, object>();
        Parameters.Add("@id", ID);
        DeleteEmployeeContact(ID);
        return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
    }
    public int UpdateEmployeeSalary(int ID, int salary)
    {
        string StoredProcedureName = StoredProcedures.UpdateSalary;
        Dictionary<string, object> Parameters = new Dictionary<string, object>();
        Parameters.Add("@id", ID);
        Parameters.Add("@sal", salary);
        return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
    }
        public int ChangeTripTime(int ID, string arrdate, string depdate)
        {
            string StoredProcedureName = StoredProcedures.ChangeTripTime;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", ID);
            Parameters.Add("@arr", arrdate);
            Parameters.Add("@dep", depdate);

            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int ChangeTripClass(int ID, int clas)
        {
            string StoredProcedureName = StoredProcedures.ChangeTripCalss;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", ID);
            Parameters.Add("@class", clas);
           

            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int AddEmployee(string FirstName, string LastName, string date, int salary, int hours, int jobid, int stid,
                               string Username=null, string Password=null, bool IsAdmin=false)
    {
        string StoredProcedureName = StoredProcedures.AddEmployee;
        Dictionary<string, object> Parameters = new Dictionary<string, object>();
        Parameters.Add("@fname", FirstName);
        Parameters.Add("@lname", LastName);
        Parameters.Add("@bd", date);
        Parameters.Add("@salary", salary);
        Parameters.Add("@working_hours", hours);
        Parameters.Add("@jobid", jobid);
        Parameters.Add("@station_id", stid);
        Parameters.Add("@IsAdmin", IsAdmin);
        Parameters.Add("@Username", Username);
        Parameters.Add("@Password", Password);


        return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
    }
    public int AddEmpContact(int EmpID, string City, string Email, string State, string Street)
    {
        string StoredProcedureName = StoredProcedures.AddEContact;
        Dictionary<string, object> Parameters = new Dictionary<string, object>();
        Parameters.Add("@id", EmpID);
        Parameters.Add("@city", City);
        Parameters.Add("@state", State);
        Parameters.Add("@email", Email);
        Parameters.Add("@street", Street);
        return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
    }
        public int ChangeEmpContact(int EmpID, string City, string Email, string State, string Street)
        {
            string StoredProcedureName = StoredProcedures.UpdateEContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", EmpID);
            Parameters.Add("@city", City);
            Parameters.Add("@state", State);
            Parameters.Add("@email", Email);
            Parameters.Add("@street", Street);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public DataTable GetAllAdmins()
        {
            string StoredProcedureName = StoredProcedures.GetAllAdmins;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }

        public int DeleteUser(int ID)
        {
            string StoredProcedureName = StoredProcedures.DeleteUser;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int ChangeUsername(int ID, string Username)
        {
            string StoredProcedureName = StoredProcedures.ChangeUsername;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            Parameters.Add("@Username", Username);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int ChangePhone(int ID, string phone, string code)
        {
            string StoredProcedureName = StoredProcedures.ChangePhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@code", code);
            Parameters.Add("@id", ID);
            Parameters.Add("@phone", phone);


            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int ChangeEmail(int ID, string email)
        {
            string StoredProcedureName = StoredProcedures.ChangeEmail;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", ID);
            Parameters.Add("@email", email);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int ChangePassword(int ID, string OldPassword, string NewPassword)
        {
            string StoredProcedureName = StoredProcedures.ChangePassword;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@ID", ID);
            Parameters.Add("@OldPassword", OldPassword);
            Parameters.Add("@NewPassword", NewPassword);
            return Int32.Parse(dbMan.ExecuteScalar(StoredProcedureName, Parameters).ToString());
        }

        public DataTable GetUserAdress(int id)
        {
            string StoredProcedureName = StoredProcedures.GetUserAdress;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@userid", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable GetUserPhones(int id)
        {
            string StoredProcedureName = StoredProcedures.GetUserPhones;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@userid", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable GetEAdress(int id)
        {
            string StoredProcedureName = StoredProcedures.GetEAddress;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable GetEPhones(int id)
        {
            string StoredProcedureName = StoredProcedures.GetEphones;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public object AddPassenger(string FirstName, string LastName)
        {
            string StoredProcedureName = StoredProcedures.AddPassenger;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@fname", FirstName);
            Parameters.Add("@lname", LastName);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters);
        }
        public DataTable GetPContact(int PassengerID)
        {
            string StoredProcedureName = StoredProcedures.GetPContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            
            Parameters.Add("@PassengerID", PassengerID);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public int AddPContact(int PassengerID,string City,string Email,string State, string Street)
        {
            string StoredProcedureName = StoredProcedures.AddPContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            Parameters.Add("@City", City);
            Parameters.Add("@State", State);
            Parameters.Add("@Email", Email);
            Parameters.Add("@Street", Street);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        
        public object DeletePContact(string Email)
        {
            string StoredProcedureName = StoredProcedures.DeletePContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();

            Parameters.Add("@Email", Email);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters);
        }

        public object EditPContact( string City, string Email, string State, string Street)
        {
            string StoredProcedureName = StoredProcedures.EditPContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@City", City);
            Parameters.Add("@State", State);
            Parameters.Add("@Email", Email);
            Parameters.Add("@Street", Street);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters);
        }

        public int AddUserphone(int id, string code, string number)
        {
            string StoredProcedureName = StoredProcedures.InsetUserPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@userid", id);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int DeleteUserPhone(int id, string phone)
        {
            string StoredProcedureName = StoredProcedures.DeleteUserPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            Parameters.Add("@phone", phone);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public int InsertStation(string name, string city, string state, int street)
        {
            string StoredProcedureName = StoredProcedures.InsertStation;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@name", name);
            Parameters.Add("@city", city);
            Parameters.Add("@state", state);
            Parameters.Add("@street", street);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        
        public int UpdateStation(string old_name, String new_name)
        {
            string StoredProcedureName = StoredProcedures.UpdateStation;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@old_name", old_name);
            Parameters.Add("@new_name", new_name);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public DataTable GetallStations()
        {
            string StoredProcedureName = StoredProcedures.GetAllStations;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public int DeletePPhone( int PassengerID, int code, int number)
        {
            string StoredProcedureName = StoredProcedures.DeletePPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int DeleteEmpPhone(int id, string code, string number)
        {
            string StoredProcedureName = StoredProcedures.DeleteEmpPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int EditPPhone(int PassengerID, int code, int number)
        {
            string StoredProcedureName = StoredProcedures.EditPPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int EditEmpPhone(string fname, string lname, int code, int number)
        {
            string StoredProcedureName = StoredProcedures.ChangeEmpPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@fname", fname);
            Parameters.Add("@lname", lname);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int AddPPhone(int PassengerID, int code, int number)
        {
            string StoredProcedureName = StoredProcedures.AddPPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int AddEmpPhone(int id, string code, string number)
        {
            string StoredProcedureName = StoredProcedures.Insert_Emp_Phone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            Parameters.Add("@number", number);
            Parameters.Add("@code", code);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public DataTable VeiwPhones( int PassengerID)
        {
            string StoredProcedureName = StoredProcedures.veiwPPhone;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable Getsubs()
        {
            string StoredProcedureName = StoredProcedures.GetAllSubs;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public int InsertPsub(int PassengerID, int SUBID, string expdate)
        {
            string StoredProcedureName = StoredProcedures.InsertPsub;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@PassengerID", PassengerID);
            Parameters.Add("@SubID", SUBID);
            Parameters.Add("@expire", expdate);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        // iscoach is a boolean to determine the kind of the yard (if not coach then repair)
        public int InsertYard(int stationid, int size, bool iscoach)
        {
            string StoredProcedureName;
            if (iscoach)
            {
                StoredProcedureName = StoredProcedures.AddCoachYard;
            }
            else
            {
                StoredProcedureName = StoredProcedures.AddRepairYard;
            }
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@station_id", stationid);
            Parameters.Add("@size", size);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public DataTable getCyards(int id)
        {
            string StoredProcedureName = StoredProcedures.GetCoachYard;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable GetRyards(int id)
        {
            string StoredProcedureName = StoredProcedures.GetRepairYard;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable GetAllCyards()
        {
            string StoredProcedureName = StoredProcedures.GetAllCyards;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable GetAllRyards()
        {
            string StoredProcedureName = StoredProcedures.GetAllRyards;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }

        public int UpdateCSize(int id, int size)
        {
            string StoredProcedureName = StoredProcedures.UpdateCoachSize;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            Parameters.Add("@size", size);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int UpdateRSize(int id, int size)
        {
            string StoredProcedureName = StoredProcedures.UpdateRepSize;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            Parameters.Add("@size", size);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int RemoveCyard(int id)
        {
            string StoredProcedureName = StoredProcedures.RemoveCoachYard;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public int RemoveRyard(int id)
        {
            string StoredProcedureName = StoredProcedures.RemoveRepairYard;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public DataTable GetSoucre()
        {
            string StoredProcedureName = StoredProcedures.get_source;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable GetDest(int id)
        {
            string StoredProcedureName = StoredProcedures.get_dest;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }

        public DataTable GetAllEmpPhones()
        {
            string StoredProcedureName = StoredProcedures.GetAllEmpPhones;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }

        public int DeleteEmployeeContact(int ID)
        {
            string StoredProcedureName = StoredProcedures.DeleteEmpContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@id", ID);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public DataTable unassin_Trains()
        {
            string StoredProcedureName = StoredProcedures.Unassign_Trains;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
        public DataTable GetAllEmployeePhones()
        {
            string StoredProceureName = StoredProcedures.GetAllEmpPhones;
            return dbMan.ExecuteReader(StoredProceureName, null);
        }
        public int Add_subscrition(int fees, string c, int tno)
        {
            string StoredProcedureName = StoredProcedures.Add_Subscription;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Fees", fees);
            Parameters.Add("@Class", c);
            Parameters.Add("@No_Trips", tno);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
        public object GetDriver(int Tid)
        {
            string StoredProcedureName = StoredProcedures.EditPContact;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Tid", Tid);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters);
        }
        public DataTable GetAllDrivers()
        {
            string StoredProcedureName = StoredProcedures.GetAllDrivers;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }
    }

}
