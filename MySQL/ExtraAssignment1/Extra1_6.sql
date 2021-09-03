DROP DATABASE IF EXISTS project_assignment;

CREATE DATABASE IF NOT EXISTS project_assignment;

USE project_assignment;

-- Create Table 
DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
    EmployeeID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeLastName 		VARCHAR(20),
    EmployeeFirstName 		VARCHAR(20),
    EmployeeHireDate 		DATE,
    EmployeeStatus 			ENUM('Work Done', 'In Process'),
    SupervisorID 			TINYINT UNSIGNED,
    SocialSecurityNumber 	CHAR(10)
);

DROP TABLE IF EXISTS projects;
CREATE TABLE IF NOT EXISTS projects (
    ProjectID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ManagerID 			TINYINT UNSIGNED,
    ProjectName 		VARCHAR(50),
    ProjectStartDate 	DATE,
    ProjectDiscription 	TEXT,
    ProjectDetail 		TEXT,
    ProjectCompletedOn 	DATE DEFAULT NULL,
    FOREIGN KEY (ManagerID) REFERENCES employee(EmployeeID) ON DELETE SET NULL
);

DROP TABLE IF EXISTS project_module;
CREATE TABLE IF NOT EXISTS project_module (
    ModuleID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProjectID 					TINYINT UNSIGNED,
    EmployeeID 					TINYINT UNSIGNED,
    ProjectModuleDate 			DATE,
    ProjectModuleCompletedOn 	DATE DEFAULT NULL,
    ProjectModuleDiscription 	TEXT,
    FOREIGN KEY (ProjectID) REFERENCES projects(ProjectID) ON DELETE NO ACTION,
    FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID) ON DELETE NO ACTION
);

DROP TABLE IF EXISTS work_done;
CREATE TABLE IF NOT EXISTS work_done (
    WorkDoneID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID 			TINYINT UNSIGNED,
    ModuleID 			TINYINT UNSIGNED,
    WorkDoneDate 		DATE DEFAULT NULL,
    WorkDoneDiscription TEXT,
    WorkDoneStatus 		BIT(1),
    FOREIGN KEY (ModuleID) REFERENCES project_module(ModuleID) ON DELETE NO ACTION,
    FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID) ON DELETE NO ACTION
);

-- Question a: ADD DATA
INSERT INTO employee (EmployeeLastName,	EmployeeFirstName,	EmployeeHireDate,	EmployeeStatus,		SupervisorID,	SocialSecurityNumber)
VALUES 				('Hai',				'Nguyen',			'2016-04-10',		'Work Done',		3,				'1837392849'),
					('Hoa',				'Do',				'2016-05-10',		'In Process',		1,				'7483293839'),
					('Thang',			'Van',				'2017-06-11',		'In Process',		3,				'8756746398'),
					('Lien',			'Chu',				'2018-07-12',		'Work Done',		2,				'3826485930'),
					('Linh',			'Nguyen',			'2019-08-14',		'Work Done',		3,				'2847058373');


INSERT INTO projects 	(ManagerID,	ProjectName,	ProjectStartDate,	ProjectDiscription,		ProjectDetail, 			ProjectCompletedOn)
VALUES 					(3,			'Java',			'2018-10-16',		'Database',				'More Database',		'2021-01-24'),
						(3,			'Java',			'2018-11-14',		'Web',					'Build Web',			'2021-02-24'),
						(1,			'Python',		'2018-12-18',		'Automated',			'Build Automated',		'2020-12-30');


INSERT INTO project_module 	(ProjectID,	EmployeeID,	ProjectModuleDate,		ProjectModuleCompletedOn,	ProjectModuleDiscription)
VALUES 						(1,			1,			'2020-01-24',			NULL,						'Build 1'),
							(1,			3,			'2020-02-24',			'2020-02-12',				'Build 2'),
							(2,			2,			'2020-12-30',			'2020-12-25',				'Build 3'),
							(1,			1,			'2020-04-22',			'2020-05-10',				'Build 4'),
							(3,			4,			'2019-05-10',			'2019-05-10',				'Build 5');

INSERT INTO work_done 	(EmployeeID,	ModuleID,	WorkDoneDate,	WorkDoneDiscription,	WorkDoneStatus)
VALUES 					(3,				3,			NULL,			'Work 1',				0),
						(1,				2,			'2020-02-12',	'Work 2',				1),
						(2,				3,			'2020-12-13',	'Work 3',				1),
						(4,				5,			NULL,			'Work 4',				0),
						(1,				3,			NULL,			'Work 5',				0),
						(5,				1,			'2019-11-16',	'Work 6',				1);

-- Question b:
DROP PROCEDURE IF EXISTS p_remove_old_project;

DELIMITER //
CREATE PROCEDURE p_remove_old_project()
BEGIN
	DELETE FROM projects
    WHERE DATEDIFF(NOW(),ProjectCompletedOn) >= 90;
END//
DELIMITER ;

CALL p_remove_old_project();

-- Question c:
DROP PROCEDURE IF EXISTS p_module_id_completed;

DELIMITER //
CREATE PROCEDURE p_module_id_completed(IN v_module_completed_date DATE)
BEGIN
	IF v_module_completed_date IS NULL
    THEN
		SELECT 
			ModuleID
		FROM 
			project_module
		WHERE ProjectModuleCompletedOn IS NULL;
    ELSE
		SELECT 
			ModuleID
		FROM 
			project_module
		WHERE ProjectModuleCompletedOn = v_module_completed_date;
	END IF;
END//
DELIMITER ;

CALL p_module_id_completed(NULL);

-- Question d: (unsolved)
DROP FUNCTION IF EXISTS f_auto_work_employee;

DELIMITER //
CREATE FUNCTION f_auto_work_employee(v_module_id SMALLINT) 
RETURNS SMALLINT
BEGIN
	DECLARE v_unassigned_id SMALLINT;
    SELECT 
		w.EmployeeID AS UnassignedID
	INTO v_unassigned_id
    FROM
		project_module p
	JOIN
		work_done w ON w.ModuleID = p.ModuleID && p.EmployeeID <> w.EmployeeID
	WHERE w.ModuleID = v_module_id;
    RETURN v_unassigned_id;
END//
DELIMITER ;

SELECT f_auto_work_employee(1);

