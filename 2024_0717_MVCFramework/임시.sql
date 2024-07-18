select * from sawon

select * from gogek

select s.saname, s.sasex, g.godam
from sawon s, gogek g
where s.sawon = g.gogek;