-- Monday Coffee -- Data Analysis 

SELECT * FROM city;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM sales;




-- 1 Which city has the highest sales revenue?

select ci.city_name, sum(s.total) as total_revenue
FROM Sales s inner join Customers c on s.customer_id = c.customer_id
inner join  City ci on c.city_id = ci.city_id
group by ci.city_name
order by total_revenue desc
limit 1;

-- 2.Which product has the highest average rating?

SELECT p.product_name, avg(s.rating) as average_rating
from Sales s inner join Products p on s.product_id = p.product_id
group by p.product_name
order by average_rating DESC
LIMIT 1;

-- 3.Identify the top 5 customers based on total spend.

select c.customer_name,sum(s.total) as total_spend
from Sales s left join Customers c on s.customer_id = c.customer_id
group by c.customer_name
order by total_spend desc
limit 5;


-- 4.List the products sold in each city.

select ci.city_name, p.product_name from Sales s
inner join Customers c on  s.customer_id = c.customer_id
inner join City ci on c.city_id = ci.city_id
inner join Products p on s.product_id = p.product_id
group by ci.city_name, p.product_name
order by ci.city_name, p.product_name;
    
--  5. Which city has the highest average estimated rent?

select city_name, avg(estimated_rent) as average_rent from City
group by city_name
order by average_rent desc
limit 1;


-- 6.Top products in terms of total sales revenue?

select p.product_name, sum(s.total) as total_revenue
from Sales s inner join Products p on s.product_id = p.product_id
group by p.product_name
order by total_revenue DESC;

-- 7.Average product price in each city.
select p.product_name, count(s.sale_id) as sales_count from Sales s
inner join Products p ON s.product_id = p.product_id
group by  p.product_name;


-- 8.How many people in each city are estimated to consume coffee, given that 25% of the population does?

select  city_name,ROUND((population * 0.25)/1000000, 2)
as coffee_consumers_in_millions,city_rank from city
order by 2 desc;

-- 9.What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

select ci.city_name,sum(s.total) as total_revenue from sales as s
join customers as c on s.customer_id = c.customer_id
join city as ci on ci.city_id = c.city_id
where EXTRACT(YEAR FROM s.sale_date)  = 2023 AND EXTRACT(quarter FROM s.sale_date) = 4
group by 1
order by 2 desc;

 -- 10.Find the highest rated product?

select p.product_name, max(s.rating) AS highest_rating from Sales s
inner join Products p on s.product_id = p.product_id
group by p.product_name
order by highest_rating DESC
limit 1;





