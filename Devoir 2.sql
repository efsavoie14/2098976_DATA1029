-- question 2
SELECT title, price
FROM titles
WHERE title LIKE '%computer%' AND title NOT LIKE '%computers%';

