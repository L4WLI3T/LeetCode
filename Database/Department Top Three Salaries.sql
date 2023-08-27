select T.dname as Department, T.ename as Employee, T.salary as Salary
from (
select 
e.id as eid,
d.id as did,
e.name as ename,e.salary as salary,d.name as dname,
DENSE_RANK() over (Partition by d.id order by e.salary desc) as dr
from Employee E
join Department D on D.id=E.departmentid
) as T
where T.dr<=3
order by T.eid