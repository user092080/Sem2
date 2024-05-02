
mysql> show databases
    -> use databse college
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.01 sec)

mysql> USE databases college;

Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.01 sec)

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+
1 row in set (0.00 sec)

mysql> select * from staff;
+------+--------+---------+---------+---------+--------+------------+--------------+
| ID   | DeptID | Name    | Design  | Basic   | Gender | Manager_ID | Manager_Name |
+------+--------+---------+---------+---------+--------+------------+--------------+
| 101  |      1 | Ram     | Typist  | 2000.00 | M      |       NULL | martin       |
| 102  |      2 | Arun    | Analyst | 6000.00 | M      |       NULL | Joy          |
| 121  |      1 | Ruby    | Typist  | 2010.00 | F      |       NULL | Adam         |
| 156  |      3 | Mary    | Manager | 4500.00 | F      |       NULL | Joe          |
| 123  |      2 | Mridula | Analyst | 6000.00 | F      |        102 | Luke         |
| 114  |      4 | Menon   | Clerk   | 1500.00 | M      |        102 | Clark        |
| 115  |      4 | Tim     | Clerk   | 1500.00 | M      |        102 | Will         |
| 127  |      2 | Kiran   | Manager | 4000.00 | M      |        121 | Tim          |
+------+--------+---------+---------+---------+--------+------------+--------------+
8 rows in set (0.00 sec)

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+
1 row in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> USE 23mca9;
Database changed
mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+
1 row in set (0.01 sec)

mysql> create TABLE Student(roll_no INTEGER,name VARCHAR(255),dob DATE,address TEXT,phone_no VARCHAR(15),blood_group VARCHAR(5));
Query OK, 0 rows affected (0.08 sec)

mysql> create TABLE Course(courseid INTEGER,coursename VARCHAR(50),courseduration INTEGER);
Query OK, 0 rows affected (0.10 sec)

mysql> SHOW tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| Course           |
| Student          |
| staff            |
+------------------+
3 rows in set (0.00 sec)

mysql> DESC Student;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| roll_no     | int          | YES  |     | NULL    |       |
| name        | varchar(255) | YES  |     | NULL    |       
| dob         | date         | YES  |     | NULL    |       |
| address     | text         | YES  |     | NULL    |       |
| phone_no    | varchar(15)  | YES  |     | NULL    |       |
| blood_group | varchar(5)   | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> DESC Course;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| courseid       | int         | YES  |     | NULL    |       |
| coursename     | varchar(50) | YES  |     | NULL    |       |
| courseduration | int         | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Student DROP COLUMN blood_group;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Student ADD adhar_no INT;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Student MODIFY phone_no int;
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Student;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| roll_no  | int          | YES  |     | NULL    |       |
| name     | varchar(255) | YES  |     | NULL    |       |
| dob      | date         | YES  |     | NULL    |       |
| address  | text         | YES  |     | NULL    |       |
| phone_no | int          | YES  |     | NULL    |       |
| adhar_no | int          | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> DROP TABLE Student;
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| Course           |
| staff            |
+------------------+
2 rows in set (0.01 sec)

mysql> DROP TABLE Course;
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+
1 row in set (0.00 sec)

mysql> USE 23mca9

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.01 sec)

mysql> show tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| staff            |
+------------------+
1 row in set (0.01 sec)

mysql> DROP DATABASE 23mca9;
Query OK, 1 row affected (0.06 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| performance_schema |
+--------------------+
2 rows in set (0.00 sec)

mysql> CREATE DATABASE 23mca9;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 23mca9             |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> show tables;
ERROR 1046 (3D000): No database selected
mysql> use 23mca9;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> show tables;
Empty set (0.00 sec)

mysql> create database org;
mysql> create TABLE Student(roll_no INTEGER,name VARCHAR(255),dob DATE,address TEXT,phone_no VARCHAR(15),blood_group VARCHAR(5));
Query OK, 0 rows affected (0.08 sec)INTEGER,coursename VARCHAR(50),courseduration INTEGER);


mysql> create TABLE Employee(emp_no VARCHAR(15),empname VARCHAR(20),dob DATE,address TEXT,mobile_no INTEGER,dept_no VARCHAR(10),salary INTEGER);
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE Department(dept_no VARCHAR(15),deptname VARCHAR(10),location VARCHAR(10));
Query OK, 0 rows affected (0.10 sec)

