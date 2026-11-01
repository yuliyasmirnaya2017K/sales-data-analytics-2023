--1.Вивантаження щомісячної динаміки та загальних сум продажів за категоріями.
SELECT
category,
 SUBSTR(order_date, 1, 7) AS sales_month,
 SUM(price * quantity)AS total_revenue
FROM combined_sales_data
GROUP BY sales_month, category
ORDER BY sales_month ASC, total_revenue DESC;


--2.Визначення ТОП-10 клієнтів за сумою витрачених коштів.
SELECT customer_id,
       customer_name
 SUM(price * quantity)AS total_spent
 FROM combined_sales_data
GROUP BY customer_id,
         customer_name
ORDER BY total_spent DESC
LIMIT 10;




--3.Підрахунок загальної кількості проданих одиниць та аналіз популярності продуктів.
SELECT product_name,
sum(quantity) AS total_quantity
FROM combined_sales_data
GROUP BY product_name
ORDER BY total_quantity DESC ;


--4.Розрахунок середньої ціни продажу для кожної категорії продуктів.
SELECT category,
ROUND(AVG(price),2) AS avg_price
FROM combined_sales_data
GROUP BY category
ORDER BY avg_price DESC;


--5.Аналіз операційного навантаження та активності за днями тижня.
SELECT
CASE STRFTIME('%w', order_date)
    WHEN '1' THEN 'Понеділок'
    WHEN '2' THEN 'Вівторок'
    WHEN '3' THEN 'Середа'
    WHEN '4' THEN 'Четвер'
    WHEN '5' THEN 'П''ятниця'
    WHEN '6' THEN 'Субота'
    ELSE 'Неділя'
END AS day_of_week,
SUM(quantity) AS total_units_sold
FROM combined_sales_data
GROUP BY day_of_week
ORDER BY total_units_sold DESC;

