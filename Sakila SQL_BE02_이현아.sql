-- <데이터 조회 및 필터링>
-- SELECT f.title
-- FROM film f
-- JOIN film_actor fa ON f.film_id = fa.film_id
-- JOIN actor a ON fa.actor_id = a.actor_id
-- WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS';

-- SELECT c.name, COUNT(fc.film_id) as number_of_films
-- FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id
-- GROUP BY c.name;

-- SELECT r.rental_date, f.title
-- FROM rental r
-- JOIN inventory i ON r.inventory_id = i.inventory_id
-- JOIN film f ON i.film_id = f.film_id
-- WHERE r.customer_id = 5;

-- SELECT title, release_year
-- FROM film
-- ORDER BY release_year DESC, title
-- LIMIT 10;

-- <조인 및 관계>
-- SELECT a.first_name, a.last_name
-- FROM actor a
-- JOIN film_actor fa ON a.actor_id = fa.actor_id
-- JOIN film f ON fa.film_id = f.film_id
-- WHERE f.title = 'ACADEMY DINOSAUR';

-- SELECT DISTINCT c.first_name, c.last_name
-- FROM customer c
-- JOIN rental r ON c.customer_id = r.customer_id
-- JOIN inventory i ON r.inventory_id = i.inventory_id
-- JOIN film f ON i.film_id = f.film_id
-- WHERE f.title = 'ACADEMY DINOSAUR';

-- SELECT c.customer_id, c.first_name, c.last_name, MAX(r.rental_date) as last_rental_date, f.title
-- FROM customer c
-- JOIN rental r ON c.customer_id = r.customer_id
-- JOIN inventory i ON r.inventory_id = i.inventory_id
-- JOIN film f ON i.film_id = f.film_id
-- GROUP BY c.customer_id, c.first_name, c.last_name, f.title;

-- SELECT f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) as avg_rental_period
-- FROM film f
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY f.title;

-- <집계 및 그룹화>
-- SELECT f.title, COUNT(r.rental_id) as rental_count
-- FROM film f
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY f.title
-- ORDER BY rental_count DESC;

-- SELECT c.name, AVG(f.rental_rate) as average_rental_rate
-- FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id
-- JOIN film f ON fc.film_id = f.film_id
-- GROUP BY c.name;

-- SELECT YEAR(p.payment_date) as year, MONTH(p.payment_date) as month, SUM(p.amount) as total_sales
-- FROM payment p
-- GROUP BY YEAR(p.payment_date), MONTH(p.payment_date);

-- SELECT a.first_name, a.last_name, COUNT(fa.film_id) as number_of_films
-- FROM actor a
-- JOIN film_actor fa ON a.actor_id = fa.actor_id
-- GROUP BY a.first_name, a.last_name
-- ORDER BY number_of_films DESC;

-- <서브쿼리 및 고급기능>
-- SELECT f.title, SUM(p.amount) AS total_revenue
-- FROM film f
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY f.title
-- ORDER BY total_revenue DESC;

-- SELECT f.title, f.rental_rate
-- FROM film f
-- WHERE f.rental_rate > (SELECT AVG(rental_rate) FROM film);

-- SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
-- FROM rental r
-- JOIN customer c ON r.customer_id = c.customer_id
-- GROUP BY c.customer_id
-- ORDER BY rental_count DESC;

-- SELECT f.title, COUNT(r.rental_id) as num_rental
-- FROM film f
-- JOIN film_actor fa ON f.film_id = fa.film_id
-- JOIN actor a ON fa.actor_id = a.actor_id 
-- JOIN inventory i ON i.film_id = f.film_id 
-- JOIN rental r ON r.inventory_id = i.inventory_id
-- WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS'
-- GROUP BY f.title
-- ORDER BY num_rental DESC
-- limit 3;

-- <데이터 수정 및 관리>
-- INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
-- VALUES ('New Adventure Movie', 'A thrilling adventure of the unknown', 2023, 1, 3, 4.99, 120, 19.99, 'PG', 'Trailers,Commentaries');


-- UPDATE customer
-- SET address_id = (SELECT address_id FROM address WHERE address = '123 New Address, New City')
-- WHERE customer_id = 5;

-- UPDATE rental
-- SET return_date = NOW()
-- WHERE rental_id = 200;

-- DELETE FROM actor
-- WHERE actor_id = 10;

