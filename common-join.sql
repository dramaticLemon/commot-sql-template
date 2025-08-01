CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


-- template join 
SELECT
    -- Столбцы, которые вы хотите получить
    t1.столбец_1,
    t2.столбец_2
FROM
    таблица_1 AS t1 -- Левая таблица
[ТИП_JOIN]
    таблица_2 AS t2 -- Правая таблица
ON
    t1.столбец = t2.столбец; -- Условие объединения
