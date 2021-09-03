USE testingsystem;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW v_account AS
    SELECT 
        FullName, DepartmentID
    FROM
        `account`
    WHERE
        DepartmentID = 10;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW v_group_max_account_number AS
    SELECT 
        COUNT(AccountID) AS NumberOfAccount, GroupID
    FROM
        groupaccount
    GROUP BY GroupID
    ORDER BY NumberOfAccount DESC
    LIMIT 1;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW v_question_content_length AS
    SELECT 
        LENGTH(Content) AS Content_length, QuestionID
    FROM
        question
    GROUP BY QuestionID
    HAVING Content_length > 300;
    
DELETE FROM question
WHERE LENGTH(Content) > 300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW v_most_account_department AS
    SELECT 
        COUNT(AccountID) AS NumberOfAccount, DepartmentID
    FROM
        `account`
    GROUP BY DepartmentID
    ORDER BY NumberOfAccount DESC
    LIMIT 1;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW v_nguyen_creator AS
    SELECT 
        question.QuestionID, `account`.FullName AS CreatorName
    FROM
        question
            JOIN
        `account` ON question.CreatorID = `account`.AccountID
    WHERE
        `account`.FullName LIKE ('Nguyễn%');
