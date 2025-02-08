SELECT
    p.email as Email
FROM Person p
GROUP BY Email
HAVING COUNT(p.email) > 1