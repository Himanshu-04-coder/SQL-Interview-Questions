# Write your MySQL query statement below
WITH A as (SELECT person_name,turn, SUM(weight) 
    OVER(
    ORDER BY turn
    ROWS between unbounded preceding AND Current row
) as TOTAL_WEIGHT FROM Queue)

SELECT person_name FROM QUEUE
WHERE turn in (SELECT max(turn) FROM A
                WHERE TOTAL_WEIGHT <=1000 );