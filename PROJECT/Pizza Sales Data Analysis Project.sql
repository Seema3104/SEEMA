#Pizza Sales Data Analysis Project#

#......KPI:
/*1-KPI Total Revenue
2-KPI Avg Order Value
3-KPI Total Pizza Sold
4-KPI Total Orders
5-KPI Avg Pizza Per Order*/

#.....Questions to Answer 
/*...1) Daily Trends for total Orders
....2) Hourly Trends for Total Orders
...3) Percentage of sales by Pizza Category
....4) Percentage of sales by Pizza Size
...5)Total Pizzas Sold by Pizza 
....6) Top 5 Best Sellers by Total Pizza
....7) Bottom 5 worst sellers by total pizza*/

use world;
SELECT * FROM pizza_sales;
#.....KPIS
#Q.1) Total Revenue
select * from pizza_sales;
Select
order_id,
sum(quantity*unit_price) as total_revenue from pizza_sales
group by order_id
Order by total_revenue desc;

#Q.2) Average Order values....
# Ans....total order value/order count
select * from pizza_sales;
select
round(sum(quantity*unit_price)/count(distinct order_id),2) as Average_Order_Values from pizza_sales;

select
pizza_name,
round(sum(quantity*unit_price)/count(distinct order_id),2) as Average_Order_Values from pizza_sales
group by pizza_name
order by Average_order_values desc;

# Q.3..Total Pizzas Sold
Select
sum(quantity) as Total_pizza_sold from pizza_sales;

# Q.4...Total Orders
Select count(distinct order_id)as Total_orders from Pizza_sales;

#Q.s ...Average Pizzas Per Order
select * from pizza_sales;
select 
sum(Quantity)/count(Distinct Order_id) as Average_Pizzasperorder from Pizza_sales;

#Qusetions.....
#Q.1 Daily trends for total Orders
select
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day_of_week,
    count(Distinct Order_id) as total_Orders from Pizza_sales
group by day_of_week
order by total_orders desc;

#Q.2..Hourly Trends for total orders
select * from Pizza_sales;
SELECT
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY order_hour;

select * from pizza_sales;
# Q.3 Percentage of sales by Pizza Category(...here we have to calculate total_revenue per category, % sales calculated as (a:/total_revenue)*100
select
pizza_category,
sum(total_price) as total_sales,
round(sum(total_price)*100/(
select sum(total_price) from pizza_sales),2) as sales_percentage from pizza_sales
group by pizza_category
order by sales_percentage desc;

# Q.4 percentage sales by pizzasize
select * from pizza_sales;
select 
Pizza_size,
sum(total_price) as total_sales,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as sales_percentage from pizza_sales
group by pizza_size
order by sales_percentage desc;

#Q.5 Total Pizza Sales by pizza category
Select
Pizza_category,
sum(quantity) as Quanity_sold from pizza_sales
group by pizza_category
order by sum(quantity) desc;

# Q.6 Top 5 best sellers by Total Pizza Sold
select * from pizza_sales;
select
Pizza_name,
sum(quantity) as total_pizza from Pizza_sales
group by Pizza_name
order by total_pizza desc limit 5;

# Q.7...bottom 5 worst sellers by Total Pizzas Sold
select
pizza_name,
sum(quantity) as Total_Pizza from Pizza_sales
group by pizza_name
order by Total_Pizza asc limit 5;



















