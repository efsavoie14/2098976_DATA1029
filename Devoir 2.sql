-- question 1
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- question 2
SELECT title, price
FROM titles, price
WHERE title LIKE '%computer%' AND title NOT LIKE '%computers%';

-- question 3
SELECT title, price
FROM titles, price
WHERE title LIKE 'SU%' OR title LIKE 'BU%';

-- question 4
SELECT title, price
FROM titles
WHERE NOT (title LIKE 'SU%' OR title LIKE 'BU%');

-- question 5
SELECT title, price
FROM titles
WHERE NOT (title LIKE 'S%' OR title LIKE 'B%') AND SUBSTRING(title, 2, 1) = 'o';

-- question 6
SELECT title, price
FROM title
WHERE NOT (title LIKE 'S%' OR title LIKE 'B%' ) AND MID(title, 3, 1) = 'f';

-- question 7
SELECT title, price
FROM titles
WHERE LEFT(title, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');



