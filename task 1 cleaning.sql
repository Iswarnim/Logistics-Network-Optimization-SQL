-- 1. Disable Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- 2. Update Query
UPDATE Routes
SET Traffic_Delay_Min = (
    SELECT avg_delay FROM (
        SELECT AVG(Traffic_Delay_Min) AS avg_delay 
        FROM Routes 
        WHERE Traffic_Delay_Min IS NOT NULL
    ) AS temp_table
)
WHERE Traffic_Delay_Min IS NULL;






-- 3. column type to DATE
ALTER TABLE Orders MODIFY Order_Date DATE;
ALTER TABLE Orders MODIFY Expected_Delivery_Date DATE;
ALTER TABLE Orders MODIFY Actual_Delivery_Date DATE;


