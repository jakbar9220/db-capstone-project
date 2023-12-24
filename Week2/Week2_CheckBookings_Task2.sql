DELIMITER //

CREATE PROCEDURE CheckBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
    DECLARE tableStatus INT DEFAULT 0;

    -- Check if the table is already booked on the specified date
    SELECT COUNT(*) INTO tableStatus
    FROM Bookings
    WHERE booking_date = p_BookingDate AND table_no = p_TableNumber;

    -- Provide the output based on the table status
    IF tableStatus > 0 THEN
        SELECT CONCAT('Table ', p_TableNumber, ' is already booked.') AS Result;
    ELSE
        SELECT CONCAT('Table ', p_TableNumber, ' is available for booking.') AS Result;
    END IF;
END //

DELIMITER ;
