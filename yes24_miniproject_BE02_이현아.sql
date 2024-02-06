-- USE yes24;

-- CREATE TABLE Books (
--     bookID INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL,
--     author VARCHAR(255),
--     publisher VARCHAR(255),
--     publishing DATE,
--     rating DECIMAL(3, 1),
--     review INT,
--     sales INT,
--     price DECIMAL(10, 2),
--     ranking INT,
--     ranking_weeks INT
-- );

-- <기본 조회 및 필터링>
-- SELECT title, author FROM Books;
-- SELECT * FROM Books WHERE rating >= 8.0;
-- SELECT title, review FROM Books WHERE review  >= 100 ORDER BY review DESC;
-- SELECT title, price FROM Books WHERE price < 20000;
-- SELECT*FROM Books WHERE ranking_weeks >= 4 ORDER BY ranking_weeks DESC;
-- SELECT*FROM Books WHERE author = '자청 저';
-- SELECT*FROM Books WHERE publisher = '웅진지식하우스';

-- <조인 및 관계>
-- SELECT author, count(*) AS Books_count FROM Books GROUP BY author ORDER BY Books_count DESC;

-- SELECT publisher, count(*) AS publish_count FROM Books GROUP BY publisher ORDER BY publish_count DESC limit 1;
-- SELECT author, AVG(rating) AS rating_avg FROM Books GROUP BY author ORDER BY rating_avg;

-- SELECT*FROM Books WHERE ranking = 1;

-- SELECT title, sales, review FROM Books ORDER BY sales DESC, review DESC limit 10;
-- SELECT*FROM Books ORDER BY  publishing DESC LIMIT 5;

-- <집계 및 그룹화>
-- SELECT author, AVG(rating) AS rating_avg FROM Books GROUP BY author ORDER BY rating_avg DESC; 
-- SELECT publishing, count(*) AS publishing_count FROM Books GROUP BY publishing ORDER BY publishing_count DESC;
-- SELECT title, AVG(price) AS price_avg FROM Books GROUP BY title;
-- = SELECT title, price FROM Books;
-- SELECT * FROM Books ORDER BY review DESC limit 5;
-- SELECT ranking, avg(review) AS review_avg FROM Books GROUP BY ranking ORDER BY ranking ASC;

 -- <서브쿼리 및 고급 기능> 
 -- SELECT title, rating FROM books WHERE rating > (SELECT AVG(rating) FROM Books) ORDER BY rating DESC;
 -- SELECT AVG(rating) FROM Books;
 -- SELECT title, price FROM Books WHERE price > (SELECT AVG(price) FROM Books) ORDER BY price DESC;

-- SELECT title, review FROM Books WHERE review > (SELECT MAX(review) FROM Books);
-- SELECT title, sales, price, rating FROM Books WHERE sales < (SELECT AVG(sales) FROM Books) ORDER BY sales ASC;

-- SELECT title, author, publishing FROM Books 
-- WHERE author = (SELECT author FROM Books GROUP BY author ORDER BY count(*) DESC limit 1) 
-- ORDER BY publishing DESC limit 1;
-- SELECT author FROM Books GROUP BY author ORDER BY count(*) DESC limit 1;

-- <데이터 수정 및 관리>
-- UPDATE Books SET price=9999 WHERE title = "힌국사";
-- UPDATE Books SET title = '제목업데이트' WHERE author = '최태성 저'
-- DELETE FROM Books WHERE sales = (SELECT MIN(sales) FROM books)
-- UPDATE books SET rating = rating + 1 WHERE publisher= '웅진하우스'

-- <데이터 분석 예제>
-- SELECT author, AVG(rating), AVG(sales) FROM Books GROUP BY author
-- ORDER BY AVG(rating) DESC, AVG(sales) DESC;

-- SELECT publishing, AVG(price) FROM books GROUP BY publishing
-- ORDER BY publishing ASC;

-- SELECT publisher, count(*) AS book_count, SUM(review) AS review_sum 
-- FROM Books GROUP BY publisher ORDER BY book_count DESC;

-- SELECT ranking, AVG(sales) FROM books GROUP BY ranking;

-- SELECT price, AVG(review), AVG(rating) FROM books GROUP BY price;


-- <난이도가 있는 문제>
-- SELECT publisher, author, AVG(sales) as avg_sales
-- FROM Books
-- GROUP BY publisher, author
-- ORDER BY publisher, avg_sales DESC;

-- SELECT title, review, price FROM Books
-- WHERE review > (SELECT AVG(review) FROM Books) AND price < (SELECT AVG(price) FROM Books) ORDER BY review DESC, price ASC;

-- SELECT author, COUNT(DISTINCT title) as num_books
-- FROM Books
-- GROUP BY author
-- ORDER BY num_books DESC
-- LIMIT 1;

-- SELECT author, MAX(sales) FROM Books GROUP BY author ORDER BY MAX(sales) DESC;

-- SELECT MONTH(publishing) as month, COUNT(*) as num_books, AVG(price) as price_avg
-- FROM Books 
-- GROUP BY month
-- ORDER BY month ASC;

-- SELECT publisher, COUNT(*), MAX(rating) - MIN(rating) as rating_difference
-- FROM Books
-- GROUP BY publisher
-- HAVING COUNT(*) >= 2
-- ORDER BY rating_difference DESC;

-- SELECT title, sales, rating, rating / sales as ratio
-- FROM Books
-- -- WHERE author = '자청 저'
-- ORDER BY ratio DESC;



