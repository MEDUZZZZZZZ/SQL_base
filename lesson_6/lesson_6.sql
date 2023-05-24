CREATE DATABASE IF NOT EXISTS lesson_6;
USE lesson_6;

# Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS time_converter;
DROP FUNCTION IF EXISTS all_evens;

DELIMITER //
CREATE FUNCTION time_converter(inp INT) RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    
	SET days = FLOOR(inp / 86400);
    SET inp = inp % 86400;
    SET hours = FLOOR(inp / 3600);
    SET inp = inp % 3600;
    SET minutes = FLOOR(inp / 60);
    SET seconds = inp % 60;
    
	SET result = CONCAT(days, ' days ', hours, '  hours ', minutes, ' minutes ', seconds, ' seconds'); 
 
 RETURN (result);
END //

SELECT time_converter(123456) AS result;
# Выведите только четные числа от 1 до 10 включительно.
DELIMITER //
CREATE FUNCTION all_even() RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
	DECLARE n INT DEFAULT 2;
    DECLARE result VARCHAR(50) DEFAULT '';
    
	WHILE n < 12 DO
		SET result = CONCAT_WS(' ', result, n);
		SET n = n + 2;
	END WHILE;

	RETURN result;
END //

SELECT all_even() AS result;


