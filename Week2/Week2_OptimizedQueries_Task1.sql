DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE maxQuantity INT;

    -- Find the maximum order quantity
    SELECT MAX(Quantity) INTO maxQuantity FROM Orders;

    -- Display the result
    SELECT maxQuantity AS 'Max Quantity in Order';

END //

DELIMITER ;
