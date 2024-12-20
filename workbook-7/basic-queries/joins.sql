USE northwind;

-- Q1.
SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID
ORDER BY CategoryName, ProductName;

-- Q2. 
SELECT products.ProductID, products.ProductName, products.UnitPrice, Suppliers.CompanyName
FROM products
JOIN suppliers ON products.SupplierID = Suppliers.SupplierID
ORDER BY ProductName;

-- Q3
SELECT products.ProductID, products.ProductName, products.UnitPrice, categories.CategoryName, suppliers.CompanyName
FROM products
JOIN categories ON products.categoryID = categories.CategoryID
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
ORDER BY ProductName;

-- Q4.
SELECT products.ProductID, products.ProductName, products.UnitPrice, categories.CategoryName
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
WHERE products.UnitPrice = (
SELECT Max(products.UnitPrice)
FROM products
)
ORDER BY CategoryName, ProductName;

-- Q5.
SELECT orders.OrderID, orders.ShipName, orders.ShipAddress, orders.ShipCountry, shippers.CompanyName
FROM orders
JOIN shippers ON orders.ShipVia = shippers.shipperID
WHERE orders.ShipCountry = "Germany";

-- Q6.
SELECT o.OrderID, o.OrderDate, o.ShipName, o.ShipAddress
FROM Orders o
JOIN `order details` od ON o.OrderID = od.OrderID
JOIN Products p  ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Sasquatch Ale';