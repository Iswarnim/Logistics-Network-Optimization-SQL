-- Rank by OTP
SELECT 
    Agent_ID,
    Route_ID,
    On_Time_Percentage,
    DENSE_RANK() OVER (
        PARTITION BY Route_ID 
        ORDER BY On_Time_Percentage DESC
    ) AS Agent_Rank
FROM Delivery_Agents;



-- Underperforming Agent 
SELECT 
    Agent_ID,
    Route_ID,
    On_Time_Percentage
FROM Delivery_Agents
WHERE On_Time_Percentage < 80;


-- Top5 vs bottom 5 agent 
SELECT 
    (SELECT AVG(Avg_Speed_KM_HR) 
     FROM (SELECT Avg_Speed_KM_HR FROM Delivery_Agents ORDER BY On_Time_Percentage DESC LIMIT 5) AS Top_5) 
     AS Avg_Speed_Top_5_Agents,
     
    (SELECT AVG(Avg_Speed_KM_HR) 
     FROM (SELECT Avg_Speed_KM_HR FROM Delivery_Agents ORDER BY On_Time_Percentage ASC LIMIT 5) AS Bottom_5) 
     AS Avg_Speed_Bottom_5_Agents;