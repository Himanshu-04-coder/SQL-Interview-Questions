# Write your MySQL query statement below
WITH CTE as (SELECT visited_on, 
    ROUND(SUM(amount) OVER(
    ORDER BY visited_on
    ROWS BETWEEN 6 preceding AND CURRENT ROW),2) 
    as amount , 
    ROUND(AVG(amount) OVER(
    ORDER BY visited_on
    ROWS BETWEEN 6 preceding AND CURRENT ROW),2)
    as average_amount,
    ROW_NUMBER() OVER(ORDER BY visited_on) as row_num
    FROM (SELECT visited_on, SUM(amount) as amount FROM Customer GROUP BY visited_on) as A
    GROUP BY visited_on)

    SELECT visited_on, amount, average_amount FROM CTE
    WHERE row_num>6;
