mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> create table staff( ID char(5),DeptID numeric(2),Name character(15),Design character(15),Basic numeric(10,2),Gender character(1));
Query OK, 0 rows affected (0.63 sec)

mysql> INSERT INTO staff VALUES(102,2,'Arun','Analyst',6000,'M');
Query OK, 1 row affected (0.28 sec)

mysql> INSERT INTO staff VALUES(121,1,'Ruby','Typist',2010,'F');
Query OK, 1 row affected (0.22 sec)

mysql> INSERT INTO staff VALUES(156,3,'Mary','Manager',4500,'F');
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO staff VALUES(123,2,'Mridula','Analyst',6000,'F');
Query OK, 1 row affected (0.07 sec)

mysql>  INSERT INTO staff VALUES(114,4,'Menon','Clerk',1500,'M');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO staff VALUES(115,4,'Tim','Clerk',1500,'M');
Query OK, 1 row affected (0.10 sec)

mysql>  INSERT INTO staff VALUES(127,2,'Kiran','Manager',4000,'M');
Query OK, 1 row affected (0.05 sec)

mysql> ALTER TABLE staff ADD Manager_Name char(15);
Query OK, 0 rows affected (0.22 sec)
Records: 0  Duplicates: 0  Warnings: 0

select *from staff;
+------+--------+---------+---------+---------+--------+--------------+
| ID   | DeptID | Name    | Design  | Basic   | Gender | Manager_Name |
+------+--------+---------+---------+---------+--------+--------------+
| 102  |      2 | Arun    | Analyst | 6000.00 | M      | NULL         |
| 121  |      1 | Ruby    | Typist  | 2010.00 | F      | NULL         |
| 156  |      3 | Mary    | Manager | 4500.00 | F      | NULL         |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      | NULL         |
| 114  |      4 | Menon   | Clerk   | 1500.00 | M      | NULL         |
| 115  |      4 | Tim     | Clerk   | 1500.00 | M      | NULL         |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      | NULL         |
+------+--------+---------+---------+---------+--------+--------------+
7 rows in set (0.00 sec)

mysql> select distinct design from staff;
+---------+
| design  |
+---------+
| Analyst |
| Typist  |
| Manager |
| Clerk   |
+---------+
4 rows in set (0.00 sec)

mysql> select count(distinct design) from staff;
+------------------------+
| count(distinct design) |
+------------------------+
|                      4 |
+------------------------+
1 row in set (0.00 sec)

mysql> select Max(basic) From staff where gender='F';
+------------+
| Max(basic) |
+------------+
|    6000.00 |
+------------+
1 row in set (0.00 sec)

mysql> select * from staff where gender='F' AND design='typist';
+------+--------+------+--------+---------+--------+--------------+
| ID   | DeptID | Name | Design | Basic   | Gender | Manager_Name |
+------+--------+------+--------+---------+--------+--------------+
| 121  |      1 | Ruby | Typist | 2010.00 | F      | NULL         |
+------+--------+------+--------+---------+--------+--------------+
1 row in set (0.00 sec)

mysql> select * from staff where gender='M'AND design='Clerk' AND Basic>3000;
Empty set (0.00 sec)


mysql> select * from staff where design='Manager' OR design='Analyst' and DEPTID=2;
+------+--------+---------+---------+---------+--------+--------------+
| ID   | DeptID | Name    | Design  | Basic   | Gender | Manager_Name |
+------+--------+---------+---------+---------+--------+--------------+
| 102  |      2 | Arun    | Analyst | 6000.00 | M      | NULL         |
| 156  |      3 | Mary    | Manager | 4500.00 | F      | NULL         |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      | NULL         |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      | NULL         |
+------+--------+---------+---------+---------+--------+--------------+
4 rows in set (0.00 sec)


mysql> SELECT design, Basic from staff where Name='Ruby';
+--------+---------+
| design | Basic   |
+--------+---------+
| Typist | 2010.00 |
+--------+---------+
1 row in set (0.00 sec)


mysql> ALTER TABLE staff ADD COLUMN joining_date DATE;
Query OK, 0 rows affected (0.23 sec)


mysql> desc staff;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| ID           | char(5)       | YES  |     | NULL    |       |
| DeptID       | decimal(2,0)  | YES  |     | NULL    |       |
| Name         | char(15)      | YES  |     | NULL    |       |
| Design       | char(15)      | YES  |     | NULL    |       |
| Basic        | decimal(10,2) | YES  |     | NULL    |       |
| Gender       | char(1)       | YES  |     | NULL    |       |
| Manager_Name | char(15)      | YES  |     | NULL    |       |
| joining_date | date          | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
8 rows in set (0.01 sec)


mysql> UPDATE staff SET joining_date="2024-03-05" where Name='Ruby';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE staff SET joining_date="2022-03-06" where Name='Mary';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE staff SET joining_date="2020-12-06" where Name='Mridula';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE staff SET joining_date="2007-12-08" where Name='Menon';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE staff SET joining_date="2017-12-08" where Name='Tim';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE staff SET joining_date="2012-01-28" where Name='Kiran';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from staff ORDER BY joining_date;
+------+--------+---------+---------+---------+--------+--------------+--------------+
| ID   | DeptID | Name    | Design  | Basic   | Gender | Manager_Name | joining_date |
+------+--------+---------+---------+---------+--------+--------------+--------------+
| 114  |      4 | Menon   | Clerk   | 1500.00 | M      | NULL         | 2007-12-08   |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      | NULL         | 2012-01-28   |
| 115  |      4 | Tim     | Clerk   | 1500.00 | M      | NULL         | 2017-12-08   |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      | NULL         | 2020-12-06   |
| 156  |      3 | Mary    | Manager | 4500.00 | F      | NULL         | 2022-03-06   |
| 102  |      2 | Arun    | Analyst | 6000.00 | M      | NULL         | 2024-03-04   |
| 121  |      1 | Ruby    | Typist  | 2010.00 | F      | NULL         | 2024-03-05   |
+------+--------+---------+---------+---------+--------+--------------+--------------+
7 rows in set (0.00 sec)




