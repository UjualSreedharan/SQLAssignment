Select * from Customer
Select * from Orders
Select * from OrderItem
Select * from Product



--Write a query to get most expense and least expensive Product list (name and unit price).
Select ProductName,UnitPrice
from Product
order by UnitPrice Desc;


--Display complete list of customers, the OrderID and date of any orders they have made
Select c.FirstName, c.LastName, o.Id, o.OrderDate
From Customer c
JOIN Orders o ON c.Id = o.CustomerId
Where o.OrderNumber = 13;







--Write query that determines the customer who has placed the maximum number of orders

Select c.*,o.*
From Customer c 
JOIN Orders o ON c.ID = o.CustomerId
Where c.ID IN (SELECT CustomerId FROM Orders
Group by CustomerId
Having COUNT(*) >= ALL(Select COUNT(*) FROM Orders Group by CustomerID));


--Display the customerid whose name has substring ‘ne’

Select Id,FirstName FROM Customer
Where FirstName LIKE '%ne%';



--Display the first word of all the Supplier name

Select SUBSTRING(LTRIM(SupplierName),1,(CHARINDEX(' ',LTRIM(SupplierName) + ' ')-1)) as Name
from Product;


Alter table Product
add
UnitsinStock int;

Alter table Product
add
UnitsonOrder int;


Update Product
set UnitsinStock=2
where Id=1003

Update Product
set UnitsonOrder=16
where Id=1003



--Display the list of products that are out of stock
Select * FROM Product;
Select ProductName, UnitsinStock, UnitsonOrder
From Product
Where ((IsDiscontinued = 0) AND ((UnitsinStock)<UnitsonOrder));




--	Display the list of products whose unitinstock is less than unitonorder

Select ProductName, UnitsinStock, UnitsonOrder
From Product
Where(UnitsinStock < UnitsonOrder);


Alter table Product
add
SupplierId int

Update Product
set SupplierId=25
where Id=1005


--Display list of categories and suppliers who supply products within those categories
Select p.Category, p.SupplierName 
From Product p
Group by p.Id,p.Category,p.SupplierName;
