-- KPI Summary
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(revenue)*100,2) AS profit_margin
FROM bikedekho_sales;

-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(revenue) AS monthly_revenue
FROM bikedekho_sales
GROUP BY month
ORDER BY month;

-- Revenue by Category
SELECT 
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM bikedekho_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Top 5 Cities by Profit
SELECT 
    city,
    SUM(profit) AS total_profit
FROM bikedekho_sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 5;

-- Window Function Example (Advanced Level)
SELECT 
    city,
    revenue,
    RANK() OVER (PARTITION BY city ORDER BY revenue DESC) AS revenue_rank
FROM bikedekho_sales;
