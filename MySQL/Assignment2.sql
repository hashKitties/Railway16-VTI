DROP DATABASE IF EXISTS assignment2;
CREATE DATABASE IF NOT EXISTS assignment2;
USE assignment2;
CREATE TABLE IF NOT EXISTS department (
    department_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    department_name 	NVARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS `position` (
    position_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    position_name 	ENUM('DEV', 'TEST', 'SCRUM MASTER', 'PM') NOT NULL
);
CREATE TABLE IF NOT EXISTS `account` (
    account_id 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email 		VARCHAR(50) UNIQUE KEY NOT NULL,
    username 		VARCHAR(20) UNIQUE KEY NOT NULL,
    fullname 		VARCHAR(50) UNIQUE KEY NOT NULL,
    department_id 	INT UNSIGNED NOT NULL,
    position_id 	INT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id)
        REFERENCES department (department_id),
    FOREIGN KEY (position_id)
        REFERENCES `position` (position_id)
);
CREATE TABLE IF NOT EXISTS `group` (
    group_id 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    group_name 		VARCHAR(50),
    creator_id 		INT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS group_account (
    group_id 		INT UNSIGNED NOT NULL,
    account_id 		INT UNSIGNED NOT NULL,
    join_date 		DATETIME DEFAULT NOW(),
    FOREIGN KEY (group_id) 
		REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) 
		REFERENCES `account`(account_id)
);
CREATE TABLE IF NOT EXISTS type_question (
    type_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type_name 	ENUM('ESSAY', 'MULTIPLE-CHOICE') NOT NULL
);
CREATE TABLE IF NOT EXISTS category_question (
    category_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_name 	VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS question (
    question_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    content 		NVARCHAR(200) NOT NULL,
    category_id 	INT UNSIGNED NOT NULL,
    type_id 		INT UNSIGNED,
    creator_id 		INT UNSIGNED,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) 
		REFERENCES category_question(category_id)
);
CREATE TABLE IF NOT EXISTS answer (
    answer_id 	INT PRIMARY KEY AUTO_INCREMENT,
    content 	NVARCHAR(100),
    question_id INT UNSIGNED NOT NULL,
    is_correct 	ENUM('TRUE','FALSE'),
    FOREIGN KEY (question_id) 
		REFERENCES question(question_id)
);
CREATE TABLE IF NOT EXISTS exam (
    exam_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    exam_code 	INT UNSIGNED NOT NULL,
    exam_title 	NVARCHAR(50),
    category_id INT UNSIGNED NOT NULL,
    duration 	TIME,
    creator_id 	INT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) 
		REFERENCES category_question(category_id)
);
CREATE TABLE exam_question (
    exam_id 	INT UNSIGNED NOT NULL,
    question_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (exam_id) 
		REFERENCES exam(exam_id),
    FOREIGN KEY (question_id)
		REFERENCES question(question_id)
);
