USE epharmacy;
 
-- Exercice 2 question 1   La liste des utilisateurs de l'application selon leur role.

SELECT full_name
FROM user
UNION
SELECT name
FROM role;

-- Exercice 2 question 2   Noms et quantites des produits achetes par Oumar Moussa

SELECT name, min_qty
FROM product
WHERE full_name LIKE 'Oumar Moussa';

-- Exercice 2 Question 3   Quels sont les noms de produits dont le fournisseur est base a moncton

SELECT name
FROM product
WHERE city = 'Moncton';

-- Question boni




