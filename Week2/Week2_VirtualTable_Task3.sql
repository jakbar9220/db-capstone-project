SELECT menu_name MenuName
FROM menu
WHERE menu_id = ANY (
    SELECT menu_id
    FROM orders
    WHERE Quantity > 2
);