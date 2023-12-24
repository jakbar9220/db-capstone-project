DELIMITER //

CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
    DECLARE orderCancelled INT DEFAULT 0;

    -- Check if the order exists
    SELECT COUNT(*) INTO orderCancelled
    FROM Orders
    WHERE order_id = p_OrderID;

    -- If the order exists, cancel it
    IF orderCancelled > 0 THEN
        DELETE FROM Orders
        WHERE order_id = p_OrderID;
        
        SELECT CONCAT('Order ID ', p_OrderID, ' is cancelled.') AS Result;
    ELSE
        SELECT 'Order not found. No changes made.' AS Result;
    END IF;
END //

DELIMITER ;
