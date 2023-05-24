USE lesson_4;

#Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
SELECT MARK, COLOR, COUNT(*) AS COUNT FROM auto WHERE MARK = 'BMW' OR MARK='LADA'  GROUP BY MARK, COLOR ORDER BY MARK;
# Task_2
SELECT mc.MARK, mc.mark_count, (au.count_auto - mc.mark_count) AS over_count FROM 
	(SELECT mark, COUNT(*) AS mark_count FROM auto GROUP BY mark) AS mc
	CROSS JOIN 
    (SELECT COUNT(*) AS count_auto FROM auto) AS au;
# Task_3
create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
		(10, 'A'),
		(20, 'A'),
		(30, 'F'),
		(40, 'D'),
		(50, 'C');
insert into test_b(id) values
		(10),
		(30),
		(50);
SELECT id FROM test_a EXCEPT SELECT id FROM test_b;