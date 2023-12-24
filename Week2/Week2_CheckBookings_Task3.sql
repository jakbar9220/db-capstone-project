DELIMITER //

CREATE PROCEDURE AddValidBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
    DECLARE tableStatus INT DEFAULT 0;

    -- Start the transaction
    START TRANSACTION;

    -- Add a new booking record
    INSERT INTO Bookings (booking_id, booking_date, table_no, customer_id)
    VALUES ( (select max(booking_id) from bookings), p_BookingDate, p_TableNumber, NULL);

    -- Check if the table is already booked on the specified date
    SELECT COUNT(*) INTO tableStatus
    FROM Bookings
    WHERE booking_date = p_BookingDate AND table_no = p_TableNumber;

    -- Perform rollback or commit based on the table status
    IF tableStatus > 1 THEN
        -- Rollback the transaction
        ROLLBACK;
        SELECT CONCAT('Table ', p_TableNumber, ' is already booked - booking cancelled.') AS Result;
    ELSE
        -- Commit the transaction
        COMMIT;
        SELECT CONCAT('Booking for Table ', p_TableNumber, ' on ', p_BookingDate, ' is successful.') AS Result;
    END IF;
END //

DELIMITER ;