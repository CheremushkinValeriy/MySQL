-- задача №1 

-- создаём базу данных
CREATE DATABASE IF NOT EXISTS dz_2;

-- переходим в базу данных
USE dz_2;

-- создаем таблицу
CREATE TABLE IF NOT EXISTS sales (
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_date DATE,
    count_product INT UNSIGNED
);

-- заполняем таблицу данными
INSERT INTO sales
VALUES
	(1, '2022-01-01', 156),
	(2, '2022-01-02', 180),
	(3, '2022-01-03', 21),
	(4, '2022-01-04', 124),
	(5, '2022-01-05', 341);
   
-- задача №2

-- прописываем условия выборки 
SELECT id AS 'id заказа',  
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product > 100 AND count_product < 300 THEN "Средний заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Большой заказ"
END AS 'Тип заказа'
FROM sales;

-- задача №3

-- создаем таблицу
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DECIMAL(5,2),
    order_status VARCHAR(10) NOT NULL
);

-- заполняем таблицу данными
INSERT INTO orders
VALUES
	(1, 'e03', 15.00, 'OPEN'),
	(2, 'e01', 25.50, 'OPEN'),
	(3, 'e05', 100.70, 'CLOSED'),
	(4, 'e02', 22.18, 'OPEN'),
	(5, 'e04', 9.50, 'CANCELLED');

-- прописываем условия выборки 
SELECT *,  
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
    ELSE "Error 404"
END AS full_order_status
FROM orders;






