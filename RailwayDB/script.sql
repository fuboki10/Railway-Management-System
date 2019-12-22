USE [RailWaySystemDB]
GO
SET IDENTITY_INSERT [dbo].[Station] ON 

INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (1, N'Masr', N'Ramses', N'Cairo', 5)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (2, N'ElRaml', N'ElRaml', N'Alexandria', 7)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (3, N'ElAiat', N'ElAiat', N'Giza', 17)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (4, N'Siedy Gaber', N'Siedy Gaber', N'Alexandria', 21)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (5, N'ElMansouria', N'ElMansouria', N'Giza', 24)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (6, N'Aswan', N'Aswan', N'Aswan', 33)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (7, N'Oksor', N'Oksor', N'Oksor', 12)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (8, N'Kena', N'Kena', N'Kena', 83)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (9, N'Monofia', N'Ashmoun', N'Monofia', 13)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (10, N'Sers', N'Sers', N'Monofia', 27)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (11, N'Matrouh', N'Matrouh', N'Matrouh', 81)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (12, N'Sharkia', N'Sharkia', N'Sharkia', 91)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (13, N'Embaba', N'Embaba', N'Cairo', 74)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (14, N'Asiut', N'Asiut', N'Asiut', 74)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (15, N'Souhag', N'Souhag', N'Souhag', 31)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (16, N'Halayeb', N'Halayeb', N'Halayeb', 54)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (17, N'Shalateen', N'Shalateen', N'Shalateen', 24)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (18, N'Taba', N'Taba', N'Taba', 54)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (19, N'Kafr ElShiekh', N'Kafr ElShiekh', N'Kafr ElShiekh', 47)
INSERT [dbo].[Station] ([ID], [Name], [City], [State], [Street]) VALUES (20, N'Kafr ElDawar', N'Kafr ElDawar', N'Kafr ElShiekh', 47)
SET IDENTITY_INSERT [dbo].[Station] OFF
SET IDENTITY_INSERT [dbo].[Coach_Yard] ON 

INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (1, 1, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (2, 2, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (3, 3, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (4, 4, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (5, 5, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (6, 5, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (7, 6, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (8, 7, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (9, 8, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (10, 8, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (11, 9, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (12, 10, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (13, 11, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (14, 12, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (15, 13, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (16, 14, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (17, 15, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (18, 16, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (19, 18, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (20, 17, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (21, 17, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (22, 19, 4)
INSERT [dbo].[Coach_Yard] ([ID], [Station_ID], [Size]) VALUES (23, 20, 4)
SET IDENTITY_INSERT [dbo].[Coach_Yard] OFF
SET IDENTITY_INSERT [dbo].[Repair_Yard] ON 

INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (1, 1, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (2, 2, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (3, 3, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (4, 4, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (5, 5, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (6, 6, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (7, 6, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (8, 7, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (9, 8, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (10, 9, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (11, 10, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (12, 11, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (13, 12, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (14, 13, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (15, 14, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (16, 15, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (17, 16, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (18, 18, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (19, 17, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (20, 19, 4)
INSERT [dbo].[Repair_Yard] ([ID], [Station_ID], [Size]) VALUES (21, 20, 4)
SET IDENTITY_INSERT [dbo].[Repair_Yard] OFF
INSERT [dbo].[Job] ([ID], [Job_Description]) VALUES (3, N'Booking Clerk')
INSERT [dbo].[Job] ([ID], [Job_Description]) VALUES (4, N'Driver')
INSERT [dbo].[Job] ([ID], [Job_Description]) VALUES (1, N'Manager')
INSERT [dbo].[Job] ([ID], [Job_Description]) VALUES (2, N'Station Manager')
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (1, 2, 200)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (2, 4, 20)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (3, 5, 45)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (4, 5, 250)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (5, 6, 900)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (6, 7, 150)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (7, 8, 150)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (8, 9, 150)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (9, 10, 25)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (10, 11, 450)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (11, 12, 450)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (12, 13, 180)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (13, 14, 400)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (14, 15, 100)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (15, 16, 500)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (16, 17, 75)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (17, 18, 1000)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (18, 19, 600)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (19, 20, 15)
INSERT [dbo].[Route] ([Source_ID], [Destination_ID], [Distance]) VALUES (20, 1, 150)
SET IDENTITY_INSERT [dbo].[Train] ON 

INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (1, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-11' AS Date), NULL, NULL, 1, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (2, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-13' AS Date), NULL, NULL, 2, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (3, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-26' AS Date), NULL, NULL, 3, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (4, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-11' AS Date), NULL, NULL, 4, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (5, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-11' AS Date), NULL, NULL, 5, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (6, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-11' AS Date), NULL, NULL, 6, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (7, N'DK10', 1, N'Black', 100, 200, 5, CAST(N'2014-03-09' AS Date), NULL, NULL, 7, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (8, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 8, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (9, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 9, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (10, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 10, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (11, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 11, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (12, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 12, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (13, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 13, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (14, N'BT3', 1, N'Yellow', 200, 150, 8, CAST(N'2014-03-09' AS Date), NULL, NULL, 14, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (15, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 15, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (16, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 16, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (17, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 18, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (18, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 17, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (19, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 19, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (20, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 20, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (21, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 21, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (22, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 22, NULL)
INSERT [dbo].[Train] ([ID], [Model], [Status], [Color], [No_Seats], [Speed], [No_Cars], [Date], [Driver_ID], [Repair_Yard_ID], [Coach_Yard_ID], [BoughtByID]) VALUES (23, N'CK69', 1, N'Grey', 300, 120, 20, CAST(N'2014-06-09' AS Date), NULL, NULL, 23, NULL)
SET IDENTITY_INSERT [dbo].[Train] OFF
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([ID], [Username], [PasswordHash], [EmployeeID], [IsAdmin], [Salt]) VALUES (1, N'admin', 0xB372F63C779F5F47E6A82F4E03BA45504CE6E0A57A5C6DD0F4B32864C3BA0400E4E1B0D211A6E43F3CF9229F9C407D2F7964B1711A024655FF113897959D35CA, NULL, 1, N'd6fbb035-8e2d-4a31-93f8-fb4ca5ee35c1')
SET IDENTITY_INSERT [dbo].[USER] OFF
