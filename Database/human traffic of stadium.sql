--Method 1
select distinct S.id,S.visit_date,S.people from (
select
case when 
s.people>=100 and slg.people>=100 and sld.people>=100
then concat(s.id,',',slg.id,',',sld.id)
end as Sid
from stadium s
cross join stadium slg
cross join stadium sld 
where slg.id=s.id-1 and sld.id=s.id+1) T
join Stadium S on S.id in (select value from string_split(T.sid,','))
where sid is not null
--Method 2
with temp as (
select *,row_number() Over(order by id) as RN
,id-row_number() Over(order by id) as id_count
from dbo.stadium
where people>=100)
select id,visit_date,people from temp T
Where Exists
(
	select id_count
	from temp T2
	where T2.id_count=T.id_count
	group by id_count
	having count(*)>=3
)
