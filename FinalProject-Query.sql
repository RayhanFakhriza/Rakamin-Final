SELECT 
B.order_date,
A.category_name,
A.product_name,
A.product_price,
B.order_quantity,
A.product_price * B.order_quantity as total_sales,
B.cust_email,
B.cust_city
FROM (SELECT pc.CategoryName as category_name,
p.ProdNumber as product_number,
p.ProdName as product_name,
p.Price as product_price
FROM main.Products p
LEFT JOIN main.ProductCategory pc
ON pc.CategoryID = p.Category) A
LEFT JOIN (SELECT o.Date as order_date,
o.Quantity as order_quantity,
c.CustomerEmail as cust_email,
c.CustomerCity as cust_city,
o.ProdNumber as product_number
FROM main.Orders o
LEFT JOIN main.Customers c
ON o.CustomerID = c.CustomerID) B
ON A.product_number = B.product_number;
