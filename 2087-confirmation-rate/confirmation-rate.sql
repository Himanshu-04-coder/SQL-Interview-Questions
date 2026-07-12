# Write your MySQL query statement below
SELECT s.user_id,ROUND(IFNULL(AVG(c.num),0),2) as confirmation_rate
FROM Signups s
LEFT JOIN (select user_id, case action when action='confirmed' then 1 when action='timeout' then 0 ELSE 0 END as num
From Confirmations) as c
ON s.user_id = c.user_id
group by user_id;


-- Using IF()
-- # Write your MySQL query statement below
-- select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
-- from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;

