-- Exercícios
-- Exercício 1
-- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes.
SELECT f.film_id, c.category_id, f.title, c.name FROM film_category fc
INNER JOIN film f
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
ORDER BY f.title ASC