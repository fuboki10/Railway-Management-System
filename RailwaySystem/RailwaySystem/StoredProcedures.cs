using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RailwaySystem
{
    public class StoredProcedures
    {
        // User procedures
        public static string InsertUser = "InsertUser";
        public static string GetUserStationId = "GetUserstId";
        public static string GetUserStationName = "GetUserStationName";
        public static string GetUsername = "GetUsername";
        public static string DeleteUser = "DeleteUser";
        public static string GetUserJob = "GetUserJob";
        public static string ChangeUsername = "ChangeUsername";
        public static string ChangePassword = "ChangePassword";
        public static string GetUserAdress = "GetUserAddress";
        public static string GetUserPhones = "GetUserPhones";
        public static string DeleteUserPhone = "DeleteUserPhone";
        public static string InsetUserPhone = "InsetUserPhone";
        public static string CheckUsername = "CheckUsername";

        // Admin procedures
        public static string Login = "Login";
        public static string GetAllAdmins = "GetAllAdmins";

        // Trains procedures
        public static string RemoveTrain = "RemoveTrain";
        public static string InsertTrain = "InsertTrain";
        public static string GetAllTrains = "GetAllTrains";
        public static string GetNoSeats = "GetNoSeats";

        // Passenger Procedures
        public static string AddPassenger = "InsertPassenger";
        public static string AddPContact = "AddPContact";
        public static string GetPContact = "GetPContact";
        public static string DeletePContact = "DeletePContact";
        public static string EditPContact = "EditPContact";
        public static string GetAllPassengers = "GetAllPassengers";
        public static string DeletePPhone = "DeletePPhone";
        public static string EditPPhone = "EditPPhone";
        public static string AddPPhone = "AddPPhone";
        public static string veiwPPhone = "VeiwPPhone";
        public static string Unassign_Trains = "Unassign_Trains";
        public static string GetAllSubs = "GetAllSubs";
        public static string InsertPsub = "InsertPsub";
        public static string TicketID = "getticketatt";
        public static string TicketPrice = "getticketprice";
        public static string ConnectTicket = "connectTicket";


        // Employee procedures

        public static string Insert_Emp_Phone = "Insert_Emp_Phone";
        public static string DeleteEmployee = "DeleteEmployee";
        public static string AddEmployee = "Insert_Emp";
        public static string AddEContact = "AddEmpContact";
        public static string UpdateEContact = "UpdateEmpContact";
        public static string ChangePhone = "ChangeEmpPhone";
        public static string ChangeEmpPhone = "EditEmpPhone";
        public static string GetEAddress = "GetEAddress";
        public static string GetEphones = "GetEphones";
        public static string GetAllEContacts ="GetAllEContacts";
        public static string ChangeEmail = "ChangeEmpEmail";
        public static string GetAllEmps = "getAllEmps";
        public static string UpdateSalary = "UpdateSalary";
        public static string GetAllJobs = "GetAllJobs";
        public static string GetEmployeeStationId = "GetEmployeeStID";
        public static string DeleteEmpContact = "DeleteEmpContact";
        public static string GetAllEmpPhones = "GetAllEmpPhones";
        public static string DeleteEmpPhone = "DeleteEmpPhone";
        public static string GetAllDrivers = "GetAllDrivers";
        public static string EmployeeStation = "EmployeeStation";
        public static string get_emp_id_userId = "get_emp_id_userId";


        // Trips procedures
        public static string ChangeTripTime = "ChangeTripDate";
        public static string ChangeTripCalss = "ChangeTripClass";
        public static string GetAllTrips = "GetAllTrips";
        public static string InsertTrip = "InsertTrip";
        public static string Add_Subscription = "Add_Subscription";
        
        // Station procedures
        public static string InsertStation = "InsertStation";
        public static string GetAllStations = "GetAllStations";
        public static string UpdateStation = "UpdateStation";
        public static string get_source = "get_source";         // for the trips
        public static string get_dest = "get_dest";

        // Yards Procedures
        public static string AddCoachYard = "AddCoachYard";
        public static string AddRepairYard = "AddRepairYard";
        public static string GetCoachYard = "GetCoachYard";
        public static string GetRepairYard = "GetRepairYard";
        public static string UpdateCoachSize = "UpdateCoachSize";
        public static string UpdateRepSize = "UpdateRepSize";
        public static string GetAllRyards = "GetAllRyards";
        public static string GetAllCyards = "GetAllCyards";
        public static string RemoveCoachYard = "RemoveCoachYard";
        public static string RemoveRepairYard = "RemoveRepairYard";

        // Routes Procedures
        public static string AddRoute = "AddRoute";
        // Subscription
        public static string GetAllSubscriptions = "GetAllSubscriptions";

    }
}
