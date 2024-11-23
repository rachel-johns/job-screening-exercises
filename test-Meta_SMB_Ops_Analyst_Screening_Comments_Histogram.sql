/* This is a test query to ensure the answer I provided in "Meta_SMB_Ops_Analyst_Screening_Comments_Histogram.sql" was correct. Basically, me checking my logic. I admit, is a bit excessive. */

-- Create the users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME,
    neighborhood_id INTEGER,
    mail VARCHAR(255)
);

-- Create the comments table
CREATE TABLE comments (
    user_id INTEGER,
    body VARCHAR(255),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data into users (optional for testing purposes)
INSERT INTO users (id, name, created_at, neighborhood_id, mail)
VALUES
(1, 'Alice', '2019-12-15', 101, 'alice@example.com'),
(2, 'Bob', '2020-01-05', 102, 'bob@example.com'),
(3, 'Charlie', '2020-01-10', 103, 'charlie@example.com'),
(4, 'David', '2020-01-15', 104, 'david@example.com'),
(5, 'Eve', '2020-01-20', 105, 'eve@example.com');

-- Insert sample data into comments (optional for testing purposes)
INSERT INTO comments (user_id, body, created_at)
VALUES
(1, 'This is a comment by Alice', '2020-01-05'),
(2, 'This is a comment by Bob', '2020-01-10'),
(2, 'Another comment by Bob', '2020-01-12'),
(3, 'This is a comment by Charlie', '2020-01-10'),
(3, 'Another comment by Charlie', '2020-01-15'),
(3, 'Third comment by Charlie', '2020-01-20'),
(4, 'This is a comment by David', '2020-01-25'),
(5, 'This is a comment by Eve', '2020-02-02'); -- Outside January

-- Query to generate the histogram of comments per user in January 2020
WITH comment_counts AS (
    SELECT 
        user_id,
        COUNT(*) AS comment_count
    FROM comments
    WHERE created_at >= '2020-01-01' 
    AND created_at < '2020-02-01'
    GROUP BY user_id
)
SELECT 
    CASE 
        WHEN comment_count = 0 THEN 0
        ELSE comment_count
    END AS comment_count,
    COUNT(*) AS frequency
FROM comment_counts
GROUP BY comment_count
ORDER BY comment_count;
