#Solution Using Dense Rank

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
where T.dr=1
order by T.eid


#Solution using Max and Group By

select 
d.name as Department,
e.name as Employee,
e.salary as Salary
from 
(
	Select
	Case when E.salary=
	MAX(E.Salary) OVER (Partition by D.id) 
	then e.id
	end as empwithhighsal
	from Employee E
	join Department D on E.departmentId=D.id
	group by D.id,E.id,E.salary
) as T
join Employee E on E.id=T.empwithhighsal
join Department D on D.id=E.departmentid
order by E.id