-- Challenge: Querying JSONB Data

-- Instructions:
-- 1. Imagine you have the table below, `devices`, which stores metadata for each device in a `jsonb` column.
-- 2. Write a SELECT query that finds all devices that are located in the "warehouse-a" section.
-- 3. Write a second SELECT query that finds all devices that have a "battery_level" less than 20.
--    Hint: You will need to use the `->>` operator and cast the result to an integer.

-- --- Table Setup (for context) ---

CREATE TABLE devices (
    id serial PRIMARY KEY,
    device_name text NOT NULL,
    metadata jsonb
);

INSERT INTO devices (device_name, metadata) VALUES
('sensor-01', '{"location": {"building": 1, "section": "warehouse-a"}, "battery_level": 89, "active": true}'),
('sensor-02', '{"location": {"building": 1, "section": "warehouse-b"}, "battery_level": 15, "active": true}'),
('sensor-03', '{"location": {"building": 2, "section": "warehouse-a"}, "battery_level": 55, "active": false}'),
('sensor-04', '{"location": {"building": 1, "section": "office"}, "battery_level": 12, "active": true}');


-- --- Your Queries Here ---

-- Query 1: Find devices in "warehouse-a"
-- SELECT ...


-- Query 2: Find devices with low battery (< 20)
-- SELECT ...
