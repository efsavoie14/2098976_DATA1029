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
WHERE au_id NOT IN (
SELECT DISTINCT ta.au_id
FROM titleauthor ta
LEFT JOIN titles t ON ta.title_id = t.title_id
WHERE t.pub_id NOT IN (
SELECT pub_id
FROM publishers
WHERE pub_name = 'Eyrolles'));

-- question 3
SELECT DISTINCT au_fname, au_lname
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
WHERE advance > (
SELECT MAX(advance)
FROM titles
WHERE pub_id = (
SELECT pub_id
FROM publishers
WHERE pub_name = 'Harmattan'));