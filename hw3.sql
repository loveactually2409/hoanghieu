SELECT * FROM school.crime;

select *,
(ViolentCrime+Rape+Murder+Robbery+AggravatedAssault+PropertyCrime+Burglary+Theft+MotorVehicleTheft) as TSLPT
from  school.crime;


with A as ( 
    select *
           , (ViolentCrime+Rape+Murder+Robbery+AggravatedAssault+PropertyCrime+Burglary+Theft+MotorVehicleTheft) as TSLPT
	from  school.crime
)
select * 
from A;

select * , PERCENTILE_CONT (0.5) within group (order by TSLPT ) over (partition by * ) as Q2
from A



SELECT * FROM school.metro_startup_ranking;

select *,
PERCENTILE_CONT(.25) WITHIN GROUP (ORDER BY Startup Rank) OVER () AS Q2
where Q2 < 10.5
from school.metro_startup_ranking;

