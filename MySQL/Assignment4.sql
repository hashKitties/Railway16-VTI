USE testingsystem;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
    `account`.FullName,
    department.DepartmentName
FROM
    `account`
LEFT JOIN
    department ON `account`.DepartmentID = department.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT 
    *
FROM
    `account`
WHERE
    CreateDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT 
    *
FROM
    `account`
WHERE
    PositionID = 1;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên
SELECT 
    COUNT(`account`.AccountID) AS NumberOfAccount,
    `account`.DepartmentID,
    department.DepartmentName
FROM
    `account`
        JOIN
    department ON `account`.DepartmentID = department.DepartmentID
GROUP BY DepartmentID
HAVING NumberOfAccount >= 2;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT 
    COUNT(ExamID) AS NumberOfUsed, QuestionID
FROM
    examquestion
GROUP BY QuestionID
HAVING
    COUNT(ExamID) = (
		SELECT MAX(MyCount)
		FROM
			(SELECT 
				COUNT(ExamID) MyCount, QuestionID
			FROM
				examquestion
			GROUP BY QuestionID) AS maxcount);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT 
    COUNT(CategoryID) NumberOfUsed, CategoryID 
FROM
    question
GROUP BY CategoryID
ORDER BY NumberOfUsed;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 
    COUNT(ExamID) AS NumberOfUsed, QuestionID
FROM
    examquestion
GROUP BY QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT 
    QuestionID, COUNT(Answers) AS NumberOfAnswers
FROM
    answer
GROUP BY QuestionID
ORDER BY NumberOfAnswers DESC
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 
    COUNT(AccountID) AS NumberOfAccount, GroupID
FROM
    groupaccount
GROUP BY GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT 
    COUNT(PositionID) AS NumberOfAccount, PositionID
FROM
    `account`
GROUP BY PositionID
ORDER BY COUNT(PositionID)
LIMIT 2;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
    COUNT(PositionID), PositionID, DepartmentID
FROM
    `account`
GROUP BY DepartmentID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT 
    question.*, answer.Content AS Answer, answer.QuestionID, `account`.FullName AS CreatorName
FROM
    question
        LEFT JOIN
    answer ON question.QuestionID = answer.QuestionID
        LEFT JOIN
    `account` ON `account`.AccountID = question.QuestionID;
	

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 
    COUNT(TypeID) AS NumberOfQuestion, TypeID
FROM
    question
GROUP BY TypeID;

-- Question 14:Lấy ra group không có account nào 
SELECT 
    *
FROM
    groupaccount
WHERE
    AccountID IS NULL;

-- Question 15: Lấy ra group không có account nào
SELECT 
    *
FROM
    groupaccount
WHERE
    AccountID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT 
    question.*, answer.Content AS Answer, answer.QuestionID
FROM
    question
        LEFT JOIN
    answer ON question.QuestionID = answer.QuestionID
WHERE
    answer.Content IS NULL;

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 
    *
FROM
    groupaccount
WHERE
    GroupID = 1;
 
-- b) Lấy các account thuộc nhóm thứ 2
SELECT 
    *
FROM
    groupaccount
WHERE
    GroupID = 2;
    
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 
    *
FROM
    groupaccount
WHERE
    GroupID = 1 
UNION ALL
SELECT 
    *
FROM
    groupaccount
WHERE
    GroupID = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT 
    COUNT(AccountID) AS NumberOFAccount, GroupID
FROM
    groupaccount
GROUP BY GroupID
HAVING NumberOFAccount > 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT 
    COUNT(AccountID) AS NumberOFAccount, GroupID
FROM
    groupaccount
GROUP BY GroupID
HAVING NumberOFAccount <7;
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT 
    COUNT(AccountID) AS NumberOFAccount, GroupID
FROM
    groupaccount
GROUP BY GroupID
HAVING NumberOFAccount > 5
UNION ALL
SELECT 
    COUNT(AccountID) AS NumberOFAccount, GroupID
FROM
    groupaccount
GROUP BY GroupID
HAVING NumberOFAccount <7;