mysql> select * from staff order by Basic DESC;
+------+--------+---------+---------+---------+--------+--------------+--------------+
| ID   | DeptID | Name    | Design  | Basic   | Gender | Manager_Name | joining_date |
+------+--------+---------+---------+---------+--------+--------------+--------------+
| 102  |      2 | Arun    | Analyst | 6000.00 | M      | NULL         | 2024-03-04   |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      | NULL         | 2020-12-06   |
| 156  |      3 | Mary    | Manager | 4500.00 | F      | NULL         | 2022-03-06   |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      | NULL         | 2012-01-28   |
| 121  |      1 | Ruby    | Typist  | 2010.00 | F      | NULL         | 2024-03-05   |
| 114  |      4 | Menon   | Clerk   | 1500.00 | M      | NULL         | 2007-12-08   |
| 115  |      4 | Tim     | Clerk   | 1500.00 | M      | NULL         | 2017-12-08   |
+------+--------+---------+---------+---------+--------+--------------+--------------+
7 rows in set (0.00 sec)

12
mysql> CREATE TABLE DEPARTMENT (DEPTID INT PRIMARY KEY,DNAME VARCHAR(255));
Query OK, 0 rows affected (0.35 sec)

13
14
mysql> INSERT INTO DEPARTMENT(DEPTID,DNAME)VALUES(1,'Design'),(2,'CODING'),(3,'Testing'),(4,'Research');
Query OK, 4 rows affected (0.09 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select *from DEPARTMENT;
+--------+----------+
| DEPTID | DNAME    |
+--------+----------+
|      1 | Design   |
|      2 | CODING   |
|      3 | Testing  |
|      4 | Research |
+--------+----------+
4 rows in set (0.00 sec)

15
mysql> SELECT Name AS Employee_Name, DNAME as Departent_Name FROM staff join DEPARTMENT ON staff.DeptID=DEPARTMENT.DEPTID;
+---------------+----------------+
| Employee_Name | Departent_Name |
+---------------+----------------+
| Arun          | CODING         |
| Ruby          | Design         |
| Mary          | Testing        |
| Mridula       | CODING         |
| Menon         | Research       |
| Tim           | Research       |
| Kiran         | CODING         |
+---------------+----------------+
7 rows in set (0.00 sec)

16
mysql> select DNAME FROM staff join DEPARTMENT ON staff.DeptID = DEPARTMENT.DEPTID where staff.Name='Arun';
+--------+
| DNAME  |
+--------+
| CODING |
+--------+
1 row in set (0.00 sec)

17
mysql> SELECT Basic from staff where DeptID=(SELECT DEPTID from DEPARTMENT where DNAME= 'Design');
+---------+
| Basic   |
+---------+
| 2010.00 |
+---------+
1 row in set (0.00 sec)


18
mysql> SELECT * from staff where Design='Typist' AND DeptID=(select DEPTID from DEPARTMENT where DNAME='Design');
+------+--------+------+--------+---------+--------+--------------+--------------+
| ID   | DeptID | Name | Design | Basic   | Gender | Manager_Name | joining_date |
+------+--------+------+--------+---------+--------+--------------+--------------+
| 121  |      1 | Ruby | Typist | 2010.00 | F      | NULL         | 2024-03-05   |
+------+--------+------+--------+---------+--------+--------------+--------------+
1 row in set (0.00 sec)

19
mysql> select Basic from staff where DeptID=(select DEPTID from DEPARTMENT where DNAME='Research');
+---------+
| Basic   |
+---------+
| 1500.00 |
| 1500.00 |
+---------+
2 rows in set (0.00 sec)

20
mysql> select * from staff where Gender='F' AND DeptID=(select DEPTID from DEPARTMENT where DNAME ='Testing');
+------+--------+------+---------+---------+--------+--------------+--------------+
| ID   | DeptID | Name | Design  | Basic   | Gender | Manager_Name | joining_date |
+------+--------+------+---------+---------+--------+--------------+--------------+
| 156  |      3 | Mary | Manager | 4500.00 | F      | NULL         | 2022-03-06   |
+------+--------+------+---------+---------+--------+--------------+--------------+
1 row in set (0.00 sec)


13
mysql> ALTER TABLE DEPARTMENT MODIFY DEPTID DECIMAL(2,0);
Query OK, 4 rows affected (0.66 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE staff add  FOREIGN KEY(DeptID) references DEPARTMENT(DEPTID);
Query OK, 7 rows affected (1.36 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> desc DEPARTMENT;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| DEPTID | decimal(2,0) | NO   | PRI | NULL    |       |
| DNAME  | varchar(255) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

21
mysql> select * from staff where DeptID NOT IN(select DEPTID FROM DEPARTMENT where DNAME IN ('CODING','Testing'));
+------+--------+-------+--------+---------+--------+--------------+--------------+
| ID   | DeptID | Name  | Design | Basic   | Gender | Manager_Name | joining_date |
+------+--------+-------+--------+---------+--------+--------------+--------------+
| 121  |      1 | Ruby  | Typist | 2010.00 | F      | NULL         | 2024-03-05   |
| 114  |      4 | Menon | Clerk  | 1500.00 | M      | NULL         | 2007-12-08   |
| 115  |      4 | Tim   | Clerk  | 1500.00 | M      | NULL         | 2017-12-08   |
+------+--------+-------+--------+---------+--------+--------------+--------------+
3 rows in set (0.00 sec)































