DROP DATABASE IF EXISTS assignment1;
CREATE DATABASE IF NOT EXISTS assignment1;
USE assignment1;
CREATE TABLE IF NOT EXISTS department (
    department_id   INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    department_name NVARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS `position` (
    position_id     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    position_name   ENUM('DEV','TEST','SCRUM MASTER','PM') NOT NULL
);
CREATE TABLE IF NOT EXISTS `account` (
    account_id      INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email           VARCHAR(50) unique KEY NOT NULL,
    username        VARCHAR(20) unique KEY Not NULL,
    fullname        VARCHAR(50) unique KEY Not NULL,
    department_id   INT UNSIGNED NOT NULL,
    position_id     INT UNSIGNED NOT NULL,
    create_date     DATE
);
CREATE TABLE IF NOT EXISTS `group` (
    group_id    INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    group_name  VARCHAR(50),
    creator_id  INT UNSIGNED NOT NULL,
    create_date DATE
);
CREATE TABLE IF NOT EXISTS group_account (
    group_id    INT UNSIGNED NOT NULL,
    account_id  INT UNSIGNED NOT NULL,
    join_date   DATE,
    PRIMARY KEY (group_id, account_id)
);
CREATE TABLE IF NOT EXISTS type_question (
    type_id     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type_name   ENUM('ESSAY','MULTIPLE-CHOICE') NOT NULL
);
CREATE TABLE IF NOT EXISTS category_question (
    category_id     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_name   VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS question (
    question_id     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    content         VARCHAR(200) NOT NULL,
    category_id     INT UNSIGNED NOT NULL,
    type_id         INT UNSIGNED,
    creator_id      INT UNSIGNED,
    create_date     DATE 
);
CREATE TABLE IF NOT EXISTS answer (
    answer_id       INT PRIMARY KEY AUTO_INCREMENT,
    content         VARCHAR(100),
    question_id     INT UNSIGNED NOT NULL,
    is_correct      ENUM('TRUE','FALSE')
);
CREATE TABLE IF NOT EXISTS exam (
    exam_id         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    exam_code       INT UNSIGNED NOT NULL,
    exam_title      VARCHAR(50),
    category_id     INT UNSIGNED NOT NULL,
    duration        TIME,
    creator_id      INT UNSIGNED NOT NULL,
    create_date     DATE
);
CREATE TABLE exam_question (
    exam_id         INT UNSIGNED NOT NULL,
    question_id     INT UNSIGNED NOT NULL
);