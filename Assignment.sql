USE Adventureworks

--EXERCISE 1
SELECT * FROM Sales.Customer

--EXERCISE 2
SELECT CreditCardID As 'Credit Card ID',CardType As 'Card Type',CardNumber As 'Card number',ExpYear As 'Expiry Year'
From Sales.CreditCard

--EXERCISE 3
SELECT * FROM Sales.SalesTerritory where TerritoryID = 4

--EXERCISE 4
SELECT * FROM Sales.SalesOrderDetail where UnitPrice >2000

--EXERCISE 5 
select * from Sales.SalesOrderDetail where ProductID = 843

--EXERCISE 6
SELECT * FROM Sales.SalesOrderHeader WHERE OrderDate = '2004-06-02'

--EXERCISE 7
SELECT SalesOrderID AS 'Order ID', OrderQty AS 'Order Quantity', UnitPrice AS 'Unit Price', LineTotal AS 'Total Cost' FROM Sales.SalesOrderDetail

--EXERCISE 8
SELECT * FROM Sales.SalesOrderDetail WHERE LineTotal > 2000 AND LineTotal < 2100

--EXERCISE 9
SELECT Name, CountryRegionCode, SalesYTD FROM Sales.SalesTerritory WHERE TerritoryID = 1

--EXERCISE 10
SELECT * FROM Sales.SalesOrderHeader WHERE TaxAmt > 10000

--EXERCISE 11
SELECT * FROM Sales.SalesTerritory WHERE NAME IN('Canada', 'France', 'Germany')

--EXERCISE 12
SELECT SalesPersonID AS 'Sales Person ID', TerritoryID AS 'Territory ID' FROM Sales.SalesOrderHeader where TerritoryID in(2,4)

--EXERCISE 13
SELECT * FROM Sales.CreditCard where CardType = 'vista' and ExpYear = 2006

--EXERCISE 14
SELECT ShipDate FROM Sales.SalesOrderHeader WHERE ShipDate > '2004-06-12'

--EXERCISE 15
select SalesOrderNumber AS 'Order Number',OrderDate AS 'Order Date', Status, SubTotal AS 'Total cost' from Sales.SalesOrderHeader Where OrderDate='2001-07-01' AND SubTotal>=10000

--EXERCISE 16
 select * from Sales.SalesOrderHeader where OnlineOrderFlag = 1

 --EXERCISE 17
 SELECT SalesOrderID AS 'Order ID', TotalDue AS 'Total Due' FROM Sales.SalesOrderHeader order by SalesOrderID desc

 --EXERCISE 18
 SELECT SalesOrderID, TaxAmt FROM Sales.SalesOrderHeader WHERE TaxAmt < 2000 ORDER BY SalesOrderID ASC

 --EXERCISE 19
 SELECT SalesOrderNumber, TotalDue FROM Sales.SalesOrderHeader order by TotalDue asc

 --EXERCISE 20
 SELECT * FROM Sales.Currency where Name LIKE '%Dollar%'

 --EXERCISE 21
 SELECT * FROM Sales.SalesTerritory WHERE Name LIKE 'N%'

 --EXERCISE 22
 SELECT SalesPersonID AS 'Sales Person ID', TerritoryID AS 'Territory ID', SalesQuota AS 'Sales Quota' FROM Sales.SalesPerson where SalesQuota is not null

 --EXERCISE 23
 SELECT Top 3 * FROM Sales.SalesPerson 

 --EXERCISE 24
 SELECT * FROM Sales.Store WHERE Name LIKE '%BIKE%'

 --EXERCISE 25
 SELECT DISTINCT CardType FROM Sales.CreditCard

 --EXERCISE 26
SELECT EmployeeID as ' Employee ID', LoginID, Title FROM HumanResources.Employee ORDER BY EmployeeID OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY
 
 --EXERCISE 27
 SELECT (MAX(OrderQty)) AS 'MAXIMUM RATE',
 (MIN(OrderQty)) AS 'MINIMUM RATE',
  (AVG(OrderQty)) AS 'AVERAGE RATE'
  from Sales.SalesOrderDetail

