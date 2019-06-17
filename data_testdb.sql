_______________________________________________________________________________________________
-- DATA BEGIN
_______________________________________________________________________________________________

USE testdb;

-- Insert data into table task:
INSERT INTO tasks(title, start_date, end_date, description)
VALUES('Learn MySQL CREATE TABLE',
       Now(),
       Now(),
      'Practicing MySQL CREATE TABLE statement');

INSERT INTO tasks(title, start_date, end_date, description)
VALUES('Learn MySQL ALTER TABLE',
       Now(),
       Now(),
      'Practicing MySQL ALTER TABLE statement');


-- Insert data into table employee:
INSERT INTO employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane');

-- Delete employee emp_no = 2 ?
DELETE FROM employees
WHERE
    emp_no = 2;

-- Insert a new employee:
INSERT INTO employees(first_name,last_name)
VALUES('Jack','Lee');

-- Set PK for emp_no = 3 the ID of emp_no = 1.
-- MySQL ensures the DB PK integrity.
-- MySQL generate ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'.
UPDATE employees
SET
    first_name = 'Joe',
    emp_no = 1
WHERE
    emp_no = 3;

-- Q : Update PK of emp_no = 3 to 10:
UPDATE employees
SET
    first_name = 'Joe',
    emp_no = 10
WHERE
    emp_no = 3;

-- Q : Insert a new employe.
-- R : MySQL will assign PK = 11 to this new employee.
INSERT INTO employees(first_name,last_name)
VALUES('Wang','Lee');

-- To verify the last employee inserted:
SELECT LAST_INSERT_ID() ;


-- Q : Insert into table tabel :
INSERT INTO tasks(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', Now(), Now()),
      ('Check and update NOT NULL constraint to your database', NOW(), NULL);

-- Q : Fill in the end date (for exp : + 24H):
UPDATE tasks SET end_date = start_date + INTERVAL 1 DAY WHERE end_date IS NULL;

-- Q : change the column type of "end_date" to NOT NULL :
ALTER TABLE tasks
CHANGE end_date end_date DATETIME NOT NULL;

-- ALTER TABLE : add/delete/rename a column.
-- Q : Add column "complete" after "description":
ALTER TABLE tasks
ADD COLUMN complete DECIMAL(2,1) NULL
AFTER description;

-- Q: delete column "description":
ALTER TABLE tasks
DROP COLUMN description;

-- Q: rename table 'task' into 'work_items':
ALTER TABLE tasks
RENAME TO work_items;

-- Define PK of table t1 with ALTER TABLE:
ALTER TABLE t1
ADD PRIMARY KEY(id);

-- Q : add column 'vendor_id' to products:
ALTER TABLE products
ADD COLUMN vdr_id int not null AFTER cat_id;

-- Q : declare the FK on table products:
ALTER TABLE products
ADD FOREIGN KEY fk_vendor(vdr_id)
REFERENCES vendors(vdr_id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

-- Q : delete the FK 'fk_cat' of table products:
ALTER TABLE products
DROP FOREIGN KEY fk_cat;

-- Q : delete the FK 'fk_vendor' of table products:
ALTER TABLE products
DROP FOREIGN KEY fk_vendor;

-- Q: deactivate the FK check:
SET foreign_key_checks = 0;
-- Do not forget to set FK back to 1:
SET foreign_key_checks = 1;

-- Add a unicity constraint.
-- Add a constraint so that 'username' and 'email' are unique:
ALTER TABLE users
ADD UNIQUE INDEX username_unique (username ASC) ;

ALTER TABLE users
ADD UNIQUE INDEX  email_unique (email ASC) ;


-- 1st insertion to test constraints on table suppliers:
INSERT INTO suppliers(name, phone, address)
VALUES('ABC Inc', '408-908-2476','4000 North 1st Street, San Jose, CA, USA');

-- 2nd insertion with the same tel number:
INSERT INTO suppliers(name, phone, address)
VALUES('XYZ Corporation', '408-908-2476','4001 North 1st Street, San Jose, CA, USA');

-- Lets correct the problem:
INSERT INTO suppliers(name, phone, address)
VALUES('XYZ Corporation', '408-908-2567','400 North 1st Street, San Jose, CA, USA');

-- Test on the 2nd constraint : unique 'nom' and 'adresse': 
INSERT INTO suppliers(name, phone, address)
VALUES('XYZ Corporation', '408-908-102','400 North 1st Street, San Jose, CA, USA');


Q : delete an INDEX:
DROP INDEX uc_name_address ON suppliers;


-- Set a constraint with ALTER TABLE:
ALTER TABLE suppliers
ADD CONSTRAINT uc_name_address UNIQUE (name,address);

_______________________________________________________________________________________________
DATABASE CONSTRAINTS
_______________________________________________________________________________________________

ALTER TABLE tasks
CHANGE COLUMN task_id task_id INT(11) AUTO_INCREMENT;



_______________________________________________________________________________________________
DATA END
_______________________________________________________________________________________________