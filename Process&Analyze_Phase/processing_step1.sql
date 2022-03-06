
-- Altering and modifying table data and datatypes--

Update case_study1.mar2021_tripdata 
set started_at= str_to_date(started_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.mar2021_tripdata MODIFY COLUMN started_at DATETIME;

Update case_study1.mar2021_tripdata 
set ended_at= str_to_date(ended_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.mar2021_tripdata MODIFY COLUMN ended_at DATETIME;



Update case_study1.apr2021_tripdata 
set started_at= str_to_date(started_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.apr2021_tripdata MODIFY COLUMN started_at DATETIME;

Update case_study1.apr2021_tripdata 
set ended_at= str_to_date(ended_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.apr2021_tripdata MODIFY COLUMN ended_at DATETIME;



Update case_study1.may2021_tripdata 
set started_at= str_to_date(started_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.may2021_tripdata MODIFY COLUMN started_at DATETIME;

Update case_study1.may2021_tripdata 
set ended_at= str_to_date(ended_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.may2021_tripdata MODIFY COLUMN ended_at DATETIME;



Update case_study1.jun2021_tripdata 
set started_at= str_to_date(started_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.jun2021_tripdata MODIFY COLUMN started_at DATETIME;

Update case_study1.jun2021_tripdata 
set ended_at= str_to_date(ended_at , "%d-%m-%Y %H:%i:%s");

ALTER TABLE case_study1.jun2021_tripdata MODIFY COLUMN ended_at DATETIME;

SELECT *
FROM case_study1.jan2021_tripdata a
INNER JOIN case_study1.jan2021_tripdata b ON a.ride_id = b.ride_id
WHERE a.ride_id <> b.ride_id;



#SELECT CAST(ride_length as datetime) AS started_at FROM case_study1.jan2021_tripdata;





