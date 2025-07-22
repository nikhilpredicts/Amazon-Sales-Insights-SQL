use amazon;

/*1. What is the count of distinct cities in the dataset? */

select count(distinct city) as count_of_distinct_cities
from amazondata;

/* 2.For each branch, what is the corresponding city? */

select distinct branch, city from amazondata;

/*3. What is the count of distinct product lines in the dataset? */

select count(distinct product_line) as count_of_distinct_product_lines
from amazondata;

/* 4.Which payment method occurs most frequently? */
select payment_method, count(payment_method) AS No_of_times_method_used
FROM amazondata
GROUP BY payment_method
ORDER BY No_of_times_method_used DESC
LIMIT 1;

/* 5.Which product line has the highest sales? */
select product_line, SUM(total) as total_sales
from amazondata
group by product_line
order by total_sales desc
limit 1;

/* 6.How much revenue is generated each month? */
select MONTH(date) as month_number,
    MONTHNAME(Min(date)) as month_name,
    SUM(total) as monthly_revenue
from amazondata
group by month(date)
order by month_number;

/* 7.In which month did the cost of goods sold reach its peak? */
select MONTH(date) as month_number,
    MONTHNAME(min(date)) as month_name,
    SUM(cogs) as total_cogs
from amazondata
group by  MONTH(date)
order by total_cogs desc
limit 1;

/* 8.Which product line generated the highest revenue? */
select product_line, SUM(total) as total_revenue
from amazondata group by product_line
order by total_revenue DESC
LIMIT 1;

/* 9.In which city was the highest revenue recorded? */
select city,SUM(total) as total_revenue
from amazondata group by city
order by total_revenue DESC
LIMIT 1;

/* 10.Which product line incurred the highest Value Added Tax? */
select product_line,SUM(vat) as total_vat
from amazondata
group by product_line
ORDER BY total_vat DESC
LIMIT 1;

/* 11.For each product line, add a column indicating "Good" if its sales are above average,
 otherwise "Bad." */
select product_line,SUM(total) AS total_sales,
if(SUM(total) > (select AVG(total) from amazondata), 'Good', 'Bad') as sales_position
from amazondata
group by product_line;
    
/* 12.Identify the branch that exceeded the average number of products sold. */
select branch, SUM(quantity) as total_quantity_sold
from amazondata
group by branch
having total_quantity_sold > (SELECT AVG(quantity) FROM amazondata);

/* 13.Which product line is most frequently associated with each gender? */
select gender,product_line,COUNT(*) as frequency
from amazondata
group by gender, product_line
order by gender, frequency desc
limit 1;

/* 14.Calculate the average rating for each product line. */
select product_line, avg(rating) as average_rating
from amazondata group by product_line;

/* 15.Count the sales occurrences for each time of day on every weekday. */
select DAYNAME(date) as weekday,time(time) as time_of_day,
COUNT(*) as sales_occurrences
from amazondata
group by weekday, time_of_day
order by weekday, time_of_day;

/* 16.Identify the customer type contributing the highest revenue. */
select customer_type, SUM(total) as total_revenue
from amazondata
group by customer_type
order by total_revenue desc
limit 1;

/* 17.Determine the city with the highest VAT percentage. */
select city, AVG(VAT) as average_VAT
from amazondata
group by city
order by average_VAT desc
limit 1;

/* 18.Identify the customer type with the highest VAT payments.	 */
select customer_type, SUM(VAT) as VAT_payments
from amazondata
group by  customer_type
order by VAT_payments desc
LIMIT 1;

/* 19.What is the count of distinct customer types in the dataset? */
select COUNT(distinct customer_type) as count_of_distinct_customer_types
from amazondata;

/* 20.What is the count of distinct payment methods in the dataset? */
select COUNT(distinct payment_method) as count_of_distinct_payment_methods
from amazondata;

/* 21.Which customer type occurs most frequently? */
select customer_type, COUNT(customer_type) as frequency
from amazondata
group by customer_type
order by frequency desc limit 1;

/*22.Identify the customer type with the highest purchase frequency.*/
select customer_type, COUNT(customer_type) as purchase_frequency
from amazondata
group by customer_type
order by  purchase_frequency desc limit 1;

/* 23.Determine the predominant gender among customers. */
select gender, COUNT(*) as gender_count
from amazondata group by gender
order by gender_count desc
limit 1;

/* 24.Examine the distribution of genders within each branch.*/
select branch, gender, COUNT(*) as gender_count
from amazondata
group by  branch, gender
order by branch, gender;

/* 25.Identify the time of day when customers provide the most ratings.*/
select TIME(time) as time_of_day, COUNT(*) AS rating_count
from amazondata
group by time_of_day
order by rating_count desc
limit 1;

/* 26.Determine the time of day with the highest customer ratings for each branch.*/
select branch, TIME(time) as time_of_day, COUNT(*) as rating_count
from amazondata
GROUP BY branch, time_of_day
ORDER BY branch, rating_count DESC;



/* 27.Identify the day of the week with the highest average ratings.*/
select DAYNAME(date) as day_of_week, AVG(rating) as average_rating
from amazondata
group by day_of_week
order by average_rating desc limit 1;

/*28.Determine the day of the week with the highest average ratings for each branch.*/
select branch, DAYNAME(date) as day_of_week, AVG(rating) as average_rating
from amazondata
group by branch, day_of_week
order by branch, average_rating desc;

