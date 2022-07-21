Select * from Customer;
Select * from Orders;
Select * From OrderItem;
Select * From Product;

--write a query to display the orders placed by customer with phone number 8872348321
Select o.*,c.FirstName,c.LastName
From Customer c 
JOIN Orders o On c.Id = o.CustomerId
Where c.Phone = '8872348321';



Alter table Product
add 
Category nvarchar(50)


Update Product
Set Category='Dell'
where Id=1002;



--  fetching all the products which are available under Category ‘Samsung’.
Select * from Product
where Category='Samsung';


--Display the orders placed by customers not in NewZealand
Select o.* from Orders o
JOIN Customer c On o.CustomerId = c.Id
Where c.City <>'NewZealand';


--selects all the order which are placed for the product Chai.

Select o.* from Orders o
JOIN OrderItem oi On o.Id = oi.OrderId
JOIN Product p On oi.ProductId = p.Id
Where p.ProductName = 'TV';


