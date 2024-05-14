--1)Вывести общее ко-во поставщиков не из UK и не из China
    SELECT
    COUNT(*) FROM Suppliers
    WHERE
    Country NOT IN ('UK' ,'China')

 --2)Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
   SELECT AVG(Price) as 'middle price', MAX(price), MIN(price) FROM Products
    WHERE
    CategoryID IN(3,5)

    --3)Вывести общую сумму проданных товаров
    SELECT SUM(Price) FROM Products
    JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
    WHERE OrderDetails.OrderDetailID BETWEEN 1 AND 2155

    -- 4. Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
     SELECT
     OrderID,
     CustomerName,
     Country,
     LastName AS LastNameEmployee,
     ShipperName
     FROM Orders
     JOIN Customers ON Customers.CustomerID = Orders.CustomerID
     JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
     JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID


-- 5. Вывести сумму, на которую было отправлено товаров клиентам в Germany.
    -- SELECT
    -- SUM(Price * Quantity) AS total_cost
    -- FROM Customers
    -- JOIN Orders ON Orders.CustomerID = Customers.CustomerID
    -- JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
    -- JOIN Products ON OrderDetails.ProductID = Products.ProductID
    -- WHERE
    -- Country = 'Germany'