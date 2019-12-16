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

        public DataTable GetAllEmployees()
        {
            string StoredProceureName = StoredProcedures.GetAllEmps;
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
        public int ChangePhone(int ID, int phone, int code)
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
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }
    }
}
