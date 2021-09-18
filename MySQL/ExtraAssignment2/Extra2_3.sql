USE extra_assignment2;

DROP TABLE IF EXISTS nobel;

CREATE TABLE IF NOT EXISTS nobel (
	`Year`		SMALLINT UNSIGNED NOT NULL,
    `Subject`	CHAR(20),
    Winner		CHAR(50)
);

INSERT INTO nobel VALUES
('1960', 	'Chemistry', 	'Willard F.Libby'),
('1960', 	'Literature', 	'Saint-John Perse'),
('1960', 	'Medicine', 	'Sir Frank Macfarlane Burnet'),
('1960', 	'Medicine', 	'Peter Madawar');

-- Hiển thị thông tin(tất cả các trường) của giải Nobel năm 1950
SELECT 
    *
FROM
    nobel
WHERE
    `year` = 1950;

-- Hiển thị tên người nhận giải(winner) Nobel năm 1962 ở lĩnh vực Văn học
SELECT 
    Winner
FROM
    nobel
WHERE
    `Year` = 1962 AND `subject` = 'Literature';

-- Hiển thị năm và chủ đề mà nhà bác học Albert Einstein nhận giải Nobel
SELECT 
    `Year`, `Subject`
FROM
    nobel
WHERE
    Winner = 'Albert Einstein';

-- Hiển thị tên người nhận giải Nobel kể từ năm 2000(bao gồm cả năm 2000) thuộc chủ đề Hòa bình(Peace)
SELECT 
    Winner
FROM
    nobel
WHERE
    `Year` >= 2000 AND `Subject` = 'Peace';

-- Hiển thị đầy đủ các thông tin của những người dành giải Nobel trong những năm 80(1980 đến 1989)
SELECT 
    Winner
FROM
    nobel
WHERE
    1980 <= `Year` <= 1989
    ;
-- Hiển thị thông tin nhận giải Nobel của các vị lãnh đạo có tên sau:
-- Theodore Roosevelt
-- Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT 
    *
FROM
    nobel
WHERE
    Winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama');

-- Hiển thị các tên người nhận giải có Firstname là John
SELECT 
    Winner
FROM
    nobel
WHERE
    Winner LIKE ('John%');

-- Hiển thị year, subject, và name của người nhận giải Nobel vật lý năm 1980 và người nhận giải Nobel hóa học năm 1984
SELECT 
    *
FROM
    nobel
WHERE
    (`Subject` = 'Physic' AND `Year` = 1980)
    OR (`Subject` = 'Chemistry' AND `Year` = 1984);

-- Hiển thị year, subject, và name của những người nhận giải năm 1980, ngoại trừ chủ đề Hóa học và Dược phẩm(Chemistry and Medicine)
SELECT 
    *
FROM
    nobel
WHERE
    `Subject` NOT LIKE ('Chemistry','Medicine') AND `Year` = 1980;

--  Hiển thị year, subject, và name của những người nhận giải Nobel Dược phẩm(Medicine) trước 1910(ko bao gồm 1910) và những người nhận giải Nobel văn học(Literature) sau năm 2004(bao gồm 2004)
SELECT 
    *
FROM
    nobel
WHERE
    (`Subject` = 'Medicine' AND `Year` < 1910)
    OR (`Subject` = 'Literature' AND `Year` >= 2004);
    
-- Nâng cao
-- Tìm thông tin tất cả các giải Nobel của PETER GRÜNBERG
SELECT 
    `Subject`
FROM
    nobel
WHERE
    Winner = 'PETER GRÜNBERG';

-- Tìm thông tin tất cả các giải Nobel của EUGENE O’NEILL
SELECT 
    `Subject`
FROM
    nobel
WHERE
    Winner = 'EUGENE O’NEILL';

-- Hiển thị thông tin winners, year và subject của những người có tên bắt đầu bằng Sir. Hiển thị gần đây nhất đầu tiên, sau đó theo thứ tự tên
SELECT 
    *
FROM
    nobel
WHERE
    Winner LIKE 'Sir%'
ORDER BY `Year` DESC, Winner;

-- Hiển thị thông tin người giành giải năm 1984 và chủ đề, sắp xếp theo tên chủ đề và sau đó là tên người giành giải, nhưng chủ đề Chemistry và Physics xếp cuối
CREATE OR REPLACE VIEW v_view1 AS
SELECT
    `Subject`, Winner
FROM
    nobel
WHERE
    `Year` = 1984 AND `Subject`NOT IN ('Chemistry','Physics')
ORDER BY `Subject`, Winner;

CREATE OR REPLACE VIEW v_view2 AS
SELECT 
    `Subject`, Winner
FROM
    nobel
WHERE
    `Year` = 1984 AND `Subject` IN ('Chemistry','Physics')
ORDER BY `Subject`, Winner;

SELECT 
    *
FROM
    v_view1 
UNION ALL SELECT 
    *
FROM
    V_view2;