# STACKING WHOLE 6 MONTHS DATA AND FURTHER ANALYZING

-- PERFORMING UNION OPERATION TO STACK DATA --
Create table case_study1.all_tripdata
Select * from case_study1.jan2021_tripdata
UNION ALL
Select * from case_study1.feb2021_tripdata
UNION ALL
Select * from case_study1.mar2021_tripdata
UNION ALL
Select * from case_study1.apr2021_tripdata
UNION ALL
Select * from case_study1.may2021_tripdata
UNION ALL
Select * from case_study1.jun2021_tripdata;

select monthname(started_at) as Months, member_casual , count(member_casual)  as count_of_members from case_study1.all_tripdata 
where member_casual="casual" 
group by Months order by month(started_at);

-- COMPUTING AVG ride_length FOR EACH MONTH from stacked dataset --
select monthname(started_at) as Months,SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length
from case_study1.all_tripdata 
group by Months order by month(started_at), day_of_week;

-- COMPUTING AVG ride_length FOR EACH MONTH & it's day from stacked dataset --
select monthname(started_at) as Months, DAYNAME(started_at) as Days, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length
from case_study1.all_tripdata 
group by Months, Days order by month(started_at), day_of_week;

-- COMPUTING AVG ride_length based on MEMBER TYPES FOR EACH MONTH from stacked dataset--
select month(started_at) as Months,member_casual, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length
from case_study1.all_tripdata 
group by Months, member_casual
order by Months;



-- COMPUTING AVG ride_length based on MEMBER TYPES FOR EACH MONTH & it's day of week from stacked dataset--
select monthname(started_at) as Months,DAYNAME(started_at) as Days,member_casual, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length
from case_study1.all_tripdata 
group by month(started_at), member_casual, Days
order by month(started_at), day_of_week;

-- COMPUTING AVG ride_length based on member types and counting total number of each member FOR EACH MONTH from stacked dataset--
select monthname(started_at) as Months,member_casual, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length, 
count(member_casual) as total_members
from case_study1.all_tripdata 
group by month(started_at), member_casual
order by Months;

-- Creating tables with above results containging details of ride_length based on meber type & each month --
Create table case_study1.ride_length_details 
select * from (select month(started_at) as Months,member_casual, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length, 
count(member_casual) as total_members
from case_study1.all_tripdata 
group by Months, member_casual
order by Months) as derived_ride_details;




-- GETTING NAME & COUNT OF MOST USED starting_station --
-- BASE ON member_types & month--
Select *  from (SELECT month(started_at) as Months, 
count(start_station_name) as total_count, 
start_station_name, member_casual
FROM   case_study1.all_tripdata 
where start_station_name <> "" 
GROUP  BY Months, start_station_name, member_casual
ORDER  BY COUNT(*) DESC) as t group by member_casual, Months order by Months;


-- Creating tables with above results containging details of start_station on member type & each month --
Create table case_study1.start_station_details
Select * from (
Select *  from (
SELECT month(started_at) as Months, 
count(start_station_name) as total_count, 
start_station_name, member_casual
FROM   case_study1.all_tripdata 
where start_station_name <> "" 
GROUP  BY Months, start_station_name, member_casual
ORDER  BY COUNT(*) DESC
) as t group by member_casual, Months order by Months
) as derived_start_station_details;


-- Creating tables containging details of end_station on member type & each month --
Create table case_study1.end_station_details
Select * from (
Select *  from (
SELECT month(started_at) as Months, 
count(end_station_name) as total_count, 
end_station_name, member_casual
FROM   case_study1.all_tripdata 
where end_station_name <> "" 
GROUP  BY Months, end_station_name, member_casual
ORDER  BY COUNT(*) DESC
) as t group by member_casual, Months order by Months
) as derived_end_station_details;




-- PERFORMING INNER JOIN ON ride_length_details, start_station-details & ean_station_details --
Create table case_study1.final_analysis
(Select r.*, s.total_count as count_of_start_station, s.start_station_name, e.total_count as count_of_end_station, e.end_station_name
From(( case_study1.ride_length_details r 
INNER JOIN case_study1.start_station_details s ON r.Months=s.Months AND r.member_casual=s.member_casual)
INNER JOIN case_study1.end_station_details e ON r.Months=e.Months AND r.member_casual=e.member_casual));





