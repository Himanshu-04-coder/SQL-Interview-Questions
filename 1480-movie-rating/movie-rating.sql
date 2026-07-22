# Write your MySQL query statement below
(SELECT name as results FROM Users u
JOIN MovieRating m
ON m.user_id=u.user_id
GROUP BY m.user_id
ORDER BY COUNT(m.user_id) desc, name asc
LIMIT 1)
UNION ALL
(SELECT title as results FROM Movies mo
JOIN MovieRating m
ON mo.movie_id = m.movie_id
WHERE DATE_FORMAT(created_at, "%Y-%m") = "2020-02"
GROUP BY m.movie_id
ORDER BY AVG(rating) desc, title asc
LIMIT 1)


