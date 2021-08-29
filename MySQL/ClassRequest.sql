DROP DATABASE IF EXISTS classrequest;
CREATE DATABASE IF NOT EXISTS classrequest;
USE classrequest;
CREATE TABLE IF NOT EXISTS department (
    department_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    department_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS positions (
    position_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    position_name VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS accounts (
    account_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email VARCHAR(50),
    username VARCHAR(20),
    fullname VARCHAR(50),
    department_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    create_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);
