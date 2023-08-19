select P.firstname,P.lastname,A.city,A.state
from Person P
Left Join Address A on A.personId=P.personId