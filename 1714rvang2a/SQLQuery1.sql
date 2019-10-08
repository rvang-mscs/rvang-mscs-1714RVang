-- Rick Vang
-- Exercise 2A
-- Property Manager

--2A.1) Building, Apartment tables. Sort by BuildingId, ApartmentNum
SELECT Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM     Apartment INNER JOIN
                  Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum
--2A.2)Building, Apartment tables. Sort by BuildingId, Rent. Filter by Winona.
SELECT Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE  (Building.City = N'Winona')
ORDER BY Building.BuildingId
--2A.3)Apartment, Invoice. Sort by ApartmentNum, InvoiceDate.
SELECT Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM     Apartment INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE  (Apartment.BuildingId = 1)
ORDER BY Invoice.InvoiceDate
--2A.4)Apartment, Invoice. Sort by BuildingId, ApartmentNum, InvoiceDate. 
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM     Apartment INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Invoice.InvoiceDate, Apartment.BuildingId
--2A.5)Apartment, Invoice. Sort by BuildingId, ApartmentNum. 
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum
--2A.6)Apartment, Invoice. Sort by BuildingId, TenantLastName, TenantFirstName. 
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFirstName
--2A.7)Invoice, LineItem. Sort by ApartmentId, InvoiceDate.
SELECT Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.InvoiceDate, Invoice.ApartmentId
--2A.8)Invoice, LineItem. Sort by ApartmentId, InvoiceDate. Filter by Rent, Garage. 
SELECT Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE  (LineItem.Description = N'garage')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate
--2A.9)Invoice, LineItem. Sort by ApartmentId, InvoiceId. 
SELECT Invoice.ApartmentId, Receipt.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM     Invoice INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Receipt.InvoiceId