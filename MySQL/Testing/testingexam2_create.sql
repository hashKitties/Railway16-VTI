DROP DATABASE IF EXISTS testingexam2;
CREATE DATABASE IF NOT EXISTS testingexam2;
USE testingexam2;

-- Create table
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
    id 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    first_name 		VARCHAR(30),
    last_name 		VARCHAR(30),
    email 			VARCHAR(100),
    phone 			VARCHAR(20),
    employee_id 	VARCHAR(10),
    avatar 			CHAR(10),
    department_id 	TINYINT,
    gender 			TINYINT,
    age 			TINYINT,
    created_date 	DATETIME DEFAULT NOW(),
    updated_date 	DATETIME DEFAULT NOW()
);


DROP TABLE IF EXISTS departments;
CREATE TABLE IF NOT EXISTS departments (
    id 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    `name` 			VARCHAR(30),
    `description` 	TEXT,
    created_date 	DATETIME DEFAULT NOW(),
    updated_date 	DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles (
    id 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    `name` 			VARCHAR(30),
    created_date 	DATETIME DEFAULT NOW(),
    updated_date 	DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS salary_detail_type;

CREATE TABLE IF NOT EXISTS salary_detail_type (
    id 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    `name` 			VARCHAR(10),
    created_date 	DATETIME DEFAULT NOW(),
    updated_date 	DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS user_department;
CREATE TABLE IF NOT EXISTS user_department (
    id 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    user_id 		TINYINT,
    department_id 	TINYINT,
    start_date 		DATETIME DEFAULT NOW(),
    end_date 		DATETIME DEFAULT NOW(),
    created_date 	DATETIME DEFAULT NOW(),
    updated_date 	DATETIME DEFAULT NOW()
);


DROP TABLE IF EXISTS user_role;
CREATE TABLE IF NOT EXISTS user_role (
    id 					TINYINT PRIMARY KEY AUTO_INCREMENT,
    user_department 	TINYINT,
    role_id 			TINYINT,
    start_date 			DATETIME DEFAULT NOW(),
    end_date 			DATETIME DEFAULT NOW(),
    created_date 		DATETIME DEFAULT NOW(),
    updated_date 		DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS salary;
CREATE TABLE IF NOT EXISTS salary (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    user_role_id TINYINT,
    total_salary DOUBLE(12 , 2 ),
    `month` VARCHAR(2),
    `year` VARCHAR(4),
    created_date DATETIME DEFAULT NOW(),
    updated_date DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS salary_detail;
CREATE TABLE IF NOT EXISTS salary_detail (
    id 						TINYINT PRIMARY KEY AUTO_INCREMENT,
    amount 					DOUBLE(12 , 2 ),
    salary_id 				TINYINT,
    salary_detail_type_id 	TINYINT,
    operation 				TINYINT
);


-- Insert Data

INSERT INTO `user`(first_name,	last_name,	email,				phone,			employee_id,	avatar,	department_id,	gender,	age )
VALUES 
					('Dao',		'Ha',		'Ha@gmail.com',		'0911210211',	'1',			'Co',		'1',		'1',	'19'),
					('Ngo',		'Thu',		'Thu@gmail.com',	'0911210213',	'3',			'Co',		'1',		'1',	'52'),
					('Nguyen',	'Cong',		'Cong@gmail.com',	'0911210214',	'4',			'Co',		'1',		'0',	'46'),
					('Tran',	'Anh',		'Anh@gmail.com',	'0911210215',	'5',			'Co',		'1',		'0',	'37'),
					('Hoang',	'Phuong',	'Phuong@gmail.com',	'0911210216',	'6',			'Co',		'2',		'0',	'28'),
					('Nguyen',	'Dien',		'Dien@gmail.com',	'0911210217',	'7',			'Co',		'2',		'2',	'29'),
					('Nguyen',	'Bien',		'Bien@gmail.com',	'0911210218',	'8',			'Co',		'3',		'2',	'34'),
					('Luong',	'Cong',		'Cong@gmail.com',	'0911210219',	'9',			'Co',		'4',		'1',	'31'),
					('Ta',		'Tam',		'Tam@gmail.com',	'0911210220',	'10',			'Co',		'5',		'1',	'30'),
					('Nguyen',	'Hung',		'Hung@gmail.com',	'0911210221',	'11',			'Co',		'3',		'1',	'45'),
					('Do',		'Dung',		'Dung@gmail.com',	'0911210222',	'12',			'Co',		'2',		'0',	'41'),
					('Chu',		'An',		'An@gmail.com',		'0911210223',	'13',			'Co',		'4',		'1',	'29'),
					('Nguyen',	'Xuan',		'Xuan@gmail.com',	'0911210224',	'14',			'Co',		'5',		'1',	'39'),
					('Pham',	'Hai',		'Hai@gmail.com',	'0911210225',	'15',			'Co',		'4',		'0',	'40');

INSERT INTO departments(`name`,			`description`) 
VALUES 
						('Admin',		'Quan tri'),
						('HR',			'Nhan luc'),
						('IT',			'Cong nghe'),
						('Delivery',	'Giao hang');

INSERT INTO `roles` (`name`)
VALUES 
					('Giam doc'),
					('Truong phong'),
					('Pho phong'),
					('Nhan vien');

INSERT INTO salary_detail_type (`name`)
VALUES 
								('Luong cung'),
								('Phu cap'),
								('Thuong'),
								('Thue TNCN'),
								('BHXH');
								
INSERT INTO user_department(user_id, 	department_id) 
VALUES 
							('1',			'1'),
							('1',			'2'),
							('2',			'1'),
							('2',			'2'),
							('3',			'1'),
							('3',			'2'),
							('4',			'1'),
							('4',			'2'),
							('5',			'1'),
							('5',			'2');

INSERT INTO user_role (user_department,	role_id)
VALUES 
						('1',			'1'),
						('1',			'2'),
						('2',			'1'),
						('2',			'2'),
						('3',			'1'),
						('3',			'2');

INSERT INTO salary (user_role_id,	total_salary,	`month`,	`year`)
VALUES 
					('1',			'100000',		'05',		'2021'),
					('2',			'90000',		'05',		'2021'),
					('3',			'80000',		'05',		'2021'),
					('4', 			'70000',		'05',		'2021'),
					('5',			'60000',		'06',		'2021'),
					('6',			'50000',		'06',		'2021');

INSERT INTO salary_detail(amount,	salary_id,	salary_detail_type_id,	operation) 
VALUES 
						('50000',	'1',			'1',					'1'),
						('40000',	'1',			'2',					'1'),
						('30000',	'1',			'3',					'1'),
						('20000',	'1',			'4',					'2'),
						('10000',	'1',			'5',					'2');