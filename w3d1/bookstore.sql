
#exercise 1
SELECT 
  e.isbn
  FROM 
  editions AS e 
  JOIN publishers AS p ON e.publisher_id = p.id 
WHERE 
  p.name = 'Random House';

#exercise 2
SELECT
  e.isbn,
  b.title 
FROM 
  editions AS e 
  JOIN publishers AS p ON e.publisher_id = p.id 
  JOIN books as b ON b.id = e.book_id
WHERE 
  p.name = 'Random House';

#exercise 3
SELECT 
  e.isbn, 
  b.title, 
  s.stock, 
  s.retail 
FROM 
  editions AS e 
    JOIN publishers AS p ON e.publisher_id = p.id 
    JOIN books AS b ON b.id = e.book_id
    JOIN stock AS s ON e.isbn = s.isbn
WHERE 
  p.name = 'Random House';

#exercise 4
SELECT 
  e.isbn, 
  b.title, 
  s.stock, 
  s.retail 
FROM 
  editions AS e 
    JOIN publishers AS p ON e.publisher_id = p.id 
    JOIN books AS b ON b.id = e.book_id
    JOIN stock AS s ON e.isbn = s.isbn
WHERE 
  p.name = 'Random House' 
  AND s.stock > 0;

#exercise 5
SELECT 
  e.isbn, 
  b.title, 
  s.stock, 
  s.retail,
  CASE WHEN e.type = 'p' THEN 'paperback'
       WHEN e.type = 'h' THEN 'hardcover'
  END AS cover
FROM 
  editions AS e 
    JOIN publishers AS p ON e.publisher_id = p.id 
    JOIN books AS b ON b.id = e.book_id
    JOIN stock AS s ON e.isbn = s.isbn
WHERE 
  p.name = 'Random House' 
  AND s.stock > 0;

#exercise 6

SELECT 
  e.isbn, 
  b.title, 
  s.stock, 
  s.retail,
  CASE WHEN e.type = 'p' THEN 'paperback'
       WHEN e.type = 'h' THEN 'hardcover'
  END AS cover, 
  e.publication
FROM 
  editions AS e 
    FULL OUTER JOIN publishers AS p ON e.publisher_id = p.id 
    FULL OUTER JOIN books AS b ON b.id = e.book_id
    FULL OUTER JOIN stock AS s ON e.isbn = s.isbn;

#exercise 7

SELECT 
  SUM(stock)
FROM
  stock

#exercise 8

SELECT 
  ROUND(AVG(cost)) AS "Average Cost",
  ROUND(AVG(retail)) AS "Average Retail",
  ROUND(AVG(retail) - AVG(cost)) AS "Average Profit"
FROM
  stock;

#exercise 9

SELECT
  b.id, s.stock
FROM
  stock AS s
  JOIN editions AS e ON (s.isbn = e.isbn)
  JOIN books AS b ON (e.book_id = b.id)
ORDER BY
  s.stock DESC
LIMIT 1

#exercise 10

SELECT
  a.id,
  CONCAT(a.last_name, ' ', a.first_name) AS "Full Name",
  COUNT(b.title) AS "Books Written"
FROM
  authors AS a
    JOIN books AS b ON a.id = b.author_id
GROUP BY
  a.id;

#exercise 11

SELECT
  a.id,
  CONCAT(a.last_name, ' ', a.first_name) AS "Full Name",
  COUNT(b.title) AS "Books Written"
FROM
  authors AS a
    JOIN books AS b ON a.id = b.author_id
GROUP BY
  a.id
ORDER BY
  COUNT(b.title) DESC;

#exercise 12

explain SELECT 
  b.title,
  MAX(case e.type when 'p' then 1 else 0 end) as HAS_PAPERBACK,
  MAX(case e.type when 'h' then 1 else 0 end) as HAS_HARDCOVER
FROM
  books AS b
  JOIN editions AS e ON b.id = e.book_id
GROUP BY b.title
HAVING MAX(case e.type when 'p' then 1 else 0 end) > 0 
  AND MAX(case e.type when 'h' then 1 else 0 end) > 0;


explain SELECT 
  distinct b.title
FROM
  books AS b
WHERE
  (SELECT COUNT(t.book_id) FROM editions t WHERE t.book_id = b.id AND t.type = 'p') > 0
  AND
  (SELECT COUNT(t.book_id) FROM editions t WHERE t.book_id = b.id AND t.type = 'h') > 0












