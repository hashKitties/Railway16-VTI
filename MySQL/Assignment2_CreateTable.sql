DROP DATABASE IF EXISTS assignment2;
CREATE DATABASE IF NOT EXISTS assignment2;
USE assignment2;
CREATE TABLE department (
    PRIMARY KEY (department_id),
    department_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    department_name VARCHAR(50)
);
CREATE TABLE `position` (
    PRIMARY KEY (position_id),
    position_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    position_name VARCHAR(50)
);

CREATE TABLE `account` (
    PRIMARY KEY (account_id),
    account_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    email VARCHAR(50),
    username VARCHAR(50),
    fullname NVARCHAR(50),
    department_id SMALLINT UNSIGNED NOT NULL,
    position_id SMALLINT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES department (department_id),
    FOREIGN KEY (position_id)
        REFERENCES `position` (position_id)
);

CREATE TABLE `group` (
    PRIMARY KEY (group_id),
    group_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    group_name NVARCHAR(50),
    creator_id SMALLINT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
);

CREATE TABLE group_account (
    PRIMARY KEY (group_id , account_id),
    group_id SMALLINT UNSIGNED NOT NULL,
    account_id SMALLINT UNSIGNED NOT NULL,
    join_date DATE
);

CREATE TABLE type_question (
    PRIMARY KEY (type_id),
    type_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    type_name VARCHAR(50)
);

CREATE TABLE category_question (
    PRIMARY KEY (category_id),
    category_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(50)
);

CREATE TABLE question (
    PRIMARY KEY (question_id),
    question_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    content TEXT,
    category_id SMALLINT UNSIGNED NOT NULL,
    type_id SMALLINT UNSIGNED NOT NULL,
    creator_id SMALLINT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY (category_id)
        REFERENCES category_question (category_id),
    FOREIGN KEY (type_id)
        REFERENCES type_question (type_id),
    FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
);

CREATE TABLE answer (
    PRIMARY KEY (answer_id),
    answer_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    content TEXT,
    question_id SMALLINT UNSIGNED NOT NULL,
    is_correct ENUM('TRUE', 'FALSE'),
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
);

CREATE TABLE exam (
    PRIMARY KEY (exam_id),
    exam_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    exam_code NVARCHAR(50),
    title NVARCHAR(50),
    category_id SMALLINT UNSIGNED NOT NULL,
    duration SMALLINT UNSIGNED NOT NULL,
    creator_id SMALLINT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY (category_id)
        REFERENCES category_question (category_id),
    FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
);

CREATE TABLE exam_question (
    PRIMARY KEY (exam_id , question_id),
    exam_id SMALLINT UNSIGNED NOT NULL,
    question_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id),
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
);