
-- RIDEABLE TYPES & IT'S COUNT FROM 6 MONTHS OF DATA --
select rideable_type,count(rideable_type) as count_of_rideable_type_used
from case_study1.all_tripdata 
group by rideable_type
order by count_of_rideable_type_used desc;

-- RIDEABLE TYPES & IT'S COUNT & avg ride_length covered FROM 6 MONTHS OF DATA --
select rideable_type,count(rideable_type) as count_of_rideable_type_used,  SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length_time 
from case_study1.all_tripdata 
group by rideable_type
order by count_of_rideable_type_used desc;

-- USAEG OF RIDEABLE TYPE BASED ON MONTH & MEMEBER TYPE --
select month(started_at) as Months, member_casual , 
rideable_type,count(rideable_type) as count_of_rideable_type_used,
SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length_time 
from case_study1.all_tripdata 
group by rideable_type, Months, member_casual
order by month(started_at) ;

Create table case_study1.rideable_type_details
select * from (
select month(started_at) as Months, member_casual , 
rideable_type,count(rideable_type) as count_of_rideable_type_used,
SEC_TO_TIME(avg(TIME_TO_SEC(ride_length)) ) as Avg_ride_length_time 
from case_study1.all_tripdata 
group by rideable_type, Months, member_casual
order by month(started_at)
) as derived_rideable_type_details;


ALTER TABLE case_study1.rideable_type_details 
RENAME COLUMN Avg_rideLength_bikeBased TO avg_rideLength_bikeBased;

Select r.*, f.Avg_ride_length as avg_rideLength_memberBased, f.total_members,f.start_station_name,f.count_of_start_station,
f.end_station_name,f.count_of_end_station
From case_study1.final_analysis f  
INNER JOIN case_study1.rideable_type_details r
ON f.Months=r.Months AND f.member_casual=r.member_casual;


Create table case_study1.final_analysis1
Select * from (
Select r.*, f.Avg_ride_length as avg_rideLength_memberBased, f.total_members,f.start_station_name,f.count_of_start_station,
f.end_station_name,f.count_of_end_station
From case_study1.final_analysis f  
INNER JOIN case_study1.rideable_type_details r
ON f.Months=r.Months AND f.member_casual=r.member_casual
) as derived_table;

ALTER TABLE case_study1.final_analysis1
MODIFY COLUMN Months VARCHAR(50);

Update case_study1.final_analysis1
set Months=
CASE 
	WHEN 1 THEN  'January'
	WHEN 2 Then 'Februrary'
	WHEN 3 THEN 'March'
	WHEN 4 Then 'April'
	WHEN 5 THEN 'May'
	WHEN 6 Then 'June'
END;

