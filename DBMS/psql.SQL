Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 384
Server version: 8.0.36-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> exit
Bye
1.
DROP PROCEDURE IF EXISTS greatest;
DELIMITER //

CREATE PROCEDURE greatest(IN num1 INT, IN num2 INT, IN num3 INT)
BEGIN
    DECLARE greatest INT;
    IF num1 >= num2 AND num1 >= num3 THEN
        SET greatest = num1;
    ELSEIF num2 >= num1 AND num2 >= num3 THEN
        SET greatest = num2;
    ELSE
        SET greatest = num3;
    END IF;
SELECT greatest AS greatest_number;
END//

DELIMITER ;

+Output+

23mca9@Dell-PowerEdge-R520:~$ cd adbms
23mca9@Dell-PowerEdge-R520:~/adbms$ ls
pgm1.sql
23mca9@Dell-PowerEdge-R520:~/adbms$ nano pgm1.sql

23mca9@Dell-PowerEdge-R520:~/adbms$ mysql -u 23mca9 -p
Enter password: 

mysql> use 23mca9

Database changed
mysql> source p1.sql
Query OK, 0 rows affected, 1 warning (0.04 sec)

Query OK, 0 rows affected (0.06 sec)

mysql> call greatest(1,2,3);
+-----------------+
| greatest_number |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

2.
DELIMITER //
DROP PROCEDURE IF EXISTS PrintNumbers;
CREATE PROCEDURE PrintNumbers(IN num1 INT,IN num2 INT)
BEGIN
    DECLARE start_num INT;
    DECLARE end_num INT;
    
    IF num1 < num2 THEN
        SET start_num = num1;
        SET end_num = num2;
    ELSE
        SET start_num = num2;
        SET end_num = num1;
    END IF;
    
    WHILE start_num <= end_num DO
        SELECT start_num;
        SET start_num = start_num + 1;
    END WHILE;
END //

DELIMITER ;

 +OUTPUT+
mysql> call PrintNumbers(1,5);
+-----------+
| start_num |
+-----------+
|         1 |
+-----------+
1 row in set (0.00 sec)

+-----------+
| start_num |
+-----------+
|         2 |
+-----------+
1 row in set (0.00 sec)

+-----------+
| start_num |
+-----------+
|         3 |
+-----------+
1 row in set (0.00 sec)

+-----------+
| start_num |
+-----------+
|         4 |
+-----------+
1 row in set (0.00 sec)

+-----------+
| start_num |
+-----------+
|         5 |
+-----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

3.

DELIMITER //
DROP PROCEDURE IF EXISTS sum_of_series;
CREATE PROCEDURE sum_of_series(IN N INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE series_sum INT DEFAULT 0;

    WHILE i <= N DO
        SET series_sum = series_sum + i;
        SET i = i + 1;
    END WHILE;

    SELECT series_sum AS sum_of_series;
END //

DELIMITER ;
output
mysql> call sum_of_series(10);
+---------------+
| sum_of_series |
+---------------+
|            55 |
+---------------+
1 row in set (0.00 sec)

4
DELIMITER //
DROP PROCEDURE IF EXISTS calculate_grade;
CREATE PROCEDURE calculate_grade(IN mark INT)
BEGIN
    DECLARE grade VARCHAR(10);

    IF mark >= 90 THEN
        SET grade = 'A';
    ELSEIF mark >= 80 THEN
        SET grade = 'B';
    ELSEIF mark >= 70 THEN
        SET grade = 'C';
    ELSEIF mark >= 60 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'F';
    END IF;

    SELECT CONCAT('Mark: ', mark, ', Grade: ', grade) AS result;
END //

DELIMITER ;
+output+
mysql> call calculate_grade(90);
+--------------------+
| result             |
+--------------------+
| Mark: 90, Grade: A |
+--------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)


5
DELIMITER //
DROP PROCEDURE IF EXISTS invert_number;
CREATE PROCEDURE invert_number(IN num INT)
BEGIN
    DECLARE inverted_num INT;

    SET inverted_num = 0;

    WHILE num > 0 DO
        SET inverted_num = inverted_num * 10 + num % 10;
        SET num = FLOOR(num / 10);
    END WHILE;

    SELECT inverted_num AS inverted_number;
END //

DELIMITER ;
mysql> source p5.sql
Query OK, 0 rows affected, 1 warning (0.04 sec)

Query OK, 0 rows affected (0.14 sec)

mysql> call invert_number(154);
+-----------------+
| inverted_number |
+-----------------+
|             451 |
+-----------------+
1 row in set (0.00 sec)

6

DELIMITER //
DROP PROCEDURE IF EXISTS WithdrawFromAccount;
CREATE PROCEDURE WithdrawFromAccount(IN account_id INT, IN withdrawal_amount DECIMAL(10, 2))
BEGIN
    DECLARE current_balance DECIMAL(10, 2);

    SELECT balance INTO current_balance
    FROM accounts
    WHERE id = account_id;

    IF current_balance IS NULL THEN
        SELECT 'Account does not exist.' AS Message;
    ELSE
        IF current_balance - withdrawal_amount >= 1000 THEN
            UPDATE accounts
            SET balance = balance - withdrawal_amount
            WHERE id = account_id;

            SELECT CONCAT('Withdrawal successful. New balance is ', balance) AS Message
            FROM accounts
            WHERE id = account_id;
        ELSE
            SELECT 'Withdrawal amount exceeds available balance.' AS Message;
        END IF;
    END IF;
END //

DELIMITER ;

7
DELIMITER //
DROP PROCEDURE IF EXISTS GetCustomerDetails;
CREATE PROCEDURE GetCustomerDetails (
IN customer_name VARCHAR(100)
)
BEGIN
SELECT *
FROM Customer
WHERE name = customer_name;
END //
DELIMITER ;
