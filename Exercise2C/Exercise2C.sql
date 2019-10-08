--1.) Building. State, city, count buildings. Group by State, City
SELECT State, City, COUNT(*) AS [Building Count]
FROM     Building
GROUP BY State, City


--2) Building. City, count buildings. Group by City.
SELECT City, COUNT(BuildingId) AS [Building Count]
FROM     Building
GROUP BY City, State
HAVING (State = N'Mn')


--3) Building, Apartment. BioldingId, BuildingName, average rent. Group by BuildingId, BuildingName
SELECT Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Average Rent]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

--4) Building, Apartment. Cheapest rent. Group by City. Filter by Mn
SELECT Building.City, Building.BuildingName, SUM(Apartment.Rent) AS Expr1
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING (Building.State = N'Mn')


--5)Building Aprtment. Cheapest rent. Group by rent.
SELECT Building.City, MIN(Apartment.Rent) AS Expr1
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City


--6) Building, Apartment. BuildingName, Smallest size, average size, largest size. Group by InvoiceId. Filter by Winona
SELECT Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City
HAVING (Building.City = N'Winona')


--7) Invoice, LineItem. InvoiceId, cheapest price. Group by InvoiceId. Filter by garage during sep 2018
SELECT MIN(LineItem.Amount) AS [Cheapest Price]
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, LineItem.Description
HAVING (LineItem.Description = N'Garage')


--8) Invoice, LineItem. InvoiceId, Total amount billed. Group by InvoiceId. Filter by Sep 2018
SELECT Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amount Billed]
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId