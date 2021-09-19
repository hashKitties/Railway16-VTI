USE Project;

-- 2.Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT 
    c.`Name`, sum(co.Amount) AS BoughtAmount
FROM
    CAR_ORDER co
        LEFT JOIN
    CUSTOMER c USING (CustomerID)
GROUP BY co.CustomerID
ORDER BY BoughtAmount;

-- 3.Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.
DROP FUNCTION IF EXISTS f_best_seller;
DELIMITER //
SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION f_best_seller() 
RETURNS VARCHAR(20)
BEGIN
	DECLARE v_seller VARCHAR(20);
    SELECT 
		ca.Maker
	INTO v_seller
	FROM
		CAR ca
        JOIN
		CAR_ORDER co USING (CarID)
	WHERE
		YEAR(co.DeliveryDate) = 2000
			AND co.Staus = '0'
	GROUP BY ca.Maker
	HAVING SUM(co.Amount) = (SELECT 
								MAX(mysum)
							FROM
								(SELECT 
									SUM(Amount) mysum
								FROM
									CAR ca
										JOIN CAR_ORDER co USING (CarID)
								WHERE
									YEAR(co.DeliveryDate) = 2000
										AND co.Staus = '0'
								GROUP BY ca.Maker) AS maxcount);
	RETURN v_seller;
END//
DELIMITER ;

Select f_best_seller();
-- 4.Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.
DROP PROCEDURE IF EXISTS p_delete_canceled_order_year_ago;

set foreign_key_checks = 0;
DELIMITER //

CREATE PROCEDURE p_delete_canceled_order_year_ago()
BEGIN
	DECLARE v_count TINYINT;
    SELECT 
		COUNT(Staus)
	INTO v_count
    FROM
		CAR_ORDER
	GROUP BY Staus
	HAVING Staus = 2;
	DELETE FROM CAR_ORDER 
	WHERE Staus = 2;
    SELECT v_count;
END//
DELIMITER ;
         
CALL p_delete_canceled_order_year_ago;

-- 5.Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.
DROP PROCEDURE IF EXISTS p_order_detail;

DELIMITER //

CREATE PROCEDURE p_order_detail(IN v_customer_id TINYINT)
BEGIN
	SELECT 
		co.CustomerID,
		c.`Name`,
		co.OrderID,
		co.Amount,
		co.CarID,
		ca.Maker
	FROM
		CAR_ORDER co
			JOIN
		CUSTOMER c USING (CustomerID)
			JOIN
		CAR ca USING (CarID)
	WHERE co.CustomerID = v_customer_id;
END//
DELIMITER ;

CALL p_order_detail(3);

-- 6.Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ
-- vào database (DeliveryDate < OrderDate + 15).
DROP TRIGGER IF EXISTS tr_input_check;
DELIMITER //
CREATE TRIGGER tr_input_check 
BEFORE INSERT ON CAR_ORDER
FOR EACH ROW
BEGIN
	IF DATEDIFF(NEW.DeliveryDate,NEW.OrderDate) < 15
    THEN
		SIGNAL sqlstate '45000'
			SET MESSAGE_TEXT = "Delivery date must be 15 days greater than order date";
	END IF;
END //
DELIMITER ;

INSERT INTO CAR_ORDER 
	(CustomerID,			CarID,				Amount,					SalePrice, 						OrderDate, 					DeliveryDate, 				DeliveryAddress,		Note)
	VALUES
	(2,						1,					7,						 8.000000,						'2000-04-08',				'2000-04-10',				 'HN2',					'1235'	);
