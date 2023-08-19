select c.name as Customers
from customers c
full outer join orders o on o.customerid=c.id
where o.id is null