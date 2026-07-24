# Write your MySQL query statement below
SELECT b.name as Department, 
       a.name as Employee,
       a.salary as Salary
FROM Employee a
JOIN Department b
ON a.departmentId  = b.id
WHERE a.name IN (SELECT name 
                    FROM 
                    (SELECT name, 
                            DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as d_rank FROM Employee) as abc
                        WHERE d_rank<=3)

