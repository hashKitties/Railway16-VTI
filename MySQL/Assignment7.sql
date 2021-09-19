USE testingsystem;
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS tr_check_input;
DELIMITER //
CREATE TRIGGER tr_check_input 
BEFORE INSERT ON `group`
FOR EACH ROW
	BEGIN
		IF DATEDIFF(NOW(),NEW.CreateDate) > 365
        THEN
			SIGNAL SQLSTATE '45000';
		END IF;
	END//
DELIMITER ;

INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System 1'		,   5			,'2019-03-05');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"
DROP TRIGGER IF EXISTS tr_stop_sale_input;
DELIMITER //
CREATE TRIGGER tr_stop_sale_input 
BEFORE INSERT ON `account`
FOR EACH ROW
	BEGIN
		IF NEW.DepartmentID = 10
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Department \"Sale\" cannot add more user";
		END IF;
	END//
DELIMITER ;

INSERT INTO `account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haida29productions@gmail.com'		,'dangack'			,'Nguyen Dang'			,   10			,   '1'		,'2020-03-05');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS tr_max_group_user;
DELIMITER //
CREATE TRIGGER tr_max_group_user 
BEFORE INSERT ON groupaccount
FOR EACH ROW
	BEGIN
		DECLARE v_input_group_id SMALLINT;
        SELECT 
			COUNT(GroupID)
        INTO v_input_group_id
        FROM 
			groupaccount
        GROUP BY 
			GroupID
        HAVING 
			GroupID = NEW.GroupID; 
        IF v_input_group_id >= 5
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Cannot add more User on selected group";
		END IF;
	END//
DELIMITER ;
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	2		,    1		,'2019-03-05');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS tr_max_question_exam;
DELIMITER //
CREATE TRIGGER tr_max_question_exam 
BEFORE INSERT ON examquestion
FOR EACH ROW
	BEGIN
		DECLARE v_input_question_id SMALLINT;
        SELECT 
			COUNT(QuestionID)
        INTO v_input_question_id
        FROM 
			examquestion
        GROUP BY 
			ExamID
        HAVING 
			ExamID = NEW.ExamID; 
        IF v_input_question_id >= 10
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Cannot add more question on selected exam";
		END IF;
	END//
DELIMITER ;

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
DROP TRIGGER IF EXISTS tr_admin_protect;
DELIMITER //
CREATE TRIGGER tr_admin_protect 
BEFORE DELETE ON `account`
FOR EACH ROW
	BEGIN
		IF OLD.Email = 'admin@gmail.com'
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delete admin account';
		END IF;
	END//
DELIMITER ;

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS tr_auto_default_department;
DELIMITER //
CREATE TRIGGER tr_auto_default_department 
BEFORE INSERT ON `account`
FOR EACH ROW
	BEGIN
		IF NEW.DepartmentID IS NULL
        THEN
			SET NEW.DepartmentID = 11;
		END IF;
	END//
DELIMITER ;

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS tr_max_answer_per_exam_per_question
DELIMITER //
CREATE TRIGGER tr_max_answer_per_exam_per_question 
BEFORE INSERT ON answer
FOR EACH ROW
	BEGIN
		DECLARE v_number_of_answers SMALLINT;
        DECLARE v_number_of_isCorrect SMALLINT;
        SELECT 
			COUNT(Answers)
		INTO v_number_of_answers
        FROM 
			answer
		WHERE QuestionID = NEW.QuestionID
		GROUP BY 
			QuestionID;
        
        SELECT 
			COUNT(isCorrect)
		INTO v_number_of_isCorrect
        FROM 
			answer
		WHERE QuestionID = NEW.QuestionID && isCorrect = 1
		GROUP BY 
			isCorrect;
            
        IF v_number_of_answers >= 4 && v_number_of_isCorrect  >= 2 && NEW.isCorrect = 1
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Cannot add more answer";
		END IF;
	END//
DELIMITER ;

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng: (table not created)
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database

DROP TRIGGER IF EXISTS tr_correct_gender
DELIMITER //
CREATE TRIGGER tr_correct_gender 
BEFORE INSERT ON `account`
FOR EACH ROW
	BEGIN
		CASE NEW.Gender
			WHEN 'Nam' THEN SET NEW.Gender = 'M';
            WHEN 'Nữ' THEN SET NEW.Gender = 'F';
            ELSE SET NEW.Gender = 'U';
		END CASE;
	END//
DELIMITER ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS tr_exam_protect;
DELIMITER //
CREATE TRIGGER tr_exam_protect 
BEFORE DELETE ON exam
FOR EACH ROW
	BEGIN
		IF DATEDIFF(NOW(), OLD.CreateDate) <= 2
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delete exam created 2 days ago or less';
		END IF;
	END//
DELIMITER ;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS tr_question_delete_protect;
DROP TRIGGER IF EXISTS tr_question_update_protect;
DELIMITER //
CREATE TRIGGER tr_question_delete_protect 
BEFORE DELETE ON question
FOR EACH ROW
	BEGIN
		DECLARE v_flag SMALLINT;
        SELECT 
			ExamID
        INTO v_flag
        FROM 
			QuestionID
		WHERE QuestionID = OLD.QuestionID;
        IF v_flag IS NOT NULL 
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delate question not in any exam';
		END IF;
	END//

CREATE TRIGGER tr_question_update_protect 
BEFORE UPDATE ON question
FOR EACH ROW
	BEGIN
		DECLARE v_flag SMALLINT;
        SELECT 
			ExamID
        INTO v_flag
        FROM 
			QuestionID
		WHERE NEW.QuestionID = NEW.QuestionID;
        IF v_flag IS NULL 
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot update question not in any exam';
		END IF;
	END//

DELIMITER ;

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
DROP TABLE IF EXISTS exam_clone;
CREATE TABLE exam_clone (
	ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				VARCHAR(50),
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE NO ACTION,
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId) ON DELETE NO ACTION
);
INSERT INTO exam_clone
SELECT *
FROM exam;

UPDATE exam_clone 
SET 
    Duration = 'Short time'
WHERE
    CONVERT(Duration, DECIMAL) <= 30;

UPDATE exam_clone 
SET 
    Duration = 'Medium time'
WHERE
    CONVERT( Duration , DECIMAL) <= 60
        && CONVERT( Duration , DECIMAL) > 30;

UPDATE exam_clone 
SET 
    Duration = 'Long time'
WHERE
    CONVERT(Duration, DECIMAL) > 60;
-- Unsolved, convert value fail - Error code 1366
TRUNCATE exam_clone;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
DROP TABLE IF EXISTS user_amount;
CREATE TABLE IF NOT EXISTS user_amount(
	GroupID					SMALLINT PRIMARY KEY,
    NumberOfAccount			SMALLINT,
    the_number_user_amount 	VARCHAR(50)
);
INSERT INTO user_amount
SELECT 
    GroupID, COUNT(AccountID), COUNT(AccountID)
FROM
    groupaccount
GROUP BY GroupID;

UPDATE user_amount 
SET 
    the_number_user_amount = 'Few'
WHERE
    CONVERT(the_number_user_amount, DECIMAL) <= 5;

UPDATE user_amount 
SET 
    the_number_user_amount = 'Normal'
WHERE
    CONVERT(the_number_user_amount, DECIMAL) <= 20 && CONVERT(the_number_user_amount, DECIMAL) > 5;

UPDATE user_amount 
SET 
    the_number_user_amount = 'High'
WHERE
    CONVERT(the_number_user_amount, DECIMAL) > 20;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User (unsolved update Table)
DROP TABLE IF EXISTS user_amount_in_department;
CREATE TABLE IF NOT EXISTS user_amount_in_department(
	DepartmentID			SMALLINT PRIMARY KEY,
    NumberOfAccount			SMALLINT
);
TRUNCATE user_amount_in_department;

INSERT INTO user_amount_in_department
SELECT 
    `account`.DepartmentID, COUNT(`account`.AccountID)
FROM
    `account`
RIGHT JOIN
	department ON `account`.DepartmentID = department.DepartmentID
GROUP BY DepartmentID;
