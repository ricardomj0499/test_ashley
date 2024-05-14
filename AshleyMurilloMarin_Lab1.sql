-- 1 PARTE
-- PREGUNTA 1 Diferencia SQL y T-SQL
-- Todos los resultados
SELECT * FROM HR.Employees;

-- SQL -- Sirve en postgres
SELECT SUBSTRING(title FROM 5 FOR 7) FROM HR.Employees;

-- T-SQL -- Sql Server
SELECT SUBSTRING(title, 5, 7) FROM HR.Employees;
 

-- PREGUNTA 2
-- retorna todos los datos sin importar el valor de shipregion
SELECT * FROM Sales.Orders;
-- Retorna solo las filas en las cuales shipregion es null lo que indica que
-- no hay registro de datos. El null no indica tampoco un tipo de datos, sino la ausencia total de estos. 
SELECT * FROM Sales.Orders WHERE shipregion is NULL;

-- PREGUNTA 3

-- Declare the variable to be used.
DECLARE @A NVARCHAR(20);
DECLARE @B NVARCHAR(20);

-- Initialize the variable.
SET @A = NULL;
SET @B = 'Hola Ricardo';

SELECT COALESCE( @A, @B); 

-- PREGUNTA 4

-- Declare the variable to be used.
DECLARE @Nombre NVARCHAR(50);
DECLARE @Apellido1 NVARCHAR(50);
DECLARE @Apellido2 NVARCHAR(50);

-- Initialize the variable.
SET @Nombre = 'Ashley';
SET @Apellido1 = 'Murillo';
SET @Apellido2 = 'Marin';

SELECT @Nombre + ' ' + @Apellido1 + ' ' + @Apellido2 AS NombreCompleto;

-----------------------------------------------------------------------
-- 2 PARTE

CREATE DATABASE Ventas_AshleyMurilloMarin;
USE Ventas_AshleyMurilloMarin;

CREATE SCHEMA VentaDigital_AshleyMurillo;
GO

CREATE TABLE VentaDigital_AshleyMurillo.Factura (
	numero_factura INTEGER PRIMARY KEY,
	fecha DATETIME,
	cantidad_productos_vendidos INTEGER,
	client_id INTEGER,
	total FLOAT,
	sub_total FLOAT,
	descuentos DECIMAL,
	impuestos DECIMAL
);

CREATE TABLE VentaDigital_AshleyMurillo.LineaFactura (
	numero_factura INTEGER,
	cantidad VARCHAR(50),
	precio VARCHAR(50),
	total VARCHAR(50),
	FOREIGN KEY (numero_factura) REFERENCES VentaDigital_AshleyMurillo.Factura(numero_factura)
);
