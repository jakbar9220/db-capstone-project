SELECT 
    C.customer_id CustomerID,
    c.name AS FullName,
    o.order_ID OrderID,
    o.total_cost Cost,
    m.menu_name MenuName,
    mi.course_name CourseName,
    mi.starter_name StarterName
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN menu m ON o.menu_id = m.menu_id
JOIN menu_items mi ON o.menu_id = mi.menu_id
WHERE o.total_cost > 150;
