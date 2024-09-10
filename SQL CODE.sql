---- TABLE-1 ---

Create table POLICE_STATION(
	Police_station_id varchar(120) primary key, 
	station_name varchar(120),
	police_staff int,
	Inspector_ID varchar(120),
	station_pincode bigint,
	no_of_cases int
)
select * from POLICE_STATION
copy POLICE_STATION FROM 'E:\POWER BI\POWER_BI-6\T1.csv' DELIMITER ',' CSV HEADER;


 ---- TABLE-2 ---

Create table INSPECTOR_INFO(
	Inspector_ID varchar(120),
	inspector_name varchar(120),
	Age int,
	Joining_date Date,
	Salary int
)
select * from INSPECTOR_INFO 
copy INSPECTOR_INFO FROM 'E:\POWER BI\POWER_BI-6\T2.csv' DELIMITER ',' CSV HEADER;

 ---- TABLE-3 ---

Create table CASES(
	max_case_type varchar(120),
	min_cases_type varchar(120),
	no_of_cases int,
	avg_solving_day int
)
select * from CASES 
copy CASES FROM 'E:\POWER BI\POWER_BI-6\T3.csv' DELIMITER ',' CSV HEADER;

 ---- TABLE-4  ---

Create table Zone_Details(
	station_pincode bigint,
	station_zone varchar(120),
	city varchar(120),
	state varchar(120)
)
select * from Zone_Details 
copy Zone_Details FROM 'E:\POWER BI\POWER_BI-6\T4.csv' DELIMITER ',' CSV HEADER;


--- FULL JOIN QUERY ---

SELECT P.Police_station_id,P.station_name,P.police_staff,
	P.Inspector_ID,I.inspector_name,I.Age,I.Joining_date,I.Salary,
    P.no_of_cases,C.max_case_type,C.min_cases_type,C.avg_solving_day,
	P.station_pincode,Z.station_zone,Z.city,Z.state FROM POLICE_STATION AS P
	FULL JOIN INSPECTOR_INFO AS I
	ON P.Inspector_ID=	I.Inspector_ID
	FULL JOIN CASES AS C
	ON P.no_of_cases=C.no_of_cases
	FULL JOIN Zone_Details AS Z 
	ON P.station_pincode=Z.station_pincode




