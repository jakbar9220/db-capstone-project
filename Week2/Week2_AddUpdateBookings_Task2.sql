DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    -- Update the booking date for the specified booking ID
    UPDATE bookings
    SET booking_date = p_BookingDate
    WHERE booking_id = p_BookingID;

    IF ROW_COUNT() > 0 THEN
        SELECT CONCAT('Booking ID ', p_BookingID, ' updated successfully.') AS Result;
    ELSE
        SELECT CONCAT('Booking ID ', p_BookingID, ' not found. No changes made.') AS Result;
    END IF;
END //

DELIMITER ;
