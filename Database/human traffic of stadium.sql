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
