USE testingsystem;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW v_account AS
    SELECT 
		a.*, d.DepartmentName
    FROM
        `account` a
	JOIN department d
    USING (DepartmentID)
    WHERE
        DepartmentName = 'Bán hàng';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW v_group_max_account_number AS
    SELECT 
        a.*, COUNT(g.AccountID) AS NumberOfGroup
    FROM
        `account` a
            JOIN
        groupaccount g USING (AccountID)
    GROUP BY AccountID
    HAVING NumberOfGroup = (SELECT 
            MAX(mycount)
        FROM
            (SELECT 
                COUNT(AccountID) mycount
            FROM
                groupaccount
            GROUP BY AccountID) AS maxcount);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW v_question_content_length AS
    SELECT 
        *, LENGTH(Content) AS Content_length
    FROM
        question
    GROUP BY QuestionID
    HAVING Content_length > 300;

-- Xoa cau hoi co content > 300
DELETE FROM question
WHERE LENGTH(Content) > 300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW v_most_account_department AS
    SELECT 
        COUNT(a.DepartmentID) AS NumberOfAccount, d.DepartmentName
    FROM
        `account` a
            JOIN
        department d USING (DepartmentID)
    GROUP BY DepartmentID
    HAVING NumberOfAccount = (SELECT 
            MAX(mycount)
        FROM
            (SELECT 
                COUNT(DepartmentID) mycount
            FROM
                `account`
            GROUP BY DepartmentID) AS maxcount);

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW v_nguyen_creator AS
    SELECT 
        question.*, `account`.FullName AS CreatorName
    FROM
        question
            JOIN
        `account` ON question.CreatorID = `account`.AccountID
    WHERE
        `account`.FullName LIKE ('Nguyễn%');
