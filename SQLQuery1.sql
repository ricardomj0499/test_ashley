-- 1. Uso del select en el mismo select
select *  FROM SALES.Customers;
SELECT 
	CONCAT(SC.companyname, ' - ', SC.contactname) AS "CustomerName",
	SC.city,
	SC.country as pais
FROM SALES.Customers SC
ORDER BY pais;


-- 2. 
SELECT
    custid AS "CustomerID",
    CONCAT(companyname, ' - ', contactname) AS "CustomerName",
    country,
    city AS "City",
    COALESCE(Region, 'N/A') AS "Region"
FROM SALES.Customers
WHERE fax IS NULL AND country IN ('Mexico', 'Brazil','Argentina','Venezuela') 
ORDER BY "Country";

select *  FROM SALES.Customers

-- 3
SELECT
    custid AS "CustomerID",
    contactname AS "CustomerName",
    contacttitle
FROM SALES.Customers
WHERE (contacttitle like 'Marketing%' OR contacttitle like 'Sales%') AND Country IN ('Canada', 'USA', 'Mexico')
ORDER BY contacttitle;

--4 
select *  FROM SALES.Customers;



--5
select * from Production.Products;
select productid, productname
FROM
	Production.Products pp
WHERE 
	categoryid IN (1,2,3) AND
	unitprice BETWEEN 50 AND 76 AND 
	discontinued = 0;

-- 6 
SELECT supplierid
	  ,companyname
FROM Production.Suppliers
WHERE country IN (N'Costa Rica',N'Nicaragua',N'Honduras',N'Guatemala',N'El Salvador',N'Belice',N'Panama');

SELECT *
FROM Production.Suppliers

SELECT *
FROM HR.Employees
WHERE firstname = N'SARA';


