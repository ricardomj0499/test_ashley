-----------------------------------------
-- Ejercicio #1
WITH amount_usd AS (
	SELECT 
		SO.custid
		,YEAR(SO.orderdate) as anio 
		,(SOD.unitprice * SOD.qty) as total
	FROM Sales.Orders SO
		INNER JOIN Sales.OrderDetails SOD 
			ON SO.orderid = SOD.orderid
)
SELECT 
	SC.companyname as customer,
	au.anio,
	SUM(au.total) as total
FROM amount_usd au
INNER JOIN Sales.Customers SC 
	ON au.custid = SC.custid
GROUP BY
	SC.companyname, 
	anio;

-----------------------------------------
-- Ejercicio #2

-- 2.a
CREATE TABLE Country (
	CountryID INT IDENTITY(1, 1) PRIMARY KEY,
	CountryName VARCHAR(50)
);
INSERT INTO Country (CountryName)
SELECT DISTINCT country
FROM  Sales.Customers
-- select * from Country

-- 2.b
ALTER TABLE sales.customers
ADD CountryID int;
-- select * from sales.customers

-- 2.c
UPDATE sales.customers
SET CountryID = c.CountryID
FROM sales.customers sc
INNER JOIN Country c ON sc.country = c.CountryName;

-- 2.d
ALTER TABLE sales.customers
ADD CONSTRAINT FK_Country FOREIGN KEY (CountryID) 
REFERENCES country (CountryID);

-- 2.e
WITH amount_usd AS (
    SELECT 
        SO.custid,
        SUM((SOD.unitprice * SOD.qty)) AS total
    FROM Sales.Orders SO
        INNER JOIN Sales.OrderDetails SOD 
            ON SO.orderid = SOD.orderid
	GROUP BY SO.custid
),
ranked_customers AS (
  SELECT 
        SC.companyname AS customer,
        SC.country,
        au.total,
        ROW_NUMBER() OVER (PARTITION BY SC.country ORDER BY au.total DESC) AS ranking
    FROM amount_usd au
    INNER JOIN Sales.Customers SC 
        ON au.custid = SC.custid  
)
SELECT
    customer,
    country,
    total
FROM
    ranked_customers
WHERE
    ranking <= 3
order by country;