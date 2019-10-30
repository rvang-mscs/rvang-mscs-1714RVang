/*2E-1*/
SELECT BuildingName, Address, City + N',' + N' ' + State + N' ' + Zip AS [City State Zip]
FROM     Building
WHERE  (State = N'Mn') AND (Zip = N'55987') AND (City = N'Winona')

/*2E-2 DOnt know how to add the $100 per bathrooms*/
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + '100' AS [Estimated Rent]
FROM     Apartment INNER JOIN
                  Building ON Apartment.BuildingId = Building.BuildingId
WHERE  (Building.State = N'Mn') AND (Building.City = N'Red Wing')

/*2E-3 same problem as #2 I did'nt know how to add the per bathroom to the end */
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + '100' AS [Estimated Rent], Apartment.Rent - Apartment.SquareFeet * 0.9 - 100 AS Difference
FROM     Apartment INNER JOIN
                  Building ON Apartment.BuildingId = Building.BuildingId
WHERE  (Building.State = N'Mn') AND (Building.City = N'Red Wing')

/*2E-4 Error when putting in Person table for FirstName + LastName */
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName + Person.FirstName AS Expr1, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM     Apartment INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId AND Apartment.TenantId = Person.PersonId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.LastName + Person.FirstName

/*2E-5 same issue as number 4 */
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount AS Expr1
FROM     Apartment INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Receipt.Amount

/*2E-6 Don't know how to do it */
SELECT Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount, LineItem.Amount + Receipt.Amount AS Expr1
FROM     Apartment INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Receipt.Amount, LineItem.Amount + Receipt.Amount


/*2E-7 Don't know how to do it */
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + Person.LastName AS Name
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.AdminId = Person.PersonId AND Apartment.TenantId = Person.PersonId

/*2E-8 Dont know how to filter */
SELECT Person.PersonId, Person.FirstName + Person.LastName AS Tenant, Invoice.InvoiceDate AS [Recemt Invoice], Invoice.InvoiceDate + 1 AS [Next Invoice]
FROM     Person CROSS JOIN
                  Invoice