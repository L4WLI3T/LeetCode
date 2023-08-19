SELECT b.id
FROM Weather a
INNER JOIN Weather b ON b.recordDate = DATEADD(Day,1,a.recorddate)
where b.temperature>a.temperature