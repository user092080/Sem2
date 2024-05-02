mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+

mysql> USE 23mca9
Database changed

mysql> create table staff( ID char(5),DeptID numeric(2),Name character(15),Design character(15),Basic numeric(10,2),Gender character(1));

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+

1
mysql> DESC staff;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | char(5)       | YES  |     | NULL    |       |
| DeptID | decimal(2,0)  | YES  |     | NULL    |       |
| Name   | char(15)      | YES  |     | NULL    |       |
| Design | char(15)      | YES  |     | NULL    |       |
| Basic  | decimal(10,2) | YES  |     | NULL    |       |
| Gender | char(1)       | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+

mysql> INSERT INTO staff VALUES(102,2,'Arun','Analyst',6000,'M');

mysql> INSERT INTO staff VALUES(121,1,'Ruby','Typist',2010,'F');

mysql> INSERT INTO staff VALUES(156,3,'Mary','Manager',4500,'F');

mysql> INSERT INTO staff VALUES(123,2,'Mridula','Analyst',6000,'F');

mysql> INSERT INTO staff VALUES(114,4,'Menon','Clerk',1500,'M');

mysql> INSERT INTO staff VALUES(115,4,'Tim','Clerk',1500,'M');

mysql> INSERT INTO staff VALUES(127,2,'Kiran','Manager',4000,'M');

2
mysql> select *FROM staff;
+------+--------+---------+---------+---------+--------+
| ID   | DeptID | Name    | Design  | Basic   | Gender |
+------+--------+---------+---------+---------+--------+
| 101  |      1 | Ram     | Typist  | 2000.00 | M      |
| 102  |      2 | Arun    | Analyst | 6000.00 | M      |
| 121  |      1 | Ruby    | Typist  | 2010.00 | F      |
| 156  |      3 | Mary    | Manager | 4500.00 | F      |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      |
| 114  |      4 | Menon   | Clerk   | 1500.00 | M      |
| 115  |      4 | Tim     | Clerk   | 1500.00 | M      |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      |
+------+--------+---------+---------+---------+--------+

3
mysql> select ID Name,Design,Basic FROM staff;
+------+---------+---------+
| Name | Design  | Basic   |
+------+---------+---------+
| 101  | Typist  | 2000.00 |
| 102  | Analyst | 6000.00 |
| 121  | Typist  | 2010.00 |
| 156  | Manager | 4500.00 |
| 123  | Analyst | 6000.00 |
| 114  | Clerk   | 1500.00 |
| 115  | Clerk   | 1500.00 |
| 127  | Manager | 4000.00 |
+------+---------+---------+

4
mysql> select ID,Name FROM staff WHERE DeptID="2";
+------+---------+
| ID   | Name    |
+------+---------+
| 102  | Arun    |
| 123  | Mridula |
| 127  | Kiran   |
+------+---------+

5
mysql> select ID,Name,Design,DeptID,Basic,(0.075*Basic) AS DA,(Basic *0.10)AS HRA,(Basic+(Basic*0.075) + (Basic *0.10))AS "NET_SAL" FROM staff;
+------+---------+---------+--------+---------+-----------+----------+------------+
| ID   | Name    | Design  | DeptID | Basic   | DA        | HRA      | NET_SAL    |
+------+---------+---------+--------+---------+-----------+----------+------------+
| 101  | Ram     | Typist  |      1 | 2000.00 | 150.00000 | 200.0000 | 2350.00000 |
| 102  | Arun    | Analyst |      2 | 6000.00 | 450.00000 | 600.0000 | 7050.00000 |
| 121  | Ruby    | Typist  |      1 | 2010.00 | 150.75000 | 201.0000 | 2361.75000 |
| 156  | Mary    | Manager |      3 | 4500.00 | 337.50000 | 450.0000 | 5287.50000 |
| 123  | Mridula | Analyst |      2 | 6000.00 | 450.00000 | 600.0000 | 7050.00000 |
| 114  | Menon   | Clerk   |      4 | 1500.00 | 112.50000 | 150.0000 | 1762.50000 |
| 115  | Tim     | Clerk   |      4 | 1500.00 | 112.50000 | 150.0000 | 1762.50000 |
| 127  | Kiran   | Manager |      2 | 4000.00 | 300.00000 | 400.0000 | 4700.00000 |
+------+---------+---------+--------+---------+-----------+----------+------------+
6.
mysql> SELECT ID,Name,Design,DeptID,Basic FROM staff ORDER BY Basic DESC;
+------+---------+---------+--------+---------+
| ID   | Name    | Design  | DeptID | Basic   |
+------+---------+---------+--------+---------+
| 102  | Arun    | Analyst |      2 | 6000.00 |
| 123  | Mridula | Analyst |      2 | 6000.00 |
| 156  | Mary    | Manager |      3 | 4500.00 |
| 127  | Kiran   | Manager |      2 | 4000.00 |
| 121  | Ruby    | Typist  |      1 | 2010.00 |
| 101  | Ram     | Typist  |      1 | 2000.00 |
| 114  | Menon   | Clerk   |      4 | 1500.00 |
| 115  | Tim     | Clerk   |      4 | 1500.00 |
+------+---------+---------+--------+---------+

