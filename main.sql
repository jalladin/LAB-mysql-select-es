1.
SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    t.title AS "TITLE",
    p.name AS "PUBLISHER"
FROM
    titleauthor ta
JOIN
    authors a ON ta.author_id = a.author_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.publisher_id = p.publisher_id;


2.
SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    p.name AS "PUBLISHER",
    COUNT(t.title) AS "TITLE COUNT"
FROM
    titleauthor ta
JOIN
    authors a ON ta.author_id = a.author_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.publisher_id = p.publisher_id
GROUP BY
    a.author_id, a.last_name, a.first_name, p.name;



3.
SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    SUM(ta.sales) AS "TOTAL"
FROM
    titleauthor ta
JOIN
    authors a ON ta.author_id = a.author_id
GROUP BY
    a.author_id, a.last_name, a.first_name
ORDER BY
    "TOTAL" DESC
LIMIT 3;


4.
SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    IFNULL(SUM(ta.sales), 0) AS "TOTAL"
FROM
    authors a
LEFT JOIN
    titleauthor ta ON a.author_id = ta.author_id
GROUP BY
    a.author_id, a.last_name, a.first_name
ORDER BY
    "TOTAL" DESC;




