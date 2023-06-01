-- создаем базу данных
CREATE DATABASE IF NOT EXISTS dz_3;

-- переходим в базу данных
USE dz_3;

-- создаем таблицы
CREATE TABLE IF NOT EXISTS SALESPEOPLE (
    snum INT UNSIGNED PRIMARY KEY NOT NULL,
    sname VARCHAR(20) NOT NULL,
    city VARCHAR(40) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS CUSTOMERS(
    cnum INT UNSIGNED PRIMARY KEY NOT NULL,
    cname VARCHAR(20),
    city VARCHAR(40),
    rating INT,
    snum INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS ORDERS(
    onum INT UNSIGNED PRIMARY KEY NOT NULL,
    amt DECIMAL(6,2),
    odate DATE NOT NULL,
    cnum INT UNSIGNED NOT NULL,
    snum INT UNSIGNED NOT NULL
    );

-- заполняем таблицы данными
INSERT INTO SALESPEOPLE
VALUES
    (1001, 'Peel', 'London'),
    (1002, 'Serres', 'San Jose'),
    (1004, 'Motika', 'London'),
    (1007, 'Rifkin', 'Barcelona'),
    (1003, 'Axelrod', 'New York');

INSERT INTO CUSTOMERS
VALUES
    (2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJone', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'SanJone', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);
    
INSERT INTO ORDERS
VALUES
    (3001, 18.69 , '1990-03-10', 2008, 1007), 
    (3003, 767.19 , '1990-03-10', 2001, 1001), 
    (3002, 1900.10 , '1990-03-10', 2007, 1004),
    (3005, 5160.45 , '1990-03-10', 2003, 1002),
    (3006, 1098.16 , '1990-03-10', 2008, 1007),
    (3009, 1713.23 , '1990-04-10', 2002, 1003), 
    (3007, 75.75 , '1990-04-10', 2004, 1002),
    (3008, 4723.00 , '1990-05-10', 2006, 1001),
    (3010, 1309.95 , '1990-06-10', 2004, 1002),
    (3011, 9891.88 , '1990-06-10', 2006, 1001);

-- создаем связь между таблицами
ALTER TABLE CUSTOMERS
  ADD FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum);
  
ALTER TABLE ORDERS
  ADD FOREIGN KEY (cnum) REFERENCES  CUSTOMERS (cnum),
  ADD FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum);

-- задача №1
SELECT city, sname, snum
FROM SALESPEOPLE;

-- задача №2
SELECT rating, cname
FROM CUSTOMERS
WHERE city = 'SanJone';

-- задача №3
SELECT DISTINCT snum
FROM ORDERS;

-- задача №4
SELECT * FROM CUSTOMERS WHERE cname LIKE 'G%';

-- задача №5
SELECT * FROM ORDERS WHERE amt > 1000;

-- задача №6
SELECT MIN(amt) FROM ORDERS;

-- задача №7
SELECT * FROM CUSTOMERS
WHERE rating > 100 AND city <> 'Rome'; 


-- Создание таблицы
CREATE TABLE IF NOT EXISTS staff (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  post VARCHAR(45), 
  seniority INT, 
  -- DECIMAL(общее количество знаков, количество знаков после запятой)
  -- DECIMAL(5,2) будут числа от -999.99 до 999.99
  salary DECIMAL(8, 2), 
  -- это числа от -999999.99 до 999999.99
  age INT
);

# Заполнение данными
INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM staff ORDER BY salary DESC;
SELECT * FROM staff ORDER BY salary;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT * FROM staff ORDER BY salary DESC LIMIT 5;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT first_name FROM staff   GROUP BY post;