7

mysql> SELECT *FROM staff WHERE Design="Typist";
+------+--------+------+--------+---------+--------+
| ID   | DeptID | Name | Design | Basic   | Gender |
+------+--------+------+--------+---------+--------+
| 101  |      1 | Ram  | Typist | 2000.00 | M      |
| 121  |      1 | Ruby | Typist | 2010.00 | F      |
+------+--------+------+--------+---------+--------+

8
mysql> SELECT * FROM staff WHERE Design IN("Analyst","Manager" );
+------+--------+---------+---------+---------+--------+
| ID   | DeptID | Name    | Design  | Basic   | Gender |
+------+--------+---------+---------+---------+--------+
| 102  |      2 | Arun    | Analyst | 6000.00 | M      |
| 156  |      3 | Mary    | Manager | 4500.00 | F      |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      |
+------+--------+---------+---------+---------+--------+

9
mysql> SELECT DISTINCT Design FROM staff;
+---------+
| Design  |
+---------+
| Typist  |
| Analyst |
| Manager |
| Clerk   |
+---------+

10
mysql> SELECT ID,Name,DeptID,BAsic FROM staff WHERE (Design="Manager"or"Clerk")AND(Basic BETWEEN 1400 and 4500);
+------+-------+--------+---------+
| ID   | Name  | DeptID | BAsic   |
+------+-------+--------+---------+
| 156  | Mary  |      3 | 4500.00 |
| 127  | Kiran |      2 | 4000.00 |
+------+-------+--------+---------+

11
mysql> SELECT COUNT(*)  FROM staff WHERE Gender="M";
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+

12
mysql> SELECT Design ,MAX(Basic) As max FROM staff GROUP BY Design;
+---------+---------+
| Design  | max     |
+---------+---------+
| Typist  | 2010.00 |
| Analyst | 6000.00 |
| Manager | 4500.00 |
| Clerk   | 1500.00 |
+---------+---------+

13
mysql> ALTER TABLE staff ADD Manager_ID INT;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

14
mysql> UPDATE staff SET Manager_ID =NULL WHERE ID in(101,121,156);
mysql> UPDATE staff SET Manager_ID = 102 WHERE ID in(114,115,123);
mysql> UPDATE staff SET Manager_ID = 121 WHERE ID ="127";
Query OK, 3 rows affected (0.00 sec)

15
mysql> SELECT Manager_ID FROM staff WHERE Name="Ram";
+------------+
| Manager_ID |
+------------+
|       NULL |
+------------+

16

mysql> ALTER TABLE staff ADD Manager_Name char(15);
mysql> UPDATE staff SET Manager_Name = "martin" WHERE ID ="101";

mysql> UPDATE staff SET Manager_Name = "Joy" WHERE ID ="102";

mysql> UPDATE staff SET Manager_Name = "Adam" WHERE ID ="121";

mysql> UPDATE staff SET Manager_Name = "Joe" WHERE ID ="156";

mysql> UPDATE staff SET Manager_Name = "Luke" WHERE ID ="123";

mysql> UPDATE staff SET Manager_Name = "Clark" WHERE ID ="114";

mysql> UPDATE staff SET Manager_Name = "Will" WHERE ID ="115";

mysql> UPDATE staff SET Manager_Name = "Tim" WHERE ID ="127";

mysql> SELECT Manager_Name,Name AS EmployeName FROM staff ;
+--------------+-------------+
| Manager_Name | EmployeName |
+--------------+-------------+
| martin       | Ram         |
| Joy          | Arun        |
| Adam         | Ruby        |
| Joe          | Mary        |
| Luke         | Mridula     |
| Clark        | Menon       |
| Will         | Tim         |
| Tim          | Kiran       |
+--------------+-------------+


17
mysql> SELECT DeptID ,AVG(Basic) AS AverageSAlary FROM staff GROUP BY DeptID;
+--------+---------------+
| DeptID | AverageSAlary |
+--------+---------------+
|      1 |   2005.000000 |
|      2 |   5333.333333 |
|      3 |   4500.000000 |
|      4 |   1500.000000 |
+--------+---------------+

18
mysql> SELECT MAX(Basic) AS MaxSAlary FROM staff;
+-----------+
| MaxSAlary |
+-----------+
|   6000.00 |
+-----------+

19
mysql>  SELECT DeptID,COUNT(*) AS EmployeeCount FROM staff GROUP BY DeptID;
+--------+---------------+
| DeptID | EmployeeCount |
+--------+---------------+
|      1 |             2 |
|      2 |             3 |
|      3 |             1 |
|      4 |             2 |
+--------+---------------+

20
mysql> SELECT COUNT(DISTINCT DeptID) AS Number_oF_Departments FROM staff;
+-----------------------+
| Number_oF_Departments |
+-----------------------+
|                     4 |
+-----------------------+

