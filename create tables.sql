-- 1. Orders Table
CREATE TABLE Orders (
    Order_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Warehouse_ID VARCHAR(50),
    Route_ID VARCHAR(50),
    Order_Date VARCHAR(20), -- Importing as text first to clean later
    Expected_Delivery_Date VARCHAR(20),
    Actual_Delivery_Date VARCHAR(20),
    Delivery_Status VARCHAR(20),
    Primary key(order_ID)
);

-- 2. Routes Table
CREATE TABLE Routes (
    Route_ID VARCHAR(50),
    Start_Location VARCHAR(100),
    End_Location VARCHAR(100),
    Distance_KM DECIMAL(10, 2),
    Average_Travel_Time_Min INT,
    Traffic_Delay_Min INT,
    Delivery_Status VARCHAR(20),
    Primary Key(Route_ID)
);

-- 3. Warehouses Table
CREATE TABLE Warehouses (
    Warehouse_ID VARCHAR(50),
    Location VARCHAR(100),
    Processing_Time_Min INT,
    Dispatch_Time VARCHAR(20),
    Traffic_Delay_Min INT,
    Delivery_Status VARCHAR(20),
    primary Key(Warehouse_ID)
);

-- 4. Delivery Agents Table
CREATE TABLE Delivery_Agents (
    Agent_ID VARCHAR(50),
    Route_ID VARCHAR(50),
    Shift_Hours INT,
    Avg_Speed_KM_HR DECIMAL(10, 2),
    On_Time_Percentage DECIMAL(5, 2),
    Primary key(Agent_ID)
);

-- 5. Shipment Tracking Table
CREATE TABLE Shipment_Tracking (
    Shipment_ID VARCHAR(50),
    Order_ID VARCHAR(50),
    Checkpoint VARCHAR(100),
    Checkpoint_Time VARCHAR(50),
    Delay_Reason VARCHAR(100),
    Primary key(Shipment_ID)
);


