use amazon;
/*Product analysis*/
/* Top-performing product lines based on total sales */
select product_line, SUM(total) as total_sales
from amazondata
group by  product_line
order by total_sales desc;

/* Least performing product lines with lowest sales to identify 
areas of improvement */
select product_line, SUM(total) as total_sales
from amazondata
group by  product_line
order by total_sales asc;

/*Sales Analysis*/
/* Total sales per month */
select MONTH(date) as month, SUM(total) as total_sales
from amazondata group by month
order by  month;

/* Total sales per branch */
select branch, SUM(total) as total_sales
from amazondata group by branch
order by total_sales desc;

/*Total sales by payment method*/
select payment_method, SUM(total) as total_sales
from amazondata group by payment_method
order by total_sales desc;

/*Customer Analysis*/
/*Total amount spent by customer type and How many times customer type purchased*/
select customer_type, SUM(total) as total_amount, COUNT(*) as purchase_count
from amazondata group by customer_type
order by total_amount desc;

/*Top performing branches based on customer rating*/
select branch, AVG(rating) as avg_rating
from amazondata
group by branch order by avg_rating desc;





