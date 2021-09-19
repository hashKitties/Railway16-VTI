USE testingexam2;

-- 2.Viết câu lệnh query
-- a) Get lương tháng 5 của 1 user bất kì.
SELECT 
    s.user_role_id,
    u.first_name,
    u.last_name,
    s.total_salary,
    s.`month`
FROM
    salary s
        JOIN
    `user` u ON s.user_role_id = u.employee_id
WHERE
    s.`month` = 5;

-- b) Get danh sách lương tháng 5 của 1 phòng bất kì sắp xếp theo tổng
-- lương giảm dần
SELECT 
    d.`name`, SUM(s.total_salary) AS TotalSalary
FROM
    salary s
        JOIN
    user_role ur ON ur.id = s.user_role_id
        JOIN
    departments d ON ur.user_department = d.id
GROUP BY ur.user_department
HAVING ur.user_department = 1
ORDER BY SUM(s.total_salary);

-- c) Get nhưng user bị tính lương sai(total_salary != total detail salary)
-- trong tháng 5/2020
SET @total_detail_salary = 0;

SELECT 
    amout
FROM
    salary_detail
	