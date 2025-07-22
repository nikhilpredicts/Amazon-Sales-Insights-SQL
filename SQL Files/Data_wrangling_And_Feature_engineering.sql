/* Creation of Database */

create database amazon;

/* Using of Database */
use  amazon;

/*Creating Table */

create table amazondata(
	invoice_id VARCHAR(30) not null ,
    branch VARCHAR(5) not null,
    city VARCHAR(30) not null,student1
    customer_type VARCHAR(30) not null,
    gender VARCHAR(10) not null,
    product_line VARCHAR(100) not null,
    unit_price DECIMAL(10,2) not null,
    quantity Int not null,
    VAT FLOAT(6,4) not null,
    total DECIMAL(10,2) not null,
    date Date not null,
    time time not null,
    payment_method varchar(30) not null,
    cogs DECIMAL(10,2) not null,
    gross_margin_percentage FLOAT(11,9) not null,
    gross_income DECIMAL(10,2) not null,
    rating FLOAT not null
    );
    
    
/* Challenges Faced and changes maded: 
	-> time column in csv is not correctly formatted
	so we changed the Timestamp to time type of column to extract time 
    -> Payment_method is in categorical format so we've used varchar 
    instead of using the decimal type.
    ->In rating column of CSV the range exceeds than mentioned so I've
    removed the range in column type while creating the table 
    ** AND I've imported data from csv with Table data import Wizard** 
*/
    
/* FEATURE ENGINEERING */    

/* Add a new column named timeofday */
alter table amazondata add column  timeofday VARCHAR(15) 
as (
    case
        when TIME(time) between '00:00:00' AND '11:59:59' then 'Morning'
        when TIME(time) between '12:00:00' AND '17:59:59' then 'Afternoon'
        when TIME(time) between '18:00:00' AND '23:59:59' then 'Evening'
        else 'Unknown'
    end
	)stored;


/* Add a new column named dayname */

alter table amazondata add column  dayname VARCHAR(3) 
as (
	case
		when DAYOFWEEK(date) = 1 then 'Sun'  
		when DAYOFWEEK(date) = 2 then 'Mon'  
		when DAYOFWEEK(date) = 3 then 'Tue'  
		when DAYOFWEEK(date) = 4 then 'Wed'  
		when DAYOFWEEK(date) = 5 then 'Thu'  
		when DAYOFWEEK(date) = 6 then 'Fri'  
		when DAYOFWEEK(date) = 7 THEN 'Sat'  
		else 'Unknown'
	end)
    stored;

/* Add a new column named monthname */
alter table amazondata add column  monthname VARCHAR(3) 
as (
	case
		when MONTH(date) = 1 then 'Jan'
        when MONTH(date) = 2 then 'Feb'
        when MONTH(date) = 3 then 'Mar'
        when MONTH(date) = 4 then 'Apr'
        when MONTH(date) = 5 then 'May'
        when MONTH(date) = 6 then 'Jun'
        when MONTH(date) = 7 then 'Jul'
        when MONTH(date) = 8 then 'Aug'
        when MONTH(date) = 9 then 'Sep'
        when MONTH(date) = 10 then 'Oct'
        when MONTH(date) = 11 then 'Nov'
        when MONTH(date) = 12 then 'Dec'
        else 'Unknown'
    end)stored;

/*  determining which month of the year has the most sales and profit. */

select MONTH(date) as month_number,
    MONTHNAME(MIN(date)) as month_name,
    SUM(total) as total_sales,
    SUM(gross_income) as total_profit
from amazondata
group by MONTH(date)
order by total_sales DESC, total_profit DESC 
limit 1;


select * from amazondata;


drop database amazon;

drop table amazondata;
    

