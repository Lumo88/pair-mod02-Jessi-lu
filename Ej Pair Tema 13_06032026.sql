USE northwind;


/* EJERCICIO 2. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar 
un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/
    
    -- Aqui sacamos qué numero de categoria es Beverages.
SELECT CategoryID
	FROM categories
	WHERE CategoryName = "Beverages"; -- 1
    
	-- Aquí sacamos todos los productos que la categoria sea la de beverages.
SELECT ProductID, ProductName, CategoryID
	FROM products
    WHERE CategoryID =1;

	-- aqui hacemos unión de ambas
SELECT ProductID, ProductName, CategoryID
	FROM products
    WHERE CategoryID = (SELECT CategoryID
							FROM categories
							WHERE CategoryName = "Beverages");

/* 3. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en 
ese país. Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes,  entonces 
podría dirigirse a estos países para buscar proveedores adicionales.*/

-- vamos a sacar los paises donde viven los clientes
SELECT DISTINCT Country
	FROM customers;
    
-- vamos a sacar los paises donde viven los proveedores.
SELECT DISTINCT Country
	FROM suppliers;
   
-- vamos a hacer el NOT IN.

SELECT DISTINCT Country
	FROM customers
    WHERE country NOT IN (SELECT DISTINCT Country
								FROM suppliers);
   

/* 1. Extraed los pedidos con el máximo "order_date" para cada empleado. Nuestro jefe quiere saber 
la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos 
con una query correlacionada.*/

-- fecha de los pedidos más recientes
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
	FROM orders
    order by orderDate DESC
    LIMIT 20;
    
-- sacamos la order date max por empleado
SELECT MAX(OrderDate)
	FROM orders
    GROUP BY EmployeeID; -- esto es para ver todas las listas.

-- UNIR AMBAS.
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
	FROM orders AS or1
    WHERE or1.OrderDate = (SELECT MAX(OrderDate)
								FROM orders AS or2
								WHERE or1.EmployeeID = or2.EmployeeID);
                                
                                
								

