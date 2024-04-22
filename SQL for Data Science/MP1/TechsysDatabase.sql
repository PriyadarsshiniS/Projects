CREATE DATABASE TECHSYS_DB;
SHOW DATABASES;

USE TECHSYS_DB;

# PART 1: Data Definition Language (DDL) Statements
# Create the Products table with the specified fields.
CREATE TABLE PRODUCTS_TABLE
(PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(20) NOT NULL,
PRODUCT_DESCRIPTION VARCHAR(100),
PRODUCT_PRICE DECIMAL(10,2) NOT NULL,
PRIMARY KEY(PRODUCT_ID));

# Create the Customers table with the specified fields.
CREATE TABLE CUSTOMERS_TABLE
(CUSTOMER_ID INT,
CUSTOMER_NAME VARCHAR(30) NOT NULL,
CUSTOMER_EMAIL VARCHAR(50),
CUSTOMER_PHONE VARCHAR(10) NOT NULL,
PRIMARY KEY(CUSTOMER_ID));

# Create the Sales table with the specified fields.
CREATE TABLE SALES_TABLE
(SALE_ID INT,
PRODUCT_ID INT,
CUSTOMER_ID INT,
SALE_DATE DATETIME NOT NULL,
PRIMARY KEY(SALE_ID),
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS_TABLE(PRODUCT_ID),
FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMERS_TABLE(CUSTOMER_ID)) ;

# PART 2: Data Manipulation Language (DML) Statements
# Insert at least five records into the Products table.
INSERT INTO PRODUCTS_TABLE VALUES('10001','Performance plus','Performance monitoring tool for websites.','12000'),
('10002','Rippling','System to maintain Payroll, Benefits, HR & IT.','20000'),
('10003','Smartsheet','Work management platform to manage projects & automate processes.','15000'),
('10004','Gong','Revenue Intelligence Platform - captures & understands every customer interaction.','13000'),
('10005','Attentive','Mobile messaging platform - helps retailers to acquire, retain & interact with mobile shoppers.','16000'); 

# Insert at least ten records into the Customers table.
INSERT INTO CUSTOMERS_TABLE VALUES('50001','Julia Nayer','JNAYER@ABC.COM', '6501241214'),
                                  ('60202','Kevin Mourgos','KMOURGOS@DSN.COM','6501235234'),
                                  ('70943','Steven Markle','SMARKLE@ABC.COM','6501241434'),
                                  ('80104','James Marlow','','6501247234'),
                                  ('90005','Laura Bissot','LBISSOT@ABC.COM','6501245234'),
                                  ('11236','Jason Mallin','JMALLIN@ABC.COM','6501271934'),
                                  ('23527','Michael Rogers','MROGERS@DSN.COM','6501271834'),
                                  ('30528','KenNeth Gee','KENNYGEE@ABC.COM','6501271734'),
                                  ('23339','James Landry','JLANDRY@DSN.COM','6501241334'),
                                  ('23510','Hazel Philtanker','','6501271634');

# Insert at least five records into the Sales table.
INSERT INTO SALES_TABLE VALUES('23010001','10001','50001','2021-09-22 10:30:58'),
                              ('21310005','10005','90005','2021-11-21 13:40:00'),
                              ('31810003','10003','80104','2022-10-17 15:39:18'),
                              ('47010004','10004','60202','2023-04-29 20:25:20'),
                              ('32010002','10002','23339','2023-01-19 14:45:40');

# Update the price of one product in the Products table.
UPDATE PRODUCTS_TABLE SET PRODUCT_PRICE = 18000 WHERE PRODUCT_ID = '10001';

# Delete one customer record from the Customers table.
DELETE FROM SALES_TABLE WHERE CUSTOMER_ID='60202';
DELETE FROM CUSTOMERS_TABLE WHERE CUSTOMER_ID='60202';
# INFERENCE: CUSTOMER_ID='60202' is a foreign key to SALES_TABLE. Hence removing it first from SALES_TABLE and then CUSTOMERS_TABLE.

# Delete one sale record from the Sales table.
# Lets delete sales_id='23010001'
DELETE FROM SALES_TABLE WHERE SALE_ID='23010001';


# PART 3: Querying the Database
# Write a SELECT statement to retrieve all records from the Products table.
SELECT * FROM PRODUCTS_TABLE;

# Write a SELECT statement to retrieve all records from the Customers table.
SELECT * FROM CUSTOMERS_TABLE;

# Write a SELECT statement to retrieve all records from the Sales table.
SELECT * FROM SALES_TABLE;

# Write a SELECT statement to retrieve the name and price of a specific product from the Products table.
# COMMENT: Lets select name and price of product_id='10001'
SELECT PRODUCT_NAME,PRODUCT_PRICE FROM PRODUCTS_TABLE WHERE PRODUCT_ID=10001;

# Write a SELECT statement to retrieve the name and email of a specific customer from the Customers table.
# COMMENT: Lets select name and email of customer_id '50001'
SELECT CUSTOMER_NAME,CUSTOMER_EMAIL FROM CUSTOMERS_TABLE WHERE CUSTOMER_ID=50001;

# Write a SELECT statement to retrieve the product name, customer name, and sale date for all sales
SELECT A.PRODUCT_NAME, B.CUSTOMER_NAME, C.SALE_DATE
FROM PRODUCTS_TABLE AS A,CUSTOMERS_TABLE AS B, SALES_TABLE AS C
WHERE A.PRODUCT_ID = C.PRODUCT_ID
AND B.CUSTOMER_ID = C.CUSTOMER_ID;
# COMMENT: We have used a 'Simple Join' to  map product_id between PRODUCTS_TABLE & SALES_TABLE and customer_id between CUSTOMERS_TABLE & SALES_TABLE.
