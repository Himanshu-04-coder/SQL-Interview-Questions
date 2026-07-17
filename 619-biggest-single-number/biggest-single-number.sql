# Write your MySQL query statement below
WITH A as
(SELECT num, COUNT(num) FROM MyNumbers
GROUP BY num
HAVING COUNT(num)=1)

SELECT MAX(num) as num
    FROM A;
