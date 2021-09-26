DROP DATABASE IF EXISTS finalexam;

CREATE DATABASE IF NOT EXISTS finalexam;

USE finalexam;

-- CREATE TABLE:
-- CREATE TABLE student:
DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student (
    id 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` 		VARCHAR(50),
    age 		TINYINT UNSIGNED,
    gender 		ENUM('0', '1')
);


-- CREATE TABLE subject
DROP TABLE IF EXISTS `subject`;

CREATE TABLE IF NOT EXISTS `subject` (
    id 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` 		VARCHAR(50)
);


-- CREATE TABLE student_subject
DROP TABLE IF EXISTS student_subject;

CREATE TABLE IF NOT EXISTS student_subject (
    studentid 	TINYINT UNSIGNED,
    subjectid 	TINYINT UNSIGNED,
    mark 		TINYINT,
    `date` 		DATETIME DEFAULT NOW(),
    PRIMARY KEY (studentid , subjectid),
    FOREIGN KEY (studentid) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (subjectid) REFERENCES `subject`(id) ON DELETE CASCADE
);


-- Question 1:
-- Insert into student
INSERT INTO student (id, 	`name`, 			age, 	gender	) 
VALUES 				(1, 	'Bonita Keeton', 	30, 	'1'		),
					(2, 	'Dallas Keppy', 	33, 	'0'		),
					(3, 	'Geoff Bricket', 	26, 	'0'		),
					(4, 	'Mario Baldetti',	27, 	'0'		),
					(5, 	'Xylia Nance', 		28, 	'1'		);

-- Insert into subject
INSERT INTO `subject` 	(id, 	`name`		) 
VALUES 					(1, 	'Toan'		),
						(2, 	'Vat ly'	),
						(3, 	'Tieng Anh'	),
						(4, 	'Hoa hoc'	),
						(5, 	'Cong nghe'	);


-- Insert into student_subject
INSERT INTO student_subject (studentid, 	subjectid, 		mark, 	`date`		)
VALUES 						(1, 			4, 				5, 		'2020-02-27'),
							(2, 			3, 				4, 		'2020-05-27'),
							(3, 			4, 				7, 		'2020-12-10'),
							(4, 			4, 				5, 		'2020-11-13'),
							(5, 			3, 				9, 		'2020-05-14');
                            

-- Question 2:
-- a, Lấy tất cả các môn học không có bất kì điểm nào
SELECT 
    sj.`name`
FROM
    `subject` sj
        LEFT JOIN
    student_subject ss ON sj.id = ss.subjectid
WHERE
    ss.mark IS NULL;

-- b, Lấy danh sách các môn học có ít nhất 2 điểm
SELECT 
    sj.`name`
FROM
    `subject` sj
        LEFT JOIN
    student_subject ss ON sj.id = ss.subjectid
GROUP BY sj.`name`
HAVING
    COUNT(ss.mark) >= 2;
    
-- Question 3: Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm:
-- Student ID,Subject ID, Student Name, Student Age, Student Gender, Subject Name, Mark, Date
CREATE OR REPLACE VIEW v_student_info AS
    SELECT 
        s.id AS StudentID,
        sj.id AS SubjectID,
        s.`name` AS StudentName,
        s.age AS StudentAge,
        CASE s.Gender
            WHEN '0' THEN 'Male'
            WHEN '1' THEN 'Famale'
            WHEN NULL THEN 'Unknow'
        END AS StudentGender,
        sj.`name` AS SubjectName,
        ss.mark AS Mark,
        ss.`date` AS `Date`
    FROM
        student s
            LEFT JOIN
        student_subject ss ON s.id = ss.studentid
            LEFT JOIN
        `subject` sj ON ss.subjectid = sj.id;
        
-- Question 4:
--  a) Tạo trigger cho table Subject có tên là SubjectUpdateID:
-- Khi thay đổi data của cột ID của table Subject, thì giá trị tương
-- ứng với cột SubjectID của table StudentSubject cũng thay đổi theo

DROP TRIGGER IF EXISTS tr_subject_update_id;

DELIMITER //
CREATE TRIGGER tr_subject_update_id 
BEFORE UPDATE ON `subject`
FOR EACH ROW
BEGIN
	SET foreign_key_checks = 0;
    UPDATE student_subject
    SET subjectid = NEW.id
    WHERE subjectid = OLD.id;
    SET foreign_key_checks = 1;
END//

DELIMITER ;

UPDATE `subject`
SET id = '6'
WHERE id = '4';

-- b)Tạo trigger cho table StudentSubject có tên là StudentDeleteID:
-- Khi xóa data của cột ID của table Student, thì giá trị tương ứng với
-- cột StudentID của table StudentSubject cũng bị xóa theo

DROP TRIGGER IF EXISTS tr_student_delete_id;

DELIMITER //
CREATE TRIGGER tr_student_delete_id 
BEFORE DELETE ON student
FOR EACH ROW
BEGIN
	SET foreign_key_checks = 0;
    DELETE FROM student_subject
    WHERE studentid = OLD.id;
    SET foreign_key_checks = 1;
END//

DELIMITER ;

 DELETE FROM student
    WHERE id = 5;

-- Question 5: Viết 1 store procedure (có 2 parameters: student name) sẽ xóa tất cả các
-- thông tin liên quan tới học sinh có cùng tên như parameter
-- Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả các học sinh

DROP PROCEDURE IF EXISTS p_delete_student_by_name;

DELIMITER //
CREATE PROCEDURE p_delete_student_by_name(IN v_student1 VARCHAR(50), IN v_student2 VARCHAR(50))
BEGIN
	SET foreign_key_checks = 0;
    IF v_student1 = '*' OR v_student2 = '*'
    THEN
		DELETE FROM student;
	ELSE
		DELETE FROM student
		WHERE `name` IN (v_student1, v_student2);
	END IF;
    SET foreign_key_checks = 1;
END //
DELIMITER ;

CALL p_delete_student_by_name('*','*');


