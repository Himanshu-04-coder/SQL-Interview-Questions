# Write your MySQL query statement below
-- WITH total_users AS (
--     SELECT user_id, COUNT(user_id) as t FROM Users
-- )
SELECT  contest_id, 
        ROUND(COUNT(r.user_id)*100/u.total_user,2) as percentage
FROM Register r
LEFT JOIN 
    (SELECT a.user_id, COUNT(*) as total_user FROM Users a
        CROSS join Users b 
        GROUP BY user_id) as u
ON r.user_id = u.user_id
GROUP BY contest_id
ORDER BY percentage DESC , contest_id;
