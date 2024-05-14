
-- PREGUNTA 1 Diferencia SQL y T-SQL
-- original
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
DECLARE @B NVARCHAR(20); -- "Hola"

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

SELECT
    @Nombre + ' ' + @Apellido1 + ' ' + @Apellido2 AS NombreCompleto;