--EXERCISE 28
 SELECT 'Total Value of all Orders' = SUM(TotalDue) FROM Sales.SalesOrderHeader

 --EXERCISE 29
 SELECT TOP 5 SalesOrderID FROM Sales.SalesOrderHeader where DATEPART(YYYY,OrderDate) = 2001 ORDER BY TotalDue

 --EXERCISE 30
 SELECT SalesOrderID, ProductID, SUM(LineTotal) FROM Sales.SalesOrderDetail GROUP BY SalesOrderID
 SELECT SalesOrderID, ProductID, SUM(LineTotal) AS Total FROM Sales.SalesOrderDetail GROUP BY SalesOrderID, ProductID

 --EXERCISE 31
 SELECT ProductID, SUM(LineTotal) AS Total FROM Sales.SalesOrderDetail GROUP BY ProductID HAVING SUM(LineTotal) > 10000

 --EXERCISE 32
 SELECT ProductID, SUM(LineTotal) AS 'Total' FROM Sales.SalesOrderDetail GROUP BY ROLLUP (ProductID)

 --EXERCISE 33
 SELECT OrderDate, SUM(TotalDue) AS 'Total Amount' FROM Sales.SalesOrderHeader GROUP BY OrderDate

 --EXERCISE 34
 SELECT ProductID,sum(UnitPrice) AS 'Total Unit Price', sum(LineTotal) AS 'Total Amount' FROM Sales.SalesOrderDetail where ProductID IN(774,777) GROUP BY CUBE (ProductID)

 --EXERCISE 35
 SELECT SalesOrderID, min(LineTotal) AS Minimum, max(LineTotal) AS Maximum FROM Sales.SalesOrderDetail where LineTotal > 5000 GROUP BY SalesOrderID

 --EXERCISE 36
 SELECT SalesOrderID as 'Sales Order ID', AVG(LineTotal)AS 'Average Value' FROM Sales.SalesOrderDetail GROUP BY SalesOrderID HAVING AVG(LineTotal) > 5000

--EXERCISE 37
SELECT CustomerID as 'Customer ID', Name = LEFT(Name, 15), SalesPersonID as 'Sales Person ID' FROM Sales.Store	

--EXERCISE 38
select salesOrderID AS 'Order Number',TotalDue AS 'Total Due',DATEPART(DD,OrderDate) AS 'Day of order',DATEPART(DW,orderDate) AS 'Week day' from Sales.SalesOrderHeader

---EXERCISE 39
SELECT SalesOrderID, OrderQty, UnitPrice,  DENSE_RANK() OVER (ORDER BY UnitPrice) AS Identical FROM Sales.SalesOrderDetail 

--EXERCISE 40
SELECT EmployeeID, HireDate, DATENAME(MONTH, HireDate)As Month, DATENAME(YEAR, HireDate)As Year FROM HumanResources.Employee

--EXERCISE 41
SELECT CostRate, LocationID,  NTILE(3) OVER (ORDER BY LocationID ) AS Grouped FROM Production.Location WHERE CostRate > 12 ORDER BY CostRate desc

--EXERCISE 42
SELECT 'The list price of' + ' ' + Name + 'is' + CAST(ListPrice AS VARCHAR(12)) AS Price FROM Production.Product where ListPrice between 360.00 and 499.00

--EXERCISE 43
SELECT ProductID, SUM(LineTotal) as 'Total' FROM Sales.SalesOrderDetail GROUP BY CUBE(ProductID)

--EXERCISE 44
SELECT salesPersonID,sum(salesQuota) AS 'Sales Quota' FROM sales.salespersonQuotaHistory GROUP BY ROLLUP(salesPersonID)

--EXERCISE 45
SELECT ProductID AS 'Product ID', IIF(MakeFlag = 1, 'Available', 'Not Available') AS 'Availability of Products' FROM Production.Product

--EXERCISE 46
SELECT ProductID, YEAR(StartDate) AS 'Sales Year', ListPrice AS 'Current Price', LAG(ListPrice, 1,0) OVER(ORDER BY YEAR(StartDate))AS 'Previous Price' FROM Production.ProductListPriceHistory WHERE ProductID = 715

--EXERCISE 47
SELECT CONCAT(FirstName,MiddleName, LastName) AS 'Person_Name' FROM Person.Contact

--EXERCISE 48
SELECT Empid, Ename, Eproject FROM Work.Employee WHERE Empid IN (2,4)

--EXERCISE 49
SELECT Sname, Class FROM Student.StudentDetail Where Sname like 'S%'

--EXERCISE 50
 SELECT  Sname,  DENSE_RANK() OVER (ORDER BY Smarks desc) AS Marks FROM Student.StudentRecords ORDER BY Smarks desc

--EXERCISE 51
1. row_number = Ranking Function
2. pi() = Mathemathical Function
3. avg() = Aggregate Function
4. count() = Aggregate Function
5. datefiff() = Date Function
6. reverse() = String Function
7. ntile() =Ranking Function

