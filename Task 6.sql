-- Last Checkpoint and Time per Order
SELECT 
    Order_ID, 
    Checkpoint, 
    Checkpoint_Time
FROM (
    SELECT 
        Order_ID, 
        Checkpoint, 
        Checkpoint_Time,
        ROW_NUMBER() OVER (PARTITION BY Order_ID ORDER BY Checkpoint_Time DESC) as rn
    FROM Shipment_Tracking
) t
WHERE rn = 1;




-- Most Common Delay Reasons
SELECT 
    Delay_Reason, 
    COUNT(*) AS Frequency
FROM Shipment_Tracking
WHERE Delay_Reason != 'None' AND Delay_Reason IS NOT NULL
GROUP BY Delay_Reason
ORDER BY Frequency DESC;




-- Orders with Multiple Delays
SELECT 
    Order_ID, 
    COUNT(*) AS Delayed_Checkpoints_Count
FROM Shipment_Tracking
WHERE Delay_Reason != 'None' AND Delay_Reason IS NOT NULL
GROUP BY Order_ID
HAVING COUNT(*) > 2;