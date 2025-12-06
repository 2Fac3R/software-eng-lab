-- Solution for: Querying JSONB Data

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
-- We use the `@>` (contains) operator to check if the `metadata` jsonb
-- contains the nested structure we are looking for.
-- This type of query can be highly optimized with a GIN index.
SELECT id, device_name, metadata
FROM devices
WHERE metadata @> '{"location": {"section": "warehouse-a"}}';


-- Query 2: Find devices with low battery (< 20)
-- We use the `->>` operator to extract the `battery_level` field as text.
-- Then, we cast it to an integer (`::integer`) to perform a numerical comparison.
SELECT id, device_name, metadata
FROM devices
WHERE (metadata ->> 'battery_level')::integer < 20;
