USE northwind; -- nos posicionamos en la base de datos del ejercicio.

-- 1. Productos más baratos y caros de nuestra la bases de datos:

-- PRIMERO HACEMOS SELECT PARA VER QUÉ TENEMOS EN LA TABLA.
SELECT * 
	FROM products; 
    
SELECT MIN(UnitPrice) AS lowestPrice, MAX(UnitPrice) AS highestPrice
	FROM products;
    
    
-- 2. Conociendo el numero de productos y su precio medio
SELECT COUNT(ProductID), AVG(UnitPrice)
	FROM products;

-- 3. Sacad la máxima y mínima carga de los pedidos de UK
SELECT ShipCountry, MAX(Freight), MIN(Freight)
	FROM orders
    WHERE ShipCountry ="UK";

-- 4. Qué productos se venden por encima del precio medio:

	-- primero sacaremos el precio medio de venta.
SELECT AVG(UnitPrice)
	FROM products; -- '28.86'

	-- ahora que tenemos el precio medio, hacemos la consulta.
SELECT ProductName, UnitPrice
	FROM products
	WHERE UnitPrice > 28.86;
    
    -- ahora lo ordenamos por su precio de mayor a menor.
SELECT ProductName, UnitPrice
	FROM products
	WHERE UnitPrice > 28.86
    ORDER BY UnitPrice DESC;
    
-- 5. Qué productos se han descontinuado.
SELECT COUNT(ProductName)
	FROM products
	WHERE Discontinued = 1;
    
-- 6. Detalles de los productos de la query anterior: ProductID y ProductName, limitemos a los 10

SELECT ProductID, ProductName
	FROM products
    WHERE Discontinued = 0
    ORDER BY ProductID DESC
    LIMIT 10;
    
-- 7. Relación entre número de pedidos y máxima carga.
	/* Desde logística nos piden el número de pedidos y la máxima cantidad de carga 
	de entre los mismos (freight) que han sido enviados por cada empleado
	(mostrando el ID de empleado en cada caso).*/ 
    
SELECT COUNT(OrderID) AS "Nº envios", MAX(Freight) AS "MAX KG", EmployeeID AS "Empleado"
	FROM orders
    GROUP BY EmployeeID;
    
-- 8. Descartar pedidos sin fecha y ordenarlos
	/*Una vez han revisado los datos de la consulta anterior, nos han pedido afinar un poco más el "disparo". 
	En el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía, 
	por lo que tenemos que mejorar la consulta en este aspecto. 
	También nos piden que ordenemos los resultados según el ID de empleado para que la visualización sea 
	más sencilla.*/ 

SELECT COUNT(OrderID) AS "Nº envios", MAX(Freight) AS "MAX KG", EmployeeID AS "Empleado"
	FROM orders
    WHERE ShippedDate IS NOT NULL
    GROUP BY EmployeeID;
	




    




    


