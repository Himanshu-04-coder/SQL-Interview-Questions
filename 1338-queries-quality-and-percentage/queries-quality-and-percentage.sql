# Write your MySQL query statement below
SELECT a.query_name, ROUND(SUM(rating/position)/COUNT(*),2) as quality, ROUND(IFNULL(b.ql*100/count(a.rating),0),2) as poor_query_percentage
FROM Queries a
LEFT JOIN (SELECT query_name, COUNT(query_name) as ql FROM Queries where rating < 3 group by query_name) as b
ON a.query_name = b.query_name
GROUP BY query_name;