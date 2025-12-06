-- Solution for: Creating a Partitioned Table

-- --- Parent Table (for context) ---

CREATE TABLE events (
    event_id bigserial not null,
    event_type text not null,
    created_at timestamptz not null,
    payload jsonb
) PARTITION BY RANGE (created_at);


-- --- Your DDL Statements Here ---

-- 1. Create partition for Q1 2024
-- This table will physically store all rows from the `events` table
-- where `created_at` falls within the specified range.
CREATE TABLE events_2024_q1 PARTITION OF events
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');


-- 2. Create partition for Q2 2024
CREATE TABLE events_2024_q2 PARTITION OF events
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

-- Now, if you were to insert a row with a `created_at` of '2024-02-15',
-- it would automatically be routed into the `events_2024_q1` table.
-- A query with `WHERE created_at >= '2024-05-01'` would not even scan the Q1 partition.
