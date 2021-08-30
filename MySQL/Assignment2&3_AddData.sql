USE assignment2;
INSERT INTO department	(department_name) 
VALUES 					(N'Sale'), 
						(N'Marketing'),
						(N'Nhân sự'),
						(N'Thị trường'),
						(N'Kinh doanh'),
						(N'Hành chính'),
						(N'Bảo vệ'),
						(N'Kỹ thuật'),
						(N'Tổng hợp'),
						(N'Tài chính'),
						(N'Kế toán'),
						(N'Kế hoạch'),
						(N'Nghiên cứu'),
						(N'Phát triển'),
						(N'Dịch vụ');

INSERT INTO `position`	(position_name)
VALUES 					('Dev'),
						('Test'),
						('Scrum Master'),
						('PM');

INSERT INTO `account`	(email,					username,	fullname,				department_id,	position_id,	create_date)
VALUES 					('test01@gmail.com',	'test01',	N'Đào Tiến Hà',			1,				2,				'2009-01-10'),
						('test02@gmail.com',	'test02',	N'Phạm Thị Lý',			1,				1,				'2010-02-11'),
						('test03@gmail.com',	'test03',	N'Ngô Thị Thu',			2,				4,				'2011-03-12'),
						('test04@gmail.com',	'test04',	N'Nguyễn Văn Công',		4,				3,				'2012-04-13'),
						('test05@gmail.com',	'test05',	N'Trần Tuấn Anh',		5,				1,				'2013-05-14'),
						('test06@gmail.com',	'test06',	N'Hoàng Kim Phương',	4,				2,				'2014-06-15'),
						('test07@gmail.com',	'test07',	N'Nguyễn Thị Diễn',		3,				4,				'2015-07-16'),
						('test08@gmail.com',	'test08',	N'Nguyễn Văn Biên',		1,				3,				'2016-08-17'),
						('test09@gmail.com',	'test09',	N'Lương Minh công',		6,				2,				'2017-09-18'),
						('test10@gmail.com',	'test10',	N'Tạ Đức Tâm',			1,				1,				'2018-10-19'),
						('test11@gmail.com',	'test11',	N'Nguyễn Văn Hùng',		2,				4,				'2019-11-20'),
						('test12@gmail.com',	'test12',	N'Đỗ Việt Dũng',		7,				2,				'2020-12-21'),
						('test13@gmail.com',	'test13',	N'Chu Thị An',			8,				1,				'2021-04-22'),
						('test14@gmail.com',	'test14',	N'Nguyễn Thị Xuân',		5,				3,				'2022-07-23'),
						('test15@gmail.com',	'test15',	N'Phạm Thị Hải',		1,				4,				'2023-07-24');

INSERT INTO `group`	(group_name, 	creator_id,	create_date)
VALUES 				(N'Nhóm 1',		1,			'2009-01-10'),
					(N'Nhóm 2',		2,			'2010-02-11'),
					(N'Nhóm 3',		1,			'2011-03-12'),
					(N'Nhóm 4',		4,			'2012-04-13'),
					(N'Nhóm 5',		8,			'2013-05-14'),
					(N'Nhóm 6',		5,			'2014-06-15'),
					(N'Nhóm 7',		4,			'2015-07-16'),
					(N'Nhóm 8',		6,			'2016-08-17'),
					(N'Nhóm 9',		2,			'2017-09-18'),
					(N'Nhóm 10',	9,			'2018-10-19'),
					(N'Nhóm 11',	7,			'2019-11-20'),
					(N'Nhóm 12',	5,			'2020-12-21'),
					(N'Nhóm 13',	5,			'2021-04-22'),
					(N'Nhóm 14',	1,			'2022-07-23'),
					(N'Nhóm 15',	3,			'2023-07-24');

INSERT INTO group_account
VALUES 	(1,		1,		'2009-01-10'),
		(2,		2,		'2010-02-11'),
		(1,		3,		'2011-03-12'),
		(4,		4,		'2012-04-13'),
		(5,		5,		'2013-05-14'),
		(4,		6,		'2014-06-15'),
		(8,		7,		'2015-07-16'),
		(4,		8,		'2016-08-17'),
		(6,		9,		'2017-09-18'),
		(10,	10,		'2018-10-19'),
		(1,		11,		'2019-11-20'),
		(2,		12,		'2020-12-21'),
		(1,		13,		'2021-04-22'),
		(11,	14,		'2022-07-23'),
		(15,	15,		'2023-07-24');

INSERT INTO type_question	(type_name)
VALUES 						('Essay'),
							('Multiple-Choices');

