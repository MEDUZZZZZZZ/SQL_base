CREATE DATABASE IF NOT EXISTS lesson_3;
USE lesson_3;

# Создание и заполнение таблицы sales_people
CREATE TABLE IF NOT EXISTS sales_people(
	snum INTEGER PRIMARY KEY UNIQUE NOT Null,
	sname VARCHAR(12) NOT Null,
	city VARCHAR(24),
    comm DECIMAL (3, 2)
);
INSERT INTO sales_people (snum, sname, city, comm) VALUES
		(1001, 'Peel', 'London', 0.12), 
        (1002, 'Serres', 'San Jose', 0.13),
        (1004, 'Motika', 'London', 0.11), 
		(1007, 'Rifkin', 'Barcelona', 0.15), 
        (1003, 'Axelrod', 'New York', 0.10);
# Проверка создания таблицы и вывод ее занчений
SELECT * FROM sales_people;

# Создание и заполнение таблицы customers
CREATE TABLE IF NOT EXISTS customers(
	cnum INTEGER PRIMARY KEY UNIQUE NOT Null,
	cname VARCHAR(12) NOT Null,
	city VARCHAR(24),
    rating INTEGER,
    snum INTEGER NOT Null,
    FOREIGN KEY (snum)  REFERENCES sales_people (snum)
);

INSERT INTO customers (cnum, cname, city, rating, snum) VALUES
		(2001, 'Hoffman', 'London', 100, 1001), 
        (2002, 'Giovanni', 'Rome', 200, 1003),
        (2003, 'Liu', 'San Jose', 200, 1002),
        (2004, 'Grass', 'Berlin', 300, 1002), 
		(2006, 'Clemens', 'London', 100, 1001),
        (2008, 'Cisneros', 'San Jose', 300, 1007),
        (2007, 'Pereira', 'Rome', 100, 1004);
# Проверка создания таблицы и вывод ее занчений        
SELECT * FROM customers;

# Создание и заполнение таблицы orders
CREATE TABLE orders(
	onum INTEGER PRIMARY KEY UNIQUE NOT Null,
	amt DECIMAL(7, 2),
	odate DATE,
    cnum INTEGER NOT Null,
    snum INTEGER NOT Null,
    FOREIGN KEY (snum)  REFERENCES sales_people (snum),
    FOREIGN KEY (cnum)  REFERENCES customers (cnum)
);
INSERT INTO orders (onum, amt, odate, cnum, snum) VALUES
		(3001, 18.69, '1990-03-10', 2008, 1007), 
        (3003, 767.19, '1990-03-10', 2001, 1001),
        (3002, 1900.10, '1990-03-10', 2007, 1004),
        (3005, 5160.45, '1990-03-10', 2003, 1002), 
		(3006, 1098.16, '1990-03-10', 2008, 1007),
        (3009, 1713.23, '1990-04-10', 2002, 1003),
        (3007, 75.75, '1990-04-10', 2004, 1002),
        (3008, 4723.95, '1990-05-10', 2006, 1001),
        (3010, 1309.95, '1990-06-10', 2004, 1002),
        (3011, 9891.88, '1990-06-10', 2006, 1001);
SELECT * FROM orders;

# Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm FROM sales_people;
# Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating, cname FROM customers WHERE city = 'San Jose';
# Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM orders;
# Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": 
SELECT cname FROM customers WHERE cname LIKE 'G%';
# Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT onum, amt, odate AS odate FROM orders WHERE amt > 1000;
# Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT MIN(amt) FROM orders;
# Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT rating, cname, city FROM customers WHERE (NOT city = 'Rome') AND (rating > 100);

# Создание и заполнение талицы для части 2 домашнего задания 3
CREATE TABLE workers (
	id SERIAL PRIMARY KEY,
    name VARCHAR (12) NOT Null,
    surname VARCHAR (12) NOT Null,
	speciality VARCHAR (12),
    seniority INTEGER,
    salary DECIMAL (8),
    age INTEGER
);

INSERT INTO workers (name, surname, speciality, seniority, salary, age) VALUES
		('Вася', 'Васькин', 'начальник', 40, 100000, 60),
        ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
        ('Катя', 'Каткина', 'инженер', 2, 70000, 25),
        ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
        ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
        ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
        ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
        ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
        ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
        ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
        ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
        ('Люся', 'Люськина', 'уборщик', 10, 10000, 49); 
        
SELECT * FROM workers;
# Отсортируйте поле “зарплата” в порядке возрастания
SELECT * FROM workers ORDER BY salary;
# Отсортируйте поле “зарплата” в порядке убывания 
SELECT * FROM workers ORDER BY salary DESC;
# Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT * FROM (SELECT * FROM workers ORDER BY salary DESC LIMIT 5) q ORDER BY q.salary;
# Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT speciality, COUNT(*) AS count, SUM(salary) AS accum FROM workers GROUP BY speciality HAVING SUM(salary) > 100000;