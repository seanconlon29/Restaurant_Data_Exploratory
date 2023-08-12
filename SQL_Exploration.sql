-- SQL Format in file with correct queries.
-- What is the Total amount of orders?

SELECT SUM("Order Amount") AS total_amount
FROM orders;

-- What is the Total quantity of items sold?

SELECT SUM("Quantity of Items") AS total_quantity
FROM orders;

-- What is the average delivery time?

SELECT AVG("Delivery Time Taken (mins)") AS average_delivery_time
FROM orders;

-- What is the average rating for food?

SELECT AVG("Customer Rating-Food") AS average_food_rating
FROM orders;

-- Which restaurant received the most orders?

SELECT r.RestaurantName, COUNT(*) AS OrderCount
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY r.RestaurantName
ORDER BY OrderCount DESC
LIMIT 1;

-- Top 10 restaurants with most orders

SELECT r.RestaurantName, COUNT(o."Order ID") AS OrderCount
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY r.RestaurantName
ORDER BY OrderCount DESC
LIMIT 10;

-- Which restaurant saw the most sales?

SELECT RestaurantName, SUM("Order Amount") AS TotalSales
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY RestaurantName
ORDER BY TotalSales DESC
LIMIT 1;

-- Which customer ordered the most?

SELECT "Customer Name", COUNT(*) AS OrderCount
FROM orders AS o
GROUP BY "Customer Name"
ORDER BY OrderCount DESC
LIMIT 1;

-- Display restaurant name and category starting with 's'

SELECT RestaurantName, Category
FROM restaurants
WHERE RestaurantName LIKE 'S%';

-- Which is the most liked cuisine?

SELECT Cuisine, AVG("Customer Rating-Food") AS AvgFoodRating
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY Cuisine
ORDER BY AvgFoodRating DESC
LIMIT 1;

-- Which zone has the most sales?

SELECT Zone, SUM("Order Amount") AS TotalSales
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY Zone
ORDER BY TotalSales DESC
LIMIT 1;

-- The payment mode used the maximum number of times

SELECT "Payment Mode", COUNT(*) AS PaymentCount
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r.RestaurantID
GROUP BY "Payment Mode"
ORDER BY PaymentCount DESC
LIMIT 1;

-- Restaurant receiving delivery rating greater than 4

SELECT "Restaurant Name", Category
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r."RestaurantID"
WHERE "Customer Rating-Delivery" > 4;

-- Maximum delivery time taken by a restaurant

SELECT "Restaurant Name", MAX("Delivery Time Taken (mins)") AS MaxDeliveryTime
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r."RestaurantID"
GROUP BY "Restaurant Name";

-- Customer name, restaurant name, and category where the category is ordinary and name starts with 'd'

SELECT "Customer Name", "RestaurantName", Category
FROM orders AS o
JOIN restaurants AS r ON o."Restaurant ID" = r."RestaurantID"
WHERE Category = "Ordinary" AND "RestaurantName" LIKE 'D%';