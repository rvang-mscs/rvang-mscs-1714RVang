--2d.1)
SELECT Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

--2D.2
SELECT Person.PersonId, Person.LastName, Person.FirstName, Building.City, Apartment.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM     Person INNER JOIN
                  Apartment ON Person.PersonId = Apartment.AdminId INNER JOIN
                  Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Apartment.BuildingId, Apartment.ApartmentNum

--2D.3
SELECT Apartment.ApartmentNum, Person.LastName, Person.FirstName, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE  (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--2D.4
SELECT Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(Apartment.Rent) AS [Invoice Total]
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

--2D.5
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId CROSS JOIN
                  Invoice INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--2D.6
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName AS Tentant, Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent AS Recieved, Apartment.Rent AS Billed
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId CROSS JOIN
                  Invoice

--2D.7
SELECT Person.PersonId, Person.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Receipt.Amount AS [Total Billed], Receipt.Amount AS Received
FROM     Receipt INNER JOIN
                  Invoice ON Receipt.InvoiceId = Invoice.InvoiceId CROSS JOIN
                  Person