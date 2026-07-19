# Write your MySQL query statement below
SELECT DISTINCT l1.num ConsecutiveNums FROM Logs l1
Join Logs l2
ON l1.id=l2.id+1
JOIN Logs l3
ON l2.id=l3.id+1
AND l1.num=l2.num AND l2.num=l3.num

