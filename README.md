# Project Description

This project is about creating the database of Railway Management System. 

The railway management system facilitates the passengers to enquire about the trains available on the basis of source and destination, booking and cancellation of tickets, enquire about the status of the booked ticket, etc. The aim of case study is to design and develop a database maintaining the records of different trains, train status, and passengers. The record of train includes its number, name, source, destination, and days on which it is available, whereas record of train status includes dates for which tickets can be booked, total number of seats available, and number of seats already booked. 

Passengers can book their tickets for the train in which seats are available. For this, passenger has to provide the desired train number and the date for which ticket is to be booked. Before booking a ticket for a passenger, the validity of train number and booking date is checked. Once the train number and booking date are validated, it is checked whether the seat is available. If yes, the ticket is booked with confirm status and corresponding ticket ID is generated which is stored along with other details of the passenger. The ticket once booked can be cancelled at any time. For this, the passenger has to provide the ticket ID (the unique key). The ticket ID is searched and the corresponding record is deleted. With this, the first ticket with waiting status also gets confirmed.

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

# How To Create Database

1-run create file

2-run script file


# How to use the application

-when you start the program the log in page will show up

-After successfully logging in you will be navigated to one of four dashboards depending on thekind of the user

1-"Admin DashBoard" from which you can do any of the available functionalities to the other user in addition to adding and deleteing other admins.

2-"Manager dashboard" from which you can do any of the manager functionalities described in the document.

3-"Station Manager Dashboard" from which you can do any of the station manager functionalities described in the document.

4-"Bookoing clerk Dashboard" from which you can do any of the booking clerk functionalities described in the document.

At the left side of the dashboard there are buttons that navigates you through the program


# Description of the database

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



# ScreenShots

![Login Page 12_22_2019 7_13_08 AM](https://user-images.githubusercontent.com/35429211/71317951-2141b180-2492-11ea-97f2-0d6e99749dc3.png)



![AdminDashboard 12_22_2019 7_13_17 AM](https://user-images.githubusercontent.com/35429211/71317959-4b936f00-2492-11ea-861b-eb35dc516f33.png)


![Employees 12_22_2019 7_13_28 AM](https://user-images.githubusercontent.com/35429211/71317960-577f3100-2492-11ea-8325-c5338da7f023.png)
