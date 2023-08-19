select emp.salary as SecondHighestSalary 
from (select salary, dense_rank() Over(order by salary desc) as r
from Employee) as emp
where emp.r=2
UNION
SELECT NULL AS SecondHighestSalary
from (select salary, dense_rank() Over(order by salary desc) as r
from Employee) as emp
having count(distinct(salary))<=1