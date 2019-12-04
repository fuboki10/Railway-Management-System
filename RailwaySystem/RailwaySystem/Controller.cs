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

        public int AddUser(string UserName, string Password)
        {
            string StoredProcedureName = StoredProcedures.InsertUser;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@UserName", UserName);
            Parameters.Add("@Password", Password);
            
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
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
    }
}
