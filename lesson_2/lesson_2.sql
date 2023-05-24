CREATE DATABASE IF NOT EXISTS lesson_2;
USE lesson_2;

# Создание таблицы sales
CREATE TABLE sales(
	id SERIAL PRIMARY KEY,  -- SERIAL = BIGINT NOT NULL AI UNIQUE
    order_date DATE NOT Null,
	count_product INTEGER
);

# Заполняем таблицу sales значениями 

INSERT INTO sales(order_date, count_product) VALUES
	('2022-01-01', 156), ('2022-01-02', 180),
    ('2022-01-03', 21), ('2022-01-04', 124),
    ('2022-01-05', 341);
    
# Проверка существования таблицы 
SELECT * FROM sales;

# Установка типа в зависимости от кол-ва продутов
SELECT id AS 'order_id',
	CASE
		WHEN count_product < 100 THEN 'Small order'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Common order'
		WHEN count_product > 300 THEN 'Big order'
	END AS 'order_type'
FROM sales;

# Создание таблицы orders
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(3),
    amount DECIMAL(5, 2),
    order_status VARCHAR(10)
);
INSERT INTO orders (employee_id, amount, order_status) VALUES
	('e03', 15.00, 'OPEN'), ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'), ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
# Проверка существования таблицы orders
SELECT * FROM orders;

# Вывод full_order_status:
SELECT id, employee_id, 
	CASE order_status
		WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CLOSED' THEN 'Order is closed'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'
FROM orders;