--Rick Vang
--Exercise 2B

--1) Building, COunt all buildings
SELECT COUNT(BuildingId) AS [Count All Buildings]
FROM     Building


--2)Buildings, Count. Filter all buildings in Winona
SELECT COUNT(*) AS [Counts Building in Winona]
FROM     Building
GROUP BY City
HAVING (City = N'winona')


--3)Apartment, Average Rent all Apartments. 
SELECT AVG(Rent) AS [Average Rent]
FROM     Apartment


--4)Apartment, Total Rent. Filter by Apartments in building 1
SELECT SUM(Rent) AS [Total Rent]
FROM     Apartment
GROUP BY BuildingId
HAVING (BuildingId = 1)


--5)Apartment, cheapest price. Filter by Building2
SELECT MIN(Rent) AS [Building 2 Cheapest Rent]
FROM     Apartment
GROUP BY BuildingId
HAVING (BuildingId = 2)


--6)Apartment, smallest size, avg size, largest size. Building 1
SELECT MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Average Size], MAX(SquareFeet) AS [Largest Size]
FROM     Apartment
GROUP BY BuildingId
HAVING (BuildingId = 1)


--7)LineItem, cheapest price. Filter by garage.
SELECT MIN(Amount) AS [Cheapest Price]
FROM     LineItem
GROUP BY Description
HAVING (Description = N'Garage')


--8) Lineitem, Total amount billed. Filter by Gas
SELECT SUM(Amount) AS [Total Amount for Gas]
FROM     LineItem
GROUP BY Description
HAVING (Description = N'Gas')


--9)LineItem, total rent. Filter by October
SELECT SUM(Amount) AS [Total Rent], Description
FROM     LineItem
GROUP BY Description