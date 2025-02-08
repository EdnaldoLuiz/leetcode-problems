SELECT 
    p.firstname,
    p.lastName,
    a.city,
    a.state
FROM Person p
NATURAL LEFT JOIN Address a;