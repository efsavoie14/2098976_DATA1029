USE library;

-- question 1 
SELECT DISTINCT au_fname, au_lname
FROM authors
WHERE au_id NOT IN (
SELECT DISTINCT ta.au_id
FROM titleauthor ta
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Harmattan');

-- question 2

SELECT DISTINCT au_fname, au_lname
FROM authors

