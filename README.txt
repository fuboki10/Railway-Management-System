#Team Information
-Ahmed Walid Fathy 	    BN 12 sec 1
-Ali Abd Elhaleem Abou Zied BN 15 sec 2
-Mohamed Abou Bakr	    BN 6  sec 2
-Abd ElRahman Tarek	    BN 37 sec 1

# Project Description

#This project is a Railway Station Management System. 
The Railway has four kinds of employees 
1-Manager
2-Station Manager
3-Booking clerk
4-Driver
The first three in addition to the "Admin" can use the application to:
-enquire about the trains available on the basis of source and destination
-booking and cancellation of tickets 
-enquire about the status of the booked ticket, etc.

	The aim of case study is to design and develop a database maintaining:
-The records of different trains
-Train status, and passengers.
-Employees
-stations
-Passengers, there tickets and there subscribtions

#database
1-run create file
2-run script file

#How to use the application
-when you start the program the log in page will show up
-After successfully logging in you will be navigated to one of four dashboards depending on thekind of the user
1-"Admin DashBoard" from which you can do any of the available functionalities to the other user in addition to adding and deleteing other admins.
2-"Manager dashboard" from which you can do any of the manager functionalities described in the document.
3-"Station Manager Dashboard" from which you can do any of the station manager functionalities described in the document.
4-"Bookoing clerk Dashboard" from which you can do any of the booking clerk functionalities described in the document.
At the left side of the dashboard there are buttons that navigates you through the program

#Description of the database
There are 17 tables in the database
1,2-Coach_Yard, Repair_Yard Each one of them contains (its ID, the stationId that it belongs to, and the number of trains it can carry)
3- Employee (his ID, first name, last name, Birth_date, salary, Working hours, jobID(FK to Job), StationID(FK to Station)
4- Employee_Contact (Employee_ID(FK to Employee), His Email, city, State, Street)
5- Employee_Phone (Employee_ID(FK to Employee), country code, Phone number) 
//It is a table because an employee may have more than one phone number
6- Job (ID of the job, The job title)
7- Passenger (His ID, first name, last name)
8- Passenger_Contact (PassengerID (FK To Passenger), email, city, State, Street)
9- Passenger_Phone (PassengerID (FK To Passenger), code of the country, phone Number)
10-Passenger_Subscribtion (PassengerID (FK To Passenger), SubscriptionID, Expiration Date of the subscription)
11-Route (Source_ID (FK to Station), Destination_ID (FK to Station), Distance of the route)
//The route is a path between two stations
12-Station (ID, its name, its city, State, Street)
13-Subscribtion (ID, Fees to be paid, Class of the seats, number_of_trips it gives)
14-Ticket (ID, Class of the seat, its price, Booking date, Booking clerk that booked it, The passenger Id, The trip ID(FK to trip))
15-Train (ID, its model, Its status(0 if it needs to be repaired, 1 otherwise), colour, number of seats, maximum speed, number of carriages,manufacturing date, current driver ID(FK to Employee), repair_yard Id if it is in any,
coach_yard_Id if it is in any, Bought_BY(The id of the manager who bought it)
16-Trip (ID, Departure time, Arrival time, its Type, source_ID (starting station), destination id, Id of the train that is used, station managerID)
17-User "table of users who have access to the application"(Id of the user(PK), username, hashed password, EmployeeID(FK to Employee), IsAdmin (if equal to one the he is an admin))
#----------------------------------------------------------



