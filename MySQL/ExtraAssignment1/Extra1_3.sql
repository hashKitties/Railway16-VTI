USE extra_assignment1;
-- Insert Data
INSERT INTO trainee (FullName,				BirthDate,		Gender,		ET_IQ,	ET_Gmath,	ET_English,	TrainingClass)
VALUES 				('Nguyen Hai Dang',		'1990-01-14',	'Male',		18,		20,			50,			1),
					('Tong Quang Anh',		'1991-02-15',	'Female',	20,		17,			50,			2),
					('Nguyen Van Chien',	'1992-03-16',	'Male',		16,		19,			35,			3),
					('Duong Do',			'1993-04-17',	'Male',		13,		12,			28,			3),
					('Nguyen Chien Thang',	'1994-05-18',	'Male',		10,		11,			39,			2),
					('Ngo Ba Kha',			'1992-06-19',	'Female',	11,		11,			41,			3),
					('Nguyen Thanh Tung',	'1993-07-20',	'Male',		18,		15,			46,			1),
					('Duong Van Huu',		'2000-08-21',	'Female',	19,		18,			40,			1),
					('Tran Tuan Anh',		'1998-09-22',	'Male',		17,		19,			22,			2),
					('Ngo Thi Thu',			'1995-10-23',	'Female',	14,		20,			32,			1);

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT 
    MONTH(BirthDate) AS MonthGroup,
    COUNT(FullName) AS NumberOfPassed
FROM
    trainee
GROUP BY MONTH(BirthDate);

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT 
    *
FROM
    trainee
GROUP BY TraineeID
ORDER BY LENGTH(FullName) DESC
LIMIT 1;

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18
SELECT 
    *
FROM
    trainee
WHERE
	(ET_IQ + ET_Gmath) >= 20
		&& ET_IQ >= 8 & ET_Gmath >= 8
        && ET_English >= 18
GROUP BY TraineeID;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM trainee
WHERE TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE trainee
SET TrainingClass = 2
WHERE TraineeID = 5;
