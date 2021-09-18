DROP DATABASE IF EXISTS	extra_assignment1;

CREATE DATABASE IF NOT EXISTS extra_assignment1;

USE extra_assignment1;

-- Excercise 1:
DROP TABLE IF EXISTS trainee;

CREATE TABLE IF NOT EXISTS trainee (
    TraineeID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(50),
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Unknown'),
    ET_IQ TINYINT UNSIGNED CHECK (0 <= ET_IQ <= 20),
    ET_Gmath TINYINT UNSIGNED CHECK (0 <= ET_Gmath <= 20),
    ET_English TINYINT UNSIGNED CHECK (0 <= ET_English <= 50),
    TrainingClass SMALLINT UNSIGNED,
    EvaluationNote TEXT
);

ALTER TABLE trainee
ADD COLUMN VTIAccount VARCHAR(50) UNIQUE NOT NULL;

-- Excercise 2:
DROP TABLE IF EXISTS datatable2;

CREATE TABLE IF NOT EXISTS datatable2 (
    ID				MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name`			CHAR(50),
    `Code`			CHAR(5),
    ModifiedDate	DATETIME DEFAULT NOW()
);

-- Excercise 3:
DROP TABLE IF EXISTS datatable3;

CREATE TABLE IF NOT EXISTS datatable3 (
    ID				MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name`			CHAR(50),
    BirthDate		DATE,
    Gender			ENUM('0','1'),
    isDeletedFlag	ENUM('0','1')
);







