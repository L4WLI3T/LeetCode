select 
e.name as Employee
from employee e
join employee m on e.managerid=m.id
where e.managerid is not null and e.salary>m.salary