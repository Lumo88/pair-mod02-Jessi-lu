USE northwind;
/* 1.Desde recursos humanos nos piden realizar una consulta que muestre 
por pantalla los datos de todas las empleadas y sus supervisoras. 
Concretamente nos piden: la ubicación, nombre, y apellido tanto de 
las empleadas como de las jefas. Investiga el resultado, ¿sabes decir 
quién es el director?*/



/* 2. El equipo de marketing necesita una lista con todas las categorías de productos, 
incluso si no tienen productos asociados. Queremos obtener el nombre de la categoría y 
el nombre de los productos dentro de cada categoría. Podriamos usar un RIGTH JOIN con 
'categories'?, usemos tambien la tabla 'products'.*/

-- Tablas necesarias: products, categories,
SELECT c.CategoryName AS NombreCategoria, p.ProductName AS NombreProducto
	FROM categories AS c
	LEFT JOIN products AS p
		ON c.CategoryID = p.CategoryID;
        
SELECT c.CategoryName AS NombreCategoria, p.ProductName AS NombreProducto
	FROM products AS p
	RIGHT JOIN categories AS c
		ON c.CategoryID = p.CategoryID;
        
        
/* 3. Desde el equipo de ventas nos piden obtener una lista de todos los pedidos 
junto con los datos de las empresas clientes. Sin embargo, hay algunos pedidos 
que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos 
los pedidos, incluso si no tienen cliente registrado.*/

-- TABLAS NECESARIAS: orders, customers LEFT JOIN

SELECT * -- hemos entendido que tenemos que mostrar todos los datos de ambas tablas.
	FROM orders AS o
    LEFT JOIN customers AS c
		ON o.CustomerID = c.CustomerID;

/* 4.El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos 
y cuáles no. Queremos obtener una lista con todas las empleadas y, si han gestionado 
pedidos, mostrar los detalles del pedido.*/

-- tablas necesarias: employees,orders
SELECT e.FirstName, o.OrderID,o.ShipAddress
	FROM employees AS e
	LEFT JOIN orders AS o
		ON e.EmployeeID = o.EmployeeID;
        
SELECT e.EmployeeID, e.FirstName, e.LastName, ord.OrderID, ord.ProductID, ord.UnitPrice, ord.Quantity, ord.Discount
	FROM employees AS e
    LEFT JOIN orders AS o
		ON e.EmployeeID = o.EmployeeID
	INNER JOIN orderdetails AS ord
		ON o.OrderID = ord.OrderID;
        
SELECT e.FirstName, ord.OrderID, ord.ProductID
	FROM employees AS e
    LEFT JOIN orders AS o
		ON e.EmployeeID = o.EmployeeID
	INNER JOIN orderdetails AS ord
		ON o.OrderID = ord.OrderID;
		
        
/*5. Desde el área de logística nos piden una lista de todos los transportistas (shippers) 
y los pedidos que han enviado. Queremos asegurarnos de incluir todos los transportistas,
incluso si no han enviado pedidos.*/

-- TABLAS A USAR: shippers ShipperID (transportistas), orders ShipVia

SELECT *
	FROM shippers AS s
    LEFT JOIN orders AS ord
		ON s.shipperID = ord.ShipVia;

SELECT s.CompanyName, ord.ShipName
	FROM shippers AS s
    LEFT JOIN orders AS ord
		ON s.shipperID = ord.ShipVia;
