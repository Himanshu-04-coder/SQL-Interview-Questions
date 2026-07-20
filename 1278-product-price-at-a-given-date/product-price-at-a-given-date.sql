# Write your MySQL query statement below 
WITH A as (SELECT product_id, new_price as price FROM Products
WHERE (product_id, change_date) IN (SELECT product_id, MAX(change_date) FROM Products  
where change_date <= "2019-08-16"
Group by product_id))
SELECT product_id,price FROM A 
UNION 
SELECT distinct product_id, 10 as price FROM Products 
WHERE change_date > "2019-08-16" AND product_id not in (SELECT product_id FROM A)