select distinct t.n as ConsecutiveNums
from
(
    select case when num=lag(num,1,NULL) over(order by id asc)
    and lag(num,1,NULL) over(order by id asc)=lag(num,2,NULL) over(order by id asc)
    then NUM
    end as n
    from logs
) as t
where t.n is not null