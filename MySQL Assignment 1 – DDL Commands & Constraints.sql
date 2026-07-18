--        ==========================================
-- ---------------- MySQL Assignment 1 ------------
-- ------------ DDL Commands & Constraints ----------
--        ==========================================

 ---  --------------- QUETIONS -------------------------
 # DDL Commands :
   
1. Table Creation (CREATE): Write the SQL statements to create a database named
“employee” and the following tables based on the provided schema:
⦿ Departments
⦿ Location
⦿ Employees

2. Table Alteration (ALTER): Consider the following scenarios and write the SQL
statements to alter the structure of the tables accordingly:
⦿ Add a new column named "email" to the Employees table to store
employee email addresses.
⦿ Modify the data type of the "designation" column in the Employees
table to support a wider range of values.
⦿ Drop the “age” column from the Employees table.
⦿ Rename the “hire_date” column to “date_of_joining”.

3. Table Renaming (RENAME): Rewrite the SQL statements to rename the
following tables:
⦿ Rename the "Departments" table to "Departments_Info".
⦿ Rename the "Location" table to "Locations".

4. Table Truncation (TRUNCATE): Write an SQL statement to truncate the
Employees table.
5. Database & Table Dropping (DROP): Write the SQL statements to drop the
Employees table and then the “employee” database.

Constraints :
1. Database Recreation:

⦿ Drop the 'employee' database if it exists and recreate it using the
provided schema, ensuring that all tables are created with the
appropriate constraints as instructed.

2. Departments Table:

⦿ Ensure that the "department_id" uniquely identifies each department.
⦿ Set up constraints on the "department_name" to avoid duplicate and null
entries.

3. Location Table:

⦿ Establish a mechanism to automatically generate unique identifiers for
each location, ensuring that they are incremented sequentially.
⦿ Implement constraints to prevent the insertion of null and duplicate
locations.
4. Employees Table:

⦿ Guarantee that each employee has a distinct identifier.
⦿ Create a restriction to ensure that the employee's name is always
provided.
⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
⦿ Enforce a condition to ensure that the employee's age is 18 or above.
⦿ Automatically assign the current date to the "hire_date" field if not
specified.
⦿ Establish links between the "department_id" and "location_id" fields in
the "employees" table and their respective tables.

----------------------- ANSWERS ----------------------

-- 1. Drop database if it exists
DROP DATABASE IF EXISTS employee;

-- 2. Create database
CREATE DATABASE employee;

-- 3. Use database
USE employee;

-- ==========================================
-- CREATE TABLES
-- ==========================================

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Location Table
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender enum('M','F'),
    age INT CHECK (age >= 18),
	hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary decimal(10,2),

    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

-- ==========================================
-- ALTER TABLE
-- ==========================================

-- Add email column
ALTER TABLE Employees
ADD email VARCHAR(100);

-- Modify designation column
ALTER TABLE Employees
MODIFY designation VARCHAR(150);

-- Drop age column
ALTER TABLE Employees
DROP COLUMN age;

-- Rename hire_date column
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

-- ==========================================
-- RENAME TABLES
-- ==========================================

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

-- ==========================================
-- TRUNCATE TABLE
-- ==========================================

TRUNCATE TABLE Employees;

-- ==========================================
-- DROP TABLE & DATABASE
-- ==========================================

DROP TABLE Employees;

DROP DATABASE employee;