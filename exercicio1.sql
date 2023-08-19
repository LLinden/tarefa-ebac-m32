-- Exercícios
-- Exercício 1
-- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes.
SELECT f.film_id, c.category_id, f.title, c.name FROM film_category fc
INNER JOIN film f
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
ORDER BY f.title ASC

-- Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. Ordene a lista pelo numero de filmes, 
-- iniciando pelos atores que mais atuaram
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS numeroDefilmes
FROM actor a
INNER JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY numeroDefilmes DESC;

-- Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de
-- duração (120min). Ordene a lista pelo numero de filmes que cada ator participou.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS numero_filmes
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.length > 120
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY numero_filmes DESC;

-- Exercício 2
-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros
-- encontrados pela busca

-- Para isso criei uma View para cada consulta anterior, para facilitar:
-- a
CREATE VIEW listaDeFilmesPorategoria AS 
SELECT f.film_id, c.category_id, f.title, c.name FROM film_category fc
INNER JOIN film f
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
ORDER BY f.title ASC

SELECT COUNT(*) FROM listaDeFilmesPorategoria

-- b
-- lista de todos os atores com o número filmes que cada ator participou
CREATE VIEW listaDeAtoresComNumeroDeFilmes AS 
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS numeroDefilmes
FROM actor a
INNER JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY numeroDefilmes DESC;

SELECT COUNT(*) FROM listaDeAtoresComNumeroDeFilmes

-- c
-- lista de atores que atuaram em filmes com mais de duas horas de duração
CREATE VIEW listaDeAtoresFilmesMaisDeDuasHoras AS 
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS numero_filmes
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.length > 120
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY numero_filmes DESC;

SELECT COUNT(*) FROM listaDeAtoresFilmesMaisDeDuasHoras
