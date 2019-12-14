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
