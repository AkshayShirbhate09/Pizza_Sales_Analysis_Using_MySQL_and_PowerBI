use pizza_db
select * from pizza_sales
desc pizza_sales

---------------------------------------------------------
1.Total Revenue
select round(sum(total_price),2) as Total_Revenue from pizza_sales

2. Average Order Value
Select round(sum(total_price) / count(distinct order_id),2) as Avg_Order_Value from Pizza_sales

3. Total Pizza Sold
Select sum(quantity) as total_Sells from Pizza_sales 

4. Total Orders
Select count(distinct order_id) as Total_orders from pizza_sales

5. Average Pizzas Per Order
select sum(quantity) / count(distinct order_id) as Avg_pizza_per_order from pizza_sales

6. Daily Trend for Total_Order
	select case when day(order_date) = 2 then 'Monday'
	when day(order_date) = 3 then 'Tuesday'
	when day(order_date) = 4 then 'Wednesday'
	when day(order_date) = 5 then 'Thursday'
	when day(order_date) = 6 then 'Friday'
	when day(order_date) = 7 then 'Saturday'
	else 'Sunday' end as order_day,
	Count(distinct order_id) as Tot_orders 
	from pizza_sales
	group by 1
	order by 1

7. Monthly Trend for Total_Order
	select case 
		when month(order_date) = 1 then 'Jan'
		when month(order_date) = 2 then 'Feb'
		when month(order_date) = 3 then 'March'
		when month(order_date) = 4 then 'Apr'
		when month(order_date) = 5 then 'May'
		when month(order_date) = 6 then 'June'
		when month(order_date) = 7 then 'July'
		when month(order_date) = 8 then 'Aug'
		when month(order_date) = 9 then 'Sept'
		when month(order_date) = 10 then 'Oct'
		when month(order_date) = 11 then 'Nov'
		when month(order_date) = 12 then 'Dec'
	else 0 end as Month_name,
	count(distinct order_id) as Total_Orders 
	from Pizza_Sales
	group by 1
	order by 1

8. Percentage of sales by Pizza Category
	Select pizza_category, cast(sum(total_price) as decimal(10,2)) Tot_Revenue,
	round(100*sum(total_price)/(select sum(total_price) from pizza_sales),2) as Sales_Percent
	from pizza_sales
	group by 1

9. Percentage of sales by Pizza Size
	Select pizza_size, cast(sum(total_price) as decimal(10,2)) as Tot_Revenue,
	Round(100*sum(total_price) / (select sum(total_price) from pizza_sales),2) as  Sales_Percent
	from Pizza_sales
	group by 1
	order by 3 Desc

10. Total Pizza sold by each category in February Month
	Select pizza_category, Sum(quantity) as Total_Pizza
	from pizza_sales 
	where month(order_date) = 2
	group by 1

11. Top 5 Pizza having highest selling
	select pizza_name, sum(total_price) as Total_Revenue
	from pizza_sales
	group by 1
	order by Total_Revenue Desc
	limit 5

12. List of 5 Pizzas having Lowest Selling 
	select pizza_name, cast(sum(total_price) as decimal(10,2)) as Total_Revenue
	from pizza_sales
	group by 1
	order by Total_Revenue
	limit 5

13. Top 5 Pizza having highest sold Qauntity
	Select pizza_name, sum(quantity) as Total_Qty_Sold 
	from Pizza_sales
	group by 1
	order by Total_Qty_Sold Desc
	Limit 5

14. List of 5 Pizzas having Lowest Sold Quantity 
	select pizza_name, sum(quantity) as Total_Qty_Sold
	from Pizza_sales
	Group by 1
	Order by Total_Qty_Sold
	limit 5

15. Top 5 pizza having highest orders
	select pizza_name, count(distinct order_id) as Total_orders
	from pizza_sales
	group by 1
	order by Total_orders desc
	limit 5 

16. 5 pizza having Lowest orders
	select pizza_name, count(distinct order_id) as Total_orders
	from pizza_sales
	group by 1
	order by Total_orders
	limit 5
