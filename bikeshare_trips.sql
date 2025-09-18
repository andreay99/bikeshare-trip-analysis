-- Bikeshare Trip Analysis SQL Script
-- Created by Andrea A. Yanez Soto, September 2025

-- Create the bikeshare_trips table
CREATE TABLE bikeshare_trips (
    rider_id INTEGER,
    trip_date DATE,
    start_location TEXT,
    end_location TEXT,
    duration_minutes INTEGER,
    cost REAL
);

-- Insert sample data (10-20 rows)
INSERT INTO bikeshare_trips VALUES
(1, '2025-09-01', 'Manhattan', 'Brooklyn', 15, 2.5),
(1, '2025-09-02', 'Brooklyn', 'Queens', 25, 3.0),
(2, '2025-09-01', 'Queens', 'Manhattan', 10, 2.0),
(2, '2025-09-02', 'Manhattan', 'Queens', 20, 2.5),
(3, '2025-09-03', 'Brooklyn', 'Manhattan', 35, 4.0),
(3, '2025-09-04', 'Queens', 'Brooklyn', 15, 2.0),
(4, '2025-09-01', 'Manhattan', 'Queens', 12, 2.0),
(4, '2025-09-05', 'Brooklyn', 'Manhattan', 18, 2.5),
(5, '2025-09-06', 'Queens', 'Manhattan', 40, 4.5),
(5, '2025-09-07', 'Manhattan', 'Brooklyn', 22, 3.0);

-- Query 1: Average trip duration per start location
SELECT start_location, AVG(duration_minutes) AS avg_duration
FROM bikeshare_trips
GROUP BY start_location
ORDER BY avg_duration DESC;

-- Query 2: Top 5 riders by trip count
SELECT rider_id, COUNT(*) AS trip_count
FROM bikeshare_trips
GROUP BY rider_id
ORDER BY trip_count DESC
LIMIT 5;

-- Query 3: Total revenue by month
SELECT strftime('%Y-%m', trip_date) AS month, SUM(cost) AS total_revenue
FROM bikeshare_trips
GROUP BY month;

-- Query 4: Trips over 30 minutes
SELECT * FROM bikeshare_trips WHERE duration_minutes > 30;
