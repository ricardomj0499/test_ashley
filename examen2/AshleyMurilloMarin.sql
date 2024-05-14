-- PREGUNTA 1
-- Borre los productos, las órdenes y detalles de las órdenes, según el siguiente detalle:
-- Proveedores de Europa para las ventas del primer trimestre el 2105.
-- MURILLO MARIN ASHLEY YURUBY

-- productos Production.Products
-- las órdenes Sales.Orders
-- detalles de las órdenes Sales.OrderDetails
-- proveedores de europa Production.Suppliers
-- primer trimestre 2015
-- CustID 28

USE TSQLV4;
GO

SELECT * FROM Production.Suppliers PS
INNER JOIN Production.Products PP ON PS.supplierid = PP.supplierid
INNER JOIN Sales.OrderDetails SOD ON PP.productid = SOD.productid
INNER JOIN Sales.Orders SO ON SO.orderid = SOD.orderid where custid = 28 AND ORDER  --2155 sin filtro 20 con custid28 

DELETE SO
FROM Sales.Orders SO
INNER JOIN Sales.OrderDetails as SOD ON (SO.orderid = SOD.orderid) 
INNER JOIN Production.Products PP ON (PP.productid = SOD.productid)
INNER JOIN Production.Suppliers PS ON (PS.supplierid = PP.supplierid)
WHERE PS.

DELETE OD
FROM Sales.OrderDetails as OD
  INNER JOIN Sales.Orders AS O
     ON (OD.orderid = O.orderid)
  INNER JOIN Sales.Customers AS C
     ON (C.custid = O.custid)
WHERE C.country = 'Ireland';

-- Que a la vez dependen del cliente que posee la orden
DELETE O
FROM Sales.Orders as O
  INNER JOIN Sales.Customers AS C
     ON (O.custid = C.custid)
WHERE C.country = 'Ireland';

-- Una vez los customers ya no son referenciados en ning�na otra tabla se puden eliminar directamente
DELETE C
FROM Sales.Customers as C
WHERE C.country = 'Ireland';