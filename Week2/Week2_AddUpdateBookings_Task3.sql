DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    DECLARE rowsAffected INT;

    -- Delete the booking with the specified booking ID
    DELETE FROM Bookings
    WHERE booking_id = p_BookingID;

    -- Get the number of rows affected by the DELETE statement
    SELECT ROW_COUNT() INTO rowsAffected;

    IF rowsAffected > 0 THEN
        SELECT CONCAT('Booking ID ', p_BookingID, ' cancelled successfully.') AS Confirmation;
    ELSE
        SELECT CONCAT('Booking ID ', p_BookingID, ' not found. No changes made.') AS Confirmation;
    END IF;
END //

DELIMITER ;
