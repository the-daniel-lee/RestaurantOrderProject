-- 1. Combine the menu_items and order_details into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id;
	
-- 2. What were the least and most ordered items? What categories were they in?
-- "For each" item, how many times was it ordered = GROUP BY
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spent
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather?
SELECT category, count(item_id) as num_items
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- 5. View the details of the top 5 highest spend orders. What insights can you gather?
SELECT order_id, category, count(item_id) as num_items
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id, category;

SELECT order_id, SUM(price) AS total_spent
FROM order_details AS od
LEFT JOIN menu_items as mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

