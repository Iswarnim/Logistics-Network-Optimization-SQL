
-- Calculate Route Efficiency Metrics
SELECT 
    r.Route_ID,
    r.Distance_KM,
    r.Average_Travel_Time_Min,
    r.Traffic_Delay_Min,
    -- 1. Efficiency Ratio (Distance per Minute)
    (r.Distance_KM / NULLIF(r.Average_Travel_Time_Min, 0)) AS Efficiency_Ratio,
    -- 2. Average Delivery Time per Route (Derived from Orders)
    AVG(DATEDIFF(o.Actual_Delivery_Date, o.Order_Date)) AS Avg_Delivery_Days
FROM Routes r
LEFT JOIN Orders o ON r.Route_ID = o.Route_ID
GROUP BY r.Route_ID, r.Distance_KM, r.Average_Travel_Time_Min, r.Traffic_Delay_Min;



-- 2. 3 Routes with Worst Efficiency
SELECT 
    Route_ID,
    Distance_KM,
    Average_Travel_Time_Min,
    (Distance_KM / NULLIF(Average_Travel_Time_Min, 0)) AS Efficiency_Ratio
FROM Routes
ORDER BY Efficiency_Ratio ASC
LIMIT 3;


-- 3. Routes with >20% Delayed Shipments
SELECT 
    Route_ID,
    COUNT(Order_ID) AS Total_Orders,
    SUM(CASE WHEN Actual_Delivery_Date > Expected_Delivery_Date THEN 1 ELSE 0 END) AS Delayed_Orders,
    (SUM(CASE WHEN Actual_Delivery_Date > Expected_Delivery_Date THEN 1 ELSE 0 END) / COUNT(Order_ID)) * 100 AS Delay_Percentage
FROM Orders
GROUP BY Route_ID
HAVING Delay_Percentage > 20
ORDER BY Delay_Percentage DESC;



-- 4. Recommendation 
SELECT 
    r.Route_ID,
    r.Traffic_Delay_Min,
    (SELECT (SUM(CASE WHEN Actual_Delivery_Date > Expected_Delivery_Date THEN 1 ELSE 0 END) / COUNT(Order_ID)) * 100 
     FROM Orders o WHERE o.Route_ID = r.Route_ID) AS Delay_Percentage
FROM Routes r
WHERE r.Traffic_Delay_Min > 10 -- Filter for high traffic
HAVING Delay_Percentage > 20   -- Filter for high delays
ORDER BY Traffic_Delay_Min DESC;

-- we have to restructure theese routes