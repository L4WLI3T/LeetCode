CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
    SELECT distinct
    tmp.salary
    as SecondHighestSalary
    from (select dense_rank() over (order by salary desc) as rnk, salary
    from Employee) tmp
    where tmp.rnk=@N
    )
    ;
END