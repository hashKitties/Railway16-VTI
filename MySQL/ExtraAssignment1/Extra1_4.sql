USE extra_assignment1;

-- Create Table

DROP TABLE IF EXISTS department;
CREATE TABLE department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee(
	EmployeeNumber			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeName			VARCHAR(50) NOT NULL,
    DepartmentNumber		TINYINT UNSIGNED,
    FOREIGN KEY(DepartmentNumber) REFERENCES department(DepartmentID) ON DELETE NO ACTION
);

DROP TABLE IF EXISTS employee_skill;
CREATE TABLE IF NOT EXISTS employee_skill(
	EmployeeNumber			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    SkillCode				VARCHAR(50),
    DateRegistered			DATE,
    FOREIGN KEY(EmployeeNumber) REFERENCES employee(EmployeeNumber) ON DELETE NO ACTION
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table
INSERT INTO department	(DepartmentName) 
VALUES					(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);

INSERT INTO employee 	(EmployeeName, 			DepartmentNumber)
VALUES 					('Dao Tien Ha',				1			),
						('Pham Thi Ly',				2			),
						('Ngo Thi Thu',				3			),
						('Nguyen Van Cong',			4			),
						('Tran Tuan Anh',			8			),
						('Hoang Kim Phuong',		6			),
						('Nguyen Thi Dien',			1			),
						('Nguyen Van Bien',			6			),
						('Luong Minh Cong',			4			),
						('Ta Duc Tam',				2			),
						('Nguyen Van Hung',			4			),
						('Do Viet Dung',			6			),
						('Chu Thi An',				2			),
						('Nguyen Thi Xuan',			8			),
						('Pham Thi Hai',			10			);

INSERT INTO employee_skill (EmployeeNumber,	SkillCode,		DateRegistered)
VALUES 						(1,				'Java',			'2009-01-10'),
							(2,				'NET',			'2010-02-11'),
							(3,				'SQL',			'2011-03-12'),
							(4,				'Postman',		'2012-04-13'),
							(5,				'Ruby',			'2013-05-14'),
							(6,				'Git',			'2014-06-15'),
							(7,				'Python',		'2015-07-16'),
							(8,				'Javascript',	'2016-08-17'),
							(9,				'Python',		'2017-09-18'),
							(10,			'Javascript',	'2018-10-19'),
							(11,			'Angular',		'2019-11-20'),
							(12,			'NoteJS',		'2020-12-21'),
							(13,			'HTML',			'2021-04-22'),
							(14,			'CSS',			'2022-07-23'),
							(15,			'Java',			'2023-07-24');

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java Hướng dẫn: sử dụng UNION
SELECT 
    employee.EmployeeName, employee_skill.SkillCode
FROM
    employee
        JOIN
    employee_skill ON employee.EmployeeNumber = employee_skill.EmployeeNumber
WHERE
    SkillCode = 'Java';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 
    DepartmentNumber, COUNT(EmployeeNumber) AS NumberOfEmployees
FROM
    employee
GROUP BY DepartmentNumber
HAVING NumberOfEmployees > 3;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban Hướng dẫn: sử dụng GROUP BY
SELECT 
    DepartmentNumber, EmployeeName
FROM
    employee
GROUP BY EmployeeNumber
ORDER BY DepartmentNumber;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills Hướng dẫn: sử dụng DISTINCT
SELECT 
    EmployeeNumber, COUNT(SkillCode) AS NumberOfSkill
FROM
    employee_skill
GROUP BY EmployeeNumber
HAVING NumberOfSkill > 1
ORDER BY EmployeeNumber;