/* This is the answer (main query). I have an additional file where I test the query. */

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
