Select * from Customer
Select * from Orders
Select * from OrderItem
Select * from Product



--	Write a query to get most expense and least expensive Product list (name and unit price).
Select ProductName,UnitPrice
from Product
order by UnitPrice Desc;