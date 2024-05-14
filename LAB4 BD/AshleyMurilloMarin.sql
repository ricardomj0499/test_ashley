DELETE FROM Sales.Customers
WHERE country = N'Ireland';

UPDATE SOD 
SET discount = 0.01
FROM Sales.OrderDetails as SOD
INNER JOIN Sales.Orders SO ON  SOD.orderid = SO.orderid
INNER JOIN Sales.Customers SC ON SO.custid = SC.custid
WHERE SC.country = 'USA' AND  MONTH(SO.orderdate) = 11 AND YEAR(SO.orderdate) =2015;

SELECT C.companyname AS Company,
	  COALESCE(C.country, 'N/A') AS Country,
	  COALESCE(C.region, 'N/A') AS Region,
	  CASE
        WHEN COUNT(O.orderid) = 0 THEN N'No hicieron ninguna transacción'
        WHEN COUNT(O.orderid) BETWEEN 1 AND 10 THEN '[1-10]'
        WHEN COUNT(O.orderid) BETWEEN 11 AND 20 THEN '[11-20]'
        WHEN COUNT(O.orderid) BETWEEN 21 AND 50 THEN '[21-50]'
        WHEN COUNT(O.orderid) BETWEEN 51 AND 80 THEN '[51-80]'
        ELSE N'Más de 81 transacciones'
       END AS RangoTransaccionalidad
FROM Sales.Orders AS O
   LEFT OUTER JOIN Sales.Customers AS C
      ON (O.custid = C.custid)
WHERE YEAR(O.orderdate) = (SELECT MAX(YEAR(orderdate)) FROM Sales.Orders)
GROUP BY C.companyname, C.country, C.region;

SELECT SC.companyname as CompanyName,
	   ISNULL(SC.country, 'N/A') as Country,
	   ISNULL(SC.region, 'N/A') as Region,
	   PC.categoryname as CategoryName,
	   COUNT(SO.custid) as CantidadTransacciones
FROM 
	Sales.Customers as SC
	INNER JOIN Sales.Orders SO ON SC.custid = SO.custid
	INNER JOIN Sales.OrderDetails SOD ON SO.orderid = SOD.orderid
	INNER JOIN Production.Products PP ON SOD.productid = PP.productid
	INNER JOIN Production.Categories PC ON PP.categoryid = PC.categoryid
WHERE YEAR(SO.orderdate) = 2015 AND MONTH(SO.orderdate) = 12 
GROUP BY 
	CompanyName,Country,Region,CategoryName
HAVING COUNT(SO.orderid) > 3
ORDER BY CompanyName;
