# Write your MySQL query statement below
SELECT p.product_id, 
        IFNULL(ROUND(SUM(price*units)/SUM(units),2),0) average_price
FROM Prices p
Left Join UnitsSold u
    ON p.product_id = u.product_id
    AND purchase_date between start_date AND end_date
GROUP BY product_id;