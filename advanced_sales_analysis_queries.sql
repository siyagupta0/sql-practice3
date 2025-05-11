#Total Sales and Quantity by Product Line
SELECT 
    pl.productLine,
    SUM(od.quantityOrdered * od.priceEach) AS total_sales,
    SUM(od.quantityOrdered) AS total_quantity
FROM 
    productlines pl
JOIN 
    products p ON pl.productLine = p.productLine
JOIN 
    orderdetails od ON p.productCode = od.productCode
GROUP BY 
    pl.productLine
ORDER BY 
    total_sales DESC;

#Monthly Revenue Trend
SELECT 
    DATE_FORMAT(o.orderDate, '%Y-%m') AS order_month,
    SUM(od.quantityOrdered * od.priceEach) AS monthly_revenue
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    order_month
ORDER BY 
    order_month;
    
#High-Value Customers (Top 10 by Total Payments)
SELECT 
    c.customerName,
    SUM(p.amount) AS total_paid
FROM 
    customers c
JOIN 
    payments p ON c.customerNumber = p.customerNumber
GROUP BY 
    c.customerName
ORDER BY 
    total_paid DESC
LIMIT 10;

#Products with Low or No Sales
SELECT 
    p.productCode, p.productName
FROM 
    products p
LEFT JOIN 
    orderdetails od ON p.productCode = od.productCode
WHERE 
    od.orderNumber IS NULL;
    
#Revenue vs Credit Limit per Customer
SELECT 
    c.customerName,
    c.creditLimit,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM 
    customers c
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    c.customerNumber, c.customerName, c.creditLimit
ORDER BY 
    total_revenue DESC;
    
#Employee Performance by Sales (Revenue Handled)
SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS employee_name,
    SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM 
    employees e
JOIN 
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    e.employeeNumber, employee_name
ORDER BY 
    total_sales DESC;
    
#Payment vs Order Amount Validation
SELECT 
    c.customerName,
    SUM(p.amount) AS total_paid,
    SUM(od.quantityOrdered * od.priceEach) AS total_ordered,
    (SUM(p.amount) - SUM(od.quantityOrdered * od.priceEach)) AS discrepancy
FROM 
    customers c
JOIN 
    payments p ON c.customerNumber = p.customerNumber
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    c.customerNumber
HAVING 
    ABS(discrepancy) > 0.01;
    
#Orders with Delayed Shipments
SELECT 
    orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    DATEDIFF(shippedDate, requiredDate) AS delay_days
FROM 
    orders
WHERE 
    shippedDate > requiredDate;
    
#Total Orders by Country
SELECT 
    c.country,
    COUNT(o.orderNumber) AS total_orders
FROM 
    customers c
JOIN 
    orders o ON c.customerNumber = o.customerNumber
GROUP BY 
    c.country
ORDER BY 
    total_orders DESC;
    
#Agents Without Assigned Customers
SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS employee_name
FROM 
    employees e
LEFT JOIN 
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE 
    c.customerNumber IS NULL;