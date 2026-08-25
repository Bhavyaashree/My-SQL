SHOW DATABASES;
create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
-- drop table customers;
show table status;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
create database BankingDB;
use BankingDB;
show table status;
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);
CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

show tables;
use bankingdb;
ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);
ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD branchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_branch1
FOREIGN KEY (branchID)
REFERENCES branches(branchID);

desc branches;

alter table branches
add primary key (branchid);


describe accounts;
ALTER TABLE Accounts
ADD CustomerID INT;
alter table transactions
add accountid int;

alter table accounts
add constraint pk_accounts
primary key(accountid);

alter table transactions
add constraint pk_transactions
primary key(transactionid);

alter table transactions
add constraint fk_transactions_accounts
foreign key(accountid)
references accounts(accountid);

ALTER TABLE loans
ADD CustomerID INT;

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

alter table loans
add constraint fk_loans_customers
foreign key (customerid)
references customers(customerid);

desc loans;

alter table loans
add constraint pk_loans
primary key(loanid);

select * from customers;
desc customers;

alter table customers add column pan varchar(20);
alter table customers add column pan varchar(20) first;
alter table customers add column pan varchar(20) after email;
alter table customers modify column pan varchar(50);

alter table customers drop column pan;

INSERT INTO Customers
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','2006-05-15','1998-04-15');

INSERT INTO Customers
VALUES
(102,'Bhavyaa','Shree','bhavyaa@gmail.com','7598474217','2026-11-18','2002-07-15');


insert into accounts
(accountid, customerid, accounttype, balance)
values
(201,101,'Savings',25000);

select * from accounts;

insert into accounts
(accountid, customerid, accounttype, balance)
values
(202,102,'current',10000);

INSERT INTO Customers(customerid,email,phone)
values(103,'hi@gmail.com',1234567891),(104,'hello@gmail.com',0987654321);

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;

select * from customers;

delete from customers where customerid >101;

alter table customers drop accountcreationdate;

insert into customers values
(102,'priya','patil','priy.patil@gmail.com',9988776655,'2000-09-20'),
(103,'amit','patel','amit.patel@gmail.com',9876500001,'1995-06-18'),
(104,'sneha','joseh','sneha.joseh@gmail.com',9876500002,'1997-09-12'),
(105,'rohan','kulkani','rohan.kulkani@gmail.com',9876500003,'1993-11-25');

desc accounts;

insert into accounts
(accountid,customerid,accounttype,balance)
values
(202,102,'current',40000),
(203,103,'savings',35000),
(204,104,'current',60000),
(205,105,'savings',45000);

alter table accounts
change column balance
Balance varchar(20);

select * from accounts;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

select * from customers where customerid in (101,102,103);

use bankingdb;

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

-- --activity 
select * from accounts;

SELECT *
FROM Accounts
WHERE Balance > 15000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 1000 AND 10000;

SELECT *
FROM Customers
WHERE CustomerID IN (104,105);

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

use bankingdb;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

select * from transactions;

insert into transactions values 
(301,'2025-05-10',5000,'Deposit',201),
(303,'2025-05-12',10000,'Deposit',203),
(304,'2025-05-13',3000,'Withdraw',204),
(305,'2025-05-14',7000,'Deposit',205);

-- searching query

SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

-- Retrieve Records for Selected Account Types
SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Salary');

-- Retrieve Transactions for Selected Transaction Types
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Payment');

-- Retrieve Records for Selected Customers
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

SELECT *
FROM Customers
WHERE CustomerID  NOT IN (101,102,105);

use bankingdb;

-- Display Customers in Ascending Order of Last Name
SELECT *
FROM Customers
ORDER BY LastName ASC;

-- Display Accounts with Highest Balance First
SELECT *
FROM Accounts
ORDER BY Balance DESC;

-- Display Transactions Sorted by Transaction Date
SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

-- Display Only Top 5 Highest Balance Accounts
SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

-- Display First 3 Customer Records
SELECT *
FROM Customers
LIMIT 3;

-- Skip Initial Transaction Records While Viewing Data
SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

-- Display Savings Account Customers Sorted by Balance
SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

-- Search Customers Using Partial Name and Limit Results
SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

-- Display Selected Transactions in Sorted Order
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;     