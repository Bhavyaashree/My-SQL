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
drop table customers;
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
