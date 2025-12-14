-- top 3 warehouses with the highest average processing time.
SELECT 
    Warehouse_ID,
    Location,
    Processing_Time_Min
FROM Warehouses
ORDER BY Processing_Time_Min DESC
LIMIT 3;



-- Total vs. Delayed Shipments per Warehouse
SELECT 
    Warehouse_ID,
    COUNT(Order_ID) AS Total_Shipments,
    SUM(CASE WHEN Actual_Delivery_Date > Expected_Delivery_Date THEN 1 ELSE 0 END) AS Delayed_Shipments
FROM Orders
GROUP BY Warehouse_ID;




-- Bottleneck Warehouses (Using CTEs)
WITH Global_Avg AS (
    SELECT AVG(Processing_Time_Min) AS Global_Avg_Time
    FROM Warehouses
)
SELECT 
    w.Warehouse_ID,
    w.Location,
    w.Processing_Time_Min,
    g.Global_Avg_Time
FROM Warehouses w, Global_Avg g
WHERE w.Processing_Time_Min > g.Global_Avg_Time;




-- Rank Warehouses by On-Time Percentage
SELECT 
    Warehouse_ID,
    (SUM(CASE WHEN Actual_Delivery_Date <= Expected_Delivery_Date THEN 1 ELSE 0 END) / COUNT(Order_ID)) * 100 AS On_Time_Percentage,
    DENSE_RANK() OVER (
        ORDER BY (SUM(CASE WHEN Actual_Delivery_Date <= Expected_Delivery_Date THEN 1 ELSE 0 END) / COUNT(Order_ID)) DESC
    ) AS Performance_Rank
FROM Orders
GROUP BY Warehouse_ID;