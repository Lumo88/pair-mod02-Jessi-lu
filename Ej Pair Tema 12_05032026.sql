USE northwind;
-- EJERCICIO 1 -- Ciudades que empiezan con "A" o "B".

SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE "A%" OR City LIKE "B%";


SELECT City, CompanyName, ContactName
FROM suppliers
WHERE City LIKE "A%" OR City LIKE "B%";


SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE "A%" OR City LIKE "B%"
UNION
SELECT City, CompanyName, ContactName
FROM suppliers
WHERE City LIKE "A%" OR City LIKE "B%";



-- EJERCICIO 2--Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT cus.City AS ciudad, cus.CompanyName AS empresa,cus.contactName AS persona_contacto, COUNT(ord.orderId) AS numero_pedidos
	FROM customers AS cus
	LEFT JOIN orders AS ord
		ON cus.customerID =ord.customerID
	GROUP BY cus.City, cus.CompanyName,cus.contactName
    HAVING cus.City LIKE "L%";
    
    
    
    
-- EJERCICIO 3--Nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.

SELECT CompanyName,ContactName,ContactTitle
	FROM customers
    WHERE ContactTitle NOT LIKE "sales%";  -- No importan las mayúsculas-entiende Sales y sales


    -- EJERCICIO 4-- Todos los clientes que no tengan una "A" en segunda posición en su nombre

    SELECT ContactName
	FROM customers
    WHERE ContactName NOT LIKE "_A%";
    
    
    -- EJERCICIO 5--Extraer toda la información sobre las compañías que tengamos en la bases de datos
    
SELECT City, CompanyName, ContactName, "Customers" AS Relationship
	FROM customers
    
UNION

SELECT City, CompanyName, ContactName,"Suppliers" AS Relationship
	FROM suppliers;
    
-- EJERCICIO 6--Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

SELECT CategoryName,'Description'
	FROM categories
	WHERE Description LIKE "sweet";
    
SELECT *
	FROM categories;