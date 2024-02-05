-- questiobn 1
SELECT a.au_fname AS AuthorFirstName, 
a.au_lname AS AuthorLastName, 
p.pub_name AS PublisherName, 
a.city AS City
FROM authors a
JOIN publishers p ON a.city = p.city;

-- question 2 
SELECT a.au_fname AS AuthorFirstName, 
a.au_lname AS AuthorLastName, 
a.city AS AuthorCity,
p.pub_name AS PublisherName, 
p.city AS PublisherCity
FROM authors a
LEFT JOIN publishers p ON a.city = p.city;

-- question 3
SELECT a.au_fname AS AuthorFirstName,
a.au_lname AS AuthorLastName,
a.city AS AuthorCity,
p.pub_name AS PublisherName,
p.city AS PublisherCity
FROM publishers p
LEFT JOIN authors a ON p.city = a.city;

-- question 4
SELECT a.au_fname AS AuthorFirstName,
a.au_lname AS AuthorLastName,
a.city AS AuthorCity,
p.pub_name AS PublisherName,
p.city AS PublisherCity
FROM publishers p
LEFT JOIN authors a ON p.city = a.city
UNION
SELECT a.au_fname AS AuthorFirstName,
a.au_lname AS AuthorLastName,
a.city AS AuthorCity,
p.pub_name AS PublisherName,
p.city AS PublisherCity
FROM authors a
LEFT JOIN publishers p ON p.city = a.city;

-- question 5
SELECT job_lvl AS ExperienceLevel,
COUNT(*) AS EmployeeCount
FROM employees
GROUP BY job_lvl;

-- question 6
SELECT p.pub_name AS PublishingHouse,
COUNT(*) AS NumberOfEmployees
FROM publishers p
LEFT JOIN employees e ON p.pub_id = e.pub_id
GROUP BY p.pub_name;

-- question 7
SELECT p.pub_name AS PublishingHouse,
AVG(e.salary) AS AverageHourlySalary
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
GROUP BY p.pub_name;

-- question 8
SELECT p.pub_name AS PublishingHouse,
COUNT(*) AS SeniorEmployeeCount
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE e.job_lvl = 'SEINIOR'
GROUP BY p.pub_name;





