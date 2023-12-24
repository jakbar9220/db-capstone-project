-- Create the prepared statement
SET @sql = 'SELECT order_id OrderID, Quantity, total_cost Cost
            FROM Orders
            WHERE customer_id = ?';

-- Prepare the statement
PREPARE GetOrderDetail FROM @sql;

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Deallocate the prepared statement
DEALLOCATE PREPARE GetOrderDetail;