mysql> SHOW tables;
+------------------+
| Tables_in_23mca9 |
+------------------+
| Department       |
| Employee         |
| Student          |
+------------------+
3 rows in set (0.00 sec)

mysql> DESC Student
    -> ;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| roll_no     | int          | YES  |     | NULL    |       |
| name        | varchar(255) | YES  |     | NULL    |       |
| dob         | date         | YES  |     | NULL    |       |
| address     | text         | YES  |     | NULL    |       |
| phone_no    | varchar(15)  | YES  |     | NULL    |       |
| blood_group | varchar(5)   | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> DESC Employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_no    | varchar(15) | YES  |     | NULL    |       |
| empname   | varchar(20) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| address   | text        | YES  |     | NULL    |       |
| mobile_no | int         | YES  |     | NULL    |       |
| dept_no   | varchar(10) | YES  |     | NULL    |       |
| salary    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> DESC Department;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| dept_no  | varchar(15) | YES  |     | NULL    |       |
| deptname | varchar(10) | YES  |     | NULL    |       |
| location | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Employee ADD Designation VARCHAR(20);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW TABLES;
+------------------+
| Tables_in_23mca9 |
+------------------+
| Department       |
| Employee         |
| Student          |
+------------------+
3 rows in set (0.01 sec)

mysql> DESC Employees;

DESC Employee\;
DESC Employee' at line 1
mysql> DESC Employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_no      | varchar(15) | YES  |     | NULL    |       |
| empname     | varchar(20) | YES  |     | NULL    |       |
| dob         | date        | YES  |     | NULL    |       |
| address     | text        | YES  |     | NULL    |       |
| mobile_no   | int         | YES  |     | NULL    |       |
| dept_no     | varchar(10) | YES  |     | NULL    |       |
| salary      | int         | YES  |     | NULL    |       |
| Designation | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)


mysql> ALTER TABLE Department DROP COLUMN location;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Department;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| dept_no  | varchar(15) | YES  |     | NULL    |       |
| deptname | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)


mysql> CREATE TABLE person(personid INTEGER(5) PRIMARY KEY,orderno VARCHAR(20) NOT NULL,Adhaar  NUMERIC NOT NULL UNIQUE,Age INTEGER CHECK(Age >18));
Query OK, 0 rows affected, 1 warning (0.11 sec)

mysql> ALTER TABLE person DROP orderno;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc person;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| personid | int           | NO   | PRI | NULL    |       |
| Adhaar   | decimal(10,0) | NO   | UNI | NULL    |       |
| Age      | int           | YES  |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)


mysql> ALTER TABLE person ADD COLUMN name VARCHAR(255) NOT NULL;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC person;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| personid | int           | NO   | PRI | NULL    |       |
| Adhaar   | decimal(10,0) | NO   | UNI | NULL    |       |
| Age      | int           | YES  |     | NULL    |       |
| name     | varchar(255)  | NO   |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> CREATE TABLE orders(orderid INT(5) PRIMARY KEY,orderno INT(10) NOT NULL,personid INT,foreign key (personid) references person(personid));
Query OK, 0 rows affected, 2 warnings (0.07 sec)

mysql> DESC person;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| personid | int           | NO   | PRI | NULL    |       |
| Adhaar   | decimal(10,0) | NO   | UNI | NULL    |       |
| Age      | int           | YES  |     | NULL    |       |
| name     | varchar(255)  | NO   |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> DESC orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| orderid  | int  | NO   | PRI | NULL    |       |
| orderno  | int  | NO   |     | NULL    |       |
| personid | int  | YES  | MUL | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Employee ADD primary key (emp_no);
Query OK, 0 rows affected (0.21 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Department ADD primary key (dept_no);
Query OK, 0 rows affected (0.20 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_no      | varchar(15) | NO   | PRI | NULL    |       |
| empname     | varchar(20) | YES  |     | NULL    |       |
| dob         | date        | YES  |     | NULL    |       |
| address     | text        | YES  |     | NULL    |       |
| mobile_no   | int         | YES  |     | NULL    |       |
| dept_no     | varchar(10) | YES  |     | NULL    |       |
| salary      | int         | YES  |     | NULL    |       |
| Designation | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)




