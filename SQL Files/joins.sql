CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');


-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');


SELECT *
FROM Table1_fruit_basket;
SELECT *
FROM Table2_fruit_basket;

SELECT 
t1.*, t2.* 
FROM Table1_fruit_basket t1
INNER JOIN 
Table2_fruit_basket t2
ON 
t1.ID = t2.ID; 

SELECT 
t1.Fruit, t2.ID 
FROM Table1_fruit_basket t1
INNER JOIN 
Table2_fruit_basket t2
ON 
t1.ID = t2.ID; 

-- LEFT JOIN
SELECT
t1.*, t2.*
FROM Table1_fruit_basket t1
LEFT JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;

-- RIGHT JOIN
SELECT
t1.*, t2.*
FROM Table1_fruit_basket t1
RIGHT JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;


