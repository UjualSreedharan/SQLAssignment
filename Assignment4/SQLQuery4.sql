Select * from Customer
Select * from Orders
Select * from OrderItem
Select * from Product



--	Write a query to get most expense and least expensive Product list (name and unit price).
Select ProductName,UnitPrice
from Product
order by UnitPrice Desc;



--	Display the list of products that are out of stock
Select * From Product;
Select ProductName, UnitsinStock, UnitsonOrder
From Product
Where ((IsDiscontinued = 0) AND ((UnitsinStock)<UnitsonOrder));


--	Display the list of products whose unitinstock is less than unitonorder

Select ProductName, UnitsinStock, UnitsonOrder
From Product
Where(UnitsinStock < UnitsonOrder);


--	Display list of categories and suppliers who supply products within those categories


SELECT p.Category, p.SupplierName 
FROM Product p
GROUP BY p.Id,p.Category,p.SupplierName;


--Display complete list of customers, the OrderID and date of any orders they have made


Select c.FirstName, c.LastName, o.Id, o.OrderDate
From Customer c
JOIN Orders o ON c.Id = o.CustomerId
Where o.OrderNumber = 14;

--	Write  query that determines the customer who has placed the maximum number of orders

Select c.*,o.*
From Customer c 
JOIN Orders o ON c.ID = o.CustomerId
WHERE c.ID IN (SELECT CustomerId From Orders
				Group by CustomerId
				HAVING COUNT(*) >= ALL(SELECT COUNT(*) From Orders Group by CustomerId)
			);

--Display the customerid whose name has substring ‘ne’

Select Id,FirstName FROM Customer
Where FirstName LIKE '%ne%';


-- Display the first word of all the company name

Select SUBSTRING(LTRIM(SupplierName),1,(CHARINDEX(' ',LTRIM(SupplierName) + ' ')-1)) as Name
FROM Product;