insert into category_question	(category_name)
values 							('Java'),
								('NET'),
								('SQL'),
								('Postman'),
								('Ruby'),
								('Git'),
								('Python'),
								('JavaScript'),
								('Angular'),
								('NoteJS'),
								('HTML'),
								('CSS'),
								('Vue'),
								('PHP'),
								('Chung');

INSERT INTO question 	(content,							category_id,	type_id,	creator_id,	create_date)
VALUES 					(N'Tháng 1 có bao nhiêu ngày?',		1,				1,			1,			'2009-01-10'),
						(N'Tháng 2 có bao nhiêu ngày?',		2,				2,			2,			'2010-02-11'),
						(N'Tháng 3 có bao nhiêu ngày?',		3,				1,			3,			'2011-03-12'),
						(N'Tháng 4 có bao nhiêu ngày?',		4,				1,			4,			'2012-04-13'),
						(N'Tháng 5 có bao nhiêu ngày?',		5,				2,			5,			'2013-05-14'),
						(N'Tháng 6 có bao nhiêu ngày?',		1,				1,			6,			'2014-06-15'),
						(N'Tháng 7 có bao nhiêu ngày?',		2,				2,			7,			'2015-07-16'),
						(N'Tháng 8 có bao nhiêu ngày?',		3,				1,			8,			'2016-08-17'),
						(N'Tháng 9 có bao nhiêu ngày?',		4,				1,			9,			'2017-09-18'),
						(N'Tháng 10 có bao nhiêu ngày?',	5,				2,			5,			'2018-10-19'),
						(N'Tháng 11 có bao nhiêu ngày?',	3,				2,			6,			'2019-11-20'),
						(N'Tháng 12 có bao nhiêu ngày?',	4,				1,			7,			'2020-12-21'),
						(N'Một ngày có bao nhiêu giờ?',		5,				1,			8,			'2021-04-22'),
						(N'Một giờ có bao nhiêu phút?',		6,				2,			14,			'2022-07-23'),
						(N'Một phút có bao nhiêu giây?',	7,				1,			15,			'2023-07-24');

INSERT INTO answer 	(content, 		question_id, 	is_correct)
VALUES 				(N'31',			1,				'TRUE'),
					(N'30',			2,				'FALSE'),
					(N'31',			3,				'TRUE'),
					(N'Câu hỏi',	10,				'FALSE'),
					(N'31',			11,				'TRUE'),
					(N'Câu hỏi',	12,				'TRUE'),
					(N'28',			13,				'FALSE'),
					(N'31',			8,				'TRUE'),
					(N'Câu hỏi',	9,				'TRUE'),
					(N'31',			10,				'TRUE'),
					(N'29',			11,				'FALSE'),
					(N'28',			12,				'FALSE'),
					(N'24',			13,				'TRUE'),
					(N'24',			14,				'FALSE'),
					(N'60',			15,				'TRUE');

INSERT INTO exam 	(exam_code,		title,				category_id,	duration,	creator_id,		create_date)
VALUES 				(N'T01_01',		N'Bài thi 01',		1,				60,			1,				'2009-01-10'),
					(N'T01_02',		N'Bài thi 02',		2,				60,			2,				'2010-02-11'),
					(N'T01_03',		N'Bài thi 03',		3,				90,			1,				'2011-03-12'),
					(N'T01_04',		N'Bài thi 04',		4,				15,			4,				'2012-04-13'),
					(N'T01_05',		N'Bài thi 05',		5,				20,			8,				'2013-05-14'),
					(N'T01_06',		N'Bài thi 06',		1,				30,			5,				'2014-06-15'),
					(N'T01_07',		N'Bài thi 07',		2,				60,			4,				'2015-07-16'),
					(N'T02_01',		N'Bài thi 08',		3,				20,			6,				'2016-08-17'),
					(N'T02_02',		N'Bài thi 09',		4,				15,			2,				'2017-09-18'),
					(N'T02_03',		N'Bài thi 10',		5,				90,			9,				'2018-10-19'),
					(N'T02_04',		N'Bài thi 11',		3,				120,		7,				'2019-11-20'),
					(N'T02_05',		N'Bài thi 12',		4,				120,		5,				'2020-12-21'),
					(N'T02_06',		N'Bài thi 13',		5,				60,			5,				'2021-04-22'),
					(N'T02_07',		N'Bài thi 14',		6,				10,			1,				'2022-07-23'),
					(N'T02_08',		N'Bài thi 15',		7,				15,			3,				'2023-07-24');

INSERT INTO exam_question
VALUES 	(1,		15),
		(2,		14),
		(3,		13),
		(4,		12),
		(5,		11),
		(6,		10),
		(7,		9),
		(8,		8),
		(9,		7),
		(10,	6),
		(11,	5),
		(12,	4),
		(13,	3),
		(14,	2),
		(15,	1);