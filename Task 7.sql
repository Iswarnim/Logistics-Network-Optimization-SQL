--  avg Delivery delay per region
SELECT 
    r.Start_Location AS Region,
    AVG(DATEDIFF(o.Actual_Delivery_Date, o.Expected_Delivery_Date)) AS Average_Delay_Days
FROM Orders o
JOIN Routes r ON o.Route_ID = r.Route_ID
WHERE o.Actual_Delivery_Date > o.Expected_Delivery_Date
GROUP BY r.Start_Location
ORDER BY Average_Delay_Days DESC;


-- Overall On-Time Delivery Percentage
SELECT 
    (SUM(CASE WHEN Actual_Delivery_Date <= Expected_Delivery_Date THEN 1 ELSE 0 END) / COUNT(Order_ID)) * 100 AS Global_On_Time_Percentage
FROM Orders;




-- Avg traffic delay per route
SELECT 
    Route_ID,
    AVG(Traffic_Delay_Min) AS Average_Traffic_Delay
FROM Routes
GROUP BY Route_ID
ORDER BY Average_Traffic_Delay DESC;



SELECT AVG(Traffic_Delay_Min) AS Global_Avg_Traffic_Delay
FROM Routes;