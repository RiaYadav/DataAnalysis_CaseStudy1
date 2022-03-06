# ANALYSING JAN2021 DATA TO GET THE ISIGHTS AND UNDERSTAND THE DATA.

-- Fetching  & Analysing mean of ride_length from jan data --
select Cast(avg(ride_length) as time) as Avg_ride_length from case_study1.jan2021_tripdata;


-- Fetching & Analysing maximum ride_length in terms of time from jan data --
select Cast(max(ride_length) as time) as Avg_ride_length from case_study1.jan2021_tripdata;


-- Fetching & Analysing mode ride_length in terms of time i.e. what is most commmon time for ride_length from jan data --
SELECT count(ride_length), ride_length
FROM   case_study1.jan2021_tripdata
GROUP  BY ride_length
ORDER  BY COUNT(*) DESC Limit  1;

-- Fetching & Analysing distribution(count) for casual & members only from jan data --
select  member_casual, count(member_casual) as count_of_member_type from case_study1.jan2021_tripdata group by member_casual;

-- Fetching & Analysing avg ride_length for casual & members only from jan data --
select member_casual, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_using_sec_to_time 
from case_study1.jan2021_tripdata group by member_casual;

-- Fetching & Analysing avg ride_length for casual & members based on day_of_week only from jan data --
select member_casual, DAYNAME(started_at), SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_using_sec_to_time 
from case_study1.jan2021_tripdata 
group by day_of_week,member_casual order by day_of_week;

-- Fetching & Analysing avg ride_length for casual & members and total rides based on day_of_week only from jan data --
select member_casual ,DAYNAME(started_at),count(ride_id) as total_ride, SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_using_sec_to_time 
from case_study1.jan2021_tripdata 
group by day_of_week,member_casual order by day_of_week;


-- Fetching & Analysing count of each start_Station for casual members only from jan data thus knwoing highest used starting-station --
select start_station_name, count(start_station_name)
from case_study1.may2021_tripdata where member_casual ='casual' 
GROUP  BY start_station_name
order by count(start_station_name) desc;

-- Fetching & Analysing count of each end_Station for casual members only from jan data thus knwoing highest used ending-station --
select end_station_name, count(end_station_name)
from case_study1.jan2021_tripdata where member_casual ='casual' 
GROUP  BY end_station_name
order by count(end_station_name) desc;

-- Fetching & Analysing count of each set of start & end Station for casual members only from jan data --
-- thus knowing highest used start & end station combinations --
select start_station_name,end_station_name, ride_length, started_at, ended_at, count(*) as station_combination_count
from case_study1.jan2021_tripdata where member_casual ='casual' 
GROUP  BY start_station_name, end_station_name
order by count(*) desc;


-- Fetching & Analysing count of each start_Station for  members only from jan data thus knwoing highest used starting-station --
select start_station_name, count(start_station_name)
from case_study1.jan2021_tripdata where member_casual ='member' 
GROUP  BY start_station_name
order by count(start_station_name) desc;

-- Fetching & Analysing count of each end_Station for members only from jan data thus knwoing highest used ending-station --
select end_station_name, count(end_station_name)
from case_study1.jan2021_tripdata where member_casual ='member' 
GROUP  BY end_station_name
order by count(end_station_name) desc;

-- Fetching & Analysing count of each set of start & end Station for casual members only from jan data --
-- thus knowing highest used start & end station combinations --
select start_station_name,end_station_name, ride_length, started_at, ended_at, count(*) as station_combination_count
from case_study1.jan2021_tripdata where member_casual ='member' 
GROUP  BY start_station_name, end_station_name
order by count(*) desc;


-- Fetching & Analysing count of each set of start & end Station for both members combines only from jan data --
-- thus knowing highest used start & end station combinations --
select start_station_name,end_station_name, ride_length, started_at, ended_at, member_casual,count(*) as station_combination_count
from case_study1.jan2021_tripdata 
GROUP  BY start_station_name, end_station_name, member_casual
order by count(*) desc;


#detecting duplicates 
select ride_id  from case_study1.jan2021_tripdata group by ride_id having count(*)>1;

