USE northwind;

-- EJERCICIO 1--Pedidos por empresa en UK
/*Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta
 a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK.
 Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

Deberéis obtener una tabla similar a esta:*/

SELECT *
FROM customers
LIMIT 3;

SELECT *
FROM orders
LIMIT 3;

SELECT c.CompanyName, o.CustomerID, COUNT(o.OrderID) AS NumeroPedidos
FROM customers AS c
	INNER JOIN orders AS o
		ON c.CustomerID = o.CustomerID -- siempre que los ids de las dos tablas exista en las 2
WHERE c.Country ="UK"
GROUP BY c.CompanyName, o.CustomerID;

-- EJERCICIO 2--
/*Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales.
La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/

SELECT c.CompanyName,c.Country -- tenemos clientes po el pais que queremos (uk)
FROM customers AS c
WHERE c.Country ="UK";


SELECT * -- hemos hecho un match para tener en una misma tabla la info de los pedidos por el OrderID
FROM orderdetails AS od
	INNER JOIN orders AS o
		ON od.OrderID = o.OrderID;


SELECT *
FROM orderdetails AS od
	INNER JOIN orders AS o
		ON od.OrderID = o.OrderID
	INNER JOIN customers AS c
		ON od.CustomerID = c.CustomerID;



















