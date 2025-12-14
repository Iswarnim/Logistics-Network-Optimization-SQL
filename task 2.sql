-- Delay in Day
SELECT 
    Order_ID, 
    Expected_Delivery_Date,
    Actual_Delivery_Date,
    DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) AS Delay_Days
FROM Orders
WHERE Actual_Delivery_Date > Expected_Delivery_Date;



-- top10 delay routes based onn avg delay day
SELECT 
    Route_ID, 
    AVG(DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date)) AS Avg_Delay_Days
FROM Orders
WHERE Actual_Delivery_Date > Expected_Delivery_Date
GROUP BY Route_ID
ORDER BY Avg_Delay_Days DESC
LIMIT 10;




-- order Ranking by Delay
SELECT 
    Order_ID, 
    Warehouse_ID, 
    DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) AS Delay_Days,
    DENSE_RANK() OVER (
        PARTITION BY Warehouse_ID 
        ORDER BY DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) DESC
    ) AS Delay_Rank
FROM Orders
WHERE Actual_Delivery_Date > Expected_Delivery_Date;



SELECT AVG(DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date)) AS Global_Avg_Delay_Days
FROM Orders
WHERE Actual_Delivery_Date > Expected_Delivery_Date;