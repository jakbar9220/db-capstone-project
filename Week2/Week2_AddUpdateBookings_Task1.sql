DELIMITER //

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Add a new booking record
    INSERT INTO Bookings (booking_Id, customer_id, booking_date, table_no)
    VALUES (p_BookingID, p_CustomerID, p_BookingDate, p_TableNumber);

    SELECT CONCAT('New booking added') AS COnfirmation;
END //

DELIMITER ;
