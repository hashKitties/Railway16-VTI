USE testingsystem;
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS p_show_account;
DELIMITER //
CREATE PROCEDURE p_show_account(IN department_name NVARCHAR(50))
BEGIN 
	SELECT 
		Username, FullName
	FROM
		`account`
	WHERE
		DepartmentID IN (SELECT 
							DepartmentID
						FROM
							department
						WHERE
							DepartmentName = department_name);
END//
DELIMITER ;
CALL p_show_account('Bán hàng');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS p_show_account_in_group;
DELIMITER //
CREATE PROCEDURE p_show_account_in_group()
BEGIN 
	SELECT COUNT(AccountID) AS NumberOFAccount, GroupID
    FROM groupaccount
    GROUP BY GroupID;
END//
DELIMITER ;
CALL p_show_account_in_group();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS p_type_question_create_in_current_month;
DELIMITER //
CREATE PROCEDURE p_type_question_create_in_current_month()
BEGIN 
	SELECT 
		typequestion.TypeName,
		COUNT(question.QuestionID) AS NumberOfQuestion,
        question.CreateDate
	FROM
		question
        JOIN
		typequestion ON typequestion.TypeID = question.TypeID
	GROUP BY typequestion.TypeName
	HAVING MONTH(question.CreateDate) = MONTH(NOW());
END//
DELIMITER ;
CALL p_type_question_create_in_current_month();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS p_most_asked_type_question_id;
DELIMITER //
CREATE PROCEDURE p_most_asked_type_question_id(OUT v_resultid INT)
BEGIN 
	SELECT 
		TypeID
	INTO v_resultid FROM
		question
	GROUP BY TypeID
	HAVING COUNT(QuestionID) = (SELECT MAX(mycount)
								FROM
									(SELECT 
										COUNT(QuestionID) mycount
									FROM
										question
									GROUP BY TypeID) AS maxcount);
END//
DELIMITER ;

CALL p_most_asked_type_question_id(@v_resultid);

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question 
SELECT 
    TypeName
FROM
    typequestion
WHERE
    TypeID = @v_resultid;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS p_show_input_group_or_username;
DELIMITER //
CREATE PROCEDURE p_show_input_group_or_username(IN v_input NVARCHAR(50))
BEGIN 
	SELECT 
		GroupName AS Result
	FROM 
		`group`
	WHERE `group`.GroupName LIKE (CONCAT('%',v_input,'%'))
	UNION ALL
    SELECT 
		Username
     FROM 
		`account`
	WHERE Username LIKE (CONCAT('%',v_input,'%'));
END//
DELIMITER ;
CALL p_show_input_group_or_username('vti');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán: username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ

DROP PROCEDURE IF EXISTS p_create_user;
INSERT INTO department (DepartmentName)
VALUES ('Waiting Room');

DELIMITER //
CREATE PROCEDURE p_create_user(IN v_input_fullname NVARCHAR(50), v_input_email NVARCHAR(50))
BEGIN 
	INSERT INTO `account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
    VALUES (v_input_email, LEFT(v_input_email, LOCATE('@',v_input_email) - 1), v_input_fullname, 11, 1, NOW());
END//
DELIMITER ;

CALL p_create_user('Nguyen Phat','phat@gmail.com');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS p_find_max_question_content;

DELIMITER //
CREATE PROCEDURE p_find_max_question_content(IN v_type_question NVARCHAR(50))
BEGIN 
	SELECT 
		question.Content AS LongestContent
	FROM
		question
	JOIN
		typequestion ON typequestion.TypeID = question.TypeID
	WHERE typequestion.TypeName = v_type_question
	HAVING LENGTH(question.Content)  = MAX(LENGTH(question.Content));
    
END//
DELIMITER ;

CALL p_find_max_question_content('Essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID 
-- PROCEDURE
DROP PROCEDURE IF EXISTS p_delete_exam_id;
DELIMITER //
CREATE PROCEDURE p_delete_exam_id(IN v_exam_id SMALLINT)
BEGIN 
	DELETE FROM exam
    WHERE ExamID = v_exam_id;
END//
DELIMITER ;

CALL p_delete_exam_id(1);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa) 
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
CREATE TABLE IF NOT EXISTS deleted_exam LIKE exam;
set autocommit = 0;
Set foreign_key_checks = 0;
DROP PROCEDURE IF EXISTS p_delete_exam_id_over_3_year;
DELIMITER //
CREATE PROCEDURE p_delete_exam_id_over_3_year()
BEGIN
	DECLARE v_target_exam_id SMALLINT;
    delete_loop: REPEAT
		SELECT 
			ExamID
		INTO v_target_exam_id
		FROM
			exam
		WHERE
			YEAR(NOW()) - YEAR(CreateDate) >= 3
		LIMIT 1;
        IF v_target_exam_id IS NULL
			THEN LEAVE delete_loop;
		ELSE 
			INSERT INTO deleted_exam SELECT * FROM exam WHERE ExamID = v_target_exam_id;
            CALL p_delete_exam_id(v_target_exam_id);
        END IF;
	UNTIL v_target_exam_id IS NULL
    END REPEAT delete_loop;
    SELECT * FROM deleted_exam;
END//
DELIMITER ;

CALL p_delete_exam_id_over_3_year();

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS p_remove_department;
DELIMITER //
CREATE PROCEDURE p_remove_department(IN v_department_name NVARCHAR(50))
BEGIN 
	DECLARE v_department_id SMALLINT;
    SELECT 
		DepartmentID
    INTO v_department_id 
    FROM
		department
	WHERE 
		DepartmentName = v_department_name;
    UPDATE 
    	`account`
    SET 
		DepartmentID = 11
    WHERE 
    	`account`.DepartmentID = v_department_id;
    DELETE FROM 
		department
    WHERE DepartmentID = v_department_id;
END//
DELIMITER ;

CALL p_remove_department('Marketing');

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DROP PROCEDURE IF EXISTS p_count_question_created_in_month;
DELIMITER //
CREATE PROCEDURE p_count_question_created_in_month()
BEGIN 
	SELECT 
		COUNT(QuestionID) AS NumberOfQuestionCreatedInMonth
	FROM
		question
	WHERE
		MONTH(CreateDate) = MONTH(NOW())
	GROUP BY MONTH(CreateDate);
END//
DELIMITER ;

CALL p_count_question_created_in_month();

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
DROP PROCEDURE IF EXISTS p_count_question_created_in_6_month_range;
DELIMITER //
CREATE PROCEDURE p_count_question_created_in_6_month_range()
BEGIN 
	DECLARE v_counter SMALLINT;
    SELECT 
		COUNT(QuestionID) AS NumberOfQuestionCreated
	INTO v_counter
    FROM
		question
	WHERE
		DATEDIFF(NOW(),CreateDate) <= 180
	GROUP BY MONTH(CreateDate);
    IF v_counter IS NULL
    THEN 
		SELECT 'không có câu hỏi nào trong tháng';
    END IF;
END//
DELIMITER ;

CALL p_count_question_created_in_6_month_range();



