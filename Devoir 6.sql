-- Devoir 6

-- 1 Noms complets des employés de plus haut grade par employeurs. (10 pts)
SELECT e.fname, e.lname, e.job_lvl, p.pub_name
FROM employees e
INNER JOIN publishers p ON e.pub_id = p.pub_id
WHERE (e.pub_id, e.job_lvl) IN (SELECT pub_id, MAX(job_id)
FROM employees
GROUP BY pub_id
);

-- 2 Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo. (10pts)
SELECT e.fname, e.lname, nz.salary
FROM employees e
INNER JOIN employees nz ON nz.fname = 'Norbert' AND nz.lname = 'Zongo'
WHERE e.salary > nz.salary;

-- 3 Noms complets des employés des éditeurs canadiens. (10 pts)
SELECT e.fname, e.lname
FROM employees e
INNER JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.country = 'Canada';

-- 4 Noms complets des employés qui ont un manager. (10pts)
SELECT CONCAT(e.fname, ' ', e.lname) AS Full_Name,
e.job_lvl
FROM employees e
WHERE e.job_lvl <> (
SELECT MAX(job_lvl) FROM employees
);

-- 5 Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur. (10 pts)
SELECT e.fname, e.lname, e.salary
FROM employees e
INNER JOIN (SELECT pub_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY pub_id
) AS avg_sal ON e.pub_id = avg_sal.pub_id
WHERE e.salary > avg_sal.avg_salary;

-- 6 Noms complets des employés qui ont le salaire minimum de leur grade (10 pts)
SELECT e.fname, e.lname, e.salary
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (SELECT MIN(salary)
    FROM employees
    WHERE job_id = e.job_id
);

-- 7 De quels types sont les livres les plus vendus? (10 pts)
SELECT 
t.type AS Book_Type,
SUM(s.qty) AS Total_Sold
FROM sales s
JOIN titles t ON s.title_id = t.title_id
GROUP BY t.type
ORDER BY Total_Sold DESC;

-- 8 Pour chaque boutique, les 2 livres les plus vendus et leurs prix. (10 pts)
SELECT s.stor_name, t.title, t.price
FROM (SELECT stor_id, title_id, ROW_NUMBER() OVER (PARTITION BY stor_id ORDER BY qty DESC) AS row_num
FROM sales
) AS ranked_sales
INNER JOIN stores s ON s.stor_id = ranked_sales.stor_id
INNER JOIN titles t ON t.title_id = ranked_sales.title_id
WHERE row_num <= 2;

-- 9 Les auteurs des 5 livres les plus vendus. (10 pts)
SELECT a.au_fname, a.au_lname
FROM authors a
INNER JOIN (SELECT ta.au_id
FROM titleauthor ta
INNER JOIN sales s ON ta.title_id = s.title_id
GROUP BY ta.au_id
ORDER BY SUM(s.qty) DESC
) AS top_authors ON a.au_id = top_authors.au_id;

-- 10 Prix moyens des livres par maisons d’édition. (10 pts)
SELECT p.pub_name, AVG(t.price) AS avg_price
FROM publishers p
INNER JOIN titles t ON p.pub_id = t.pub_id
GROUP BY p.pub_name;

-- 11 Les 3 auteurs ayant les plus de livres. (10 pts)
SELECT a.au_fname, a.au_lname, COUNT(ta.title_id) AS book_count
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
GROUP BY a.au_id
ORDER BY book_count DESC
LIMIT 3;
