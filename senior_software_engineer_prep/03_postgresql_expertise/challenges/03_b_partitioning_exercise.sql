-- Challenge: Creating a Partitioned Table

-- Instructions:
-- The `events` table below is designed to store a large volume of timestamped events.
-- Your task is to create two partitions for this table.
--
-- 1. Create a partition named `events_2024_q1` to hold events from January 1, 2024, up to (but not including) April 1, 2024.
-- 2. Create a partition named `events_2024_q2` to hold events from April 1, 2024, up to (but not including) July 1, 2024.

-- --- Parent Table (for context) ---

CREATE TABLE events (
    event_id bigserial not null,
    event_type text not null,
    created_at timestamptz not null,
    payload jsonb
) PARTITION BY RANGE (created_at);


-- --- Your DDL Statements Here ---

-- 1. Create partition for Q1 2024
-- CREATE TABLE ...


-- 2. Create partition for Q2 2024
-- CREATE TABLE ...
