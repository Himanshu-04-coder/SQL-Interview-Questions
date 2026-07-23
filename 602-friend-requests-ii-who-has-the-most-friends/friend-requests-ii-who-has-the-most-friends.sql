# Write your MySQL query statement below
WITH CTE AS (SELECT requester_id, COUNT(requester_id) as counts FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id, COUNT(accepter_id) FROM RequestAccepted
GROUP BY accepter_id)

SELECT requester_id id, SUM(counts) as num FROM CTE
GROUP BY requester_id
ORDER BY num desc
LIMIT 1;