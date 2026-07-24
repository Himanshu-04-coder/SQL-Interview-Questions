# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016),2) as tiv_2016 FROM Insurance
WHERE CONCAT(lat," ",lon) NOT IN (
    SELECT CONCAT(lat," ",lon) as loc FROM Insurance
    GROUP BY loc
    HAVING COUNT(loc)>1
    )
    AND 
    tiv_2015 IN (
    SELECT tiv_2015 FROM Insurance 
    GROUP BY tiv_2015 
    HAVING COUNT(tiv_2015)>1);


