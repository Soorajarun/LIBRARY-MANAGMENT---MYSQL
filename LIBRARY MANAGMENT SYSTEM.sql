create database Library;
use Library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
insert into Branch values('100', '1', '2nd street bepore road', '229870');
insert into Branch values('101', '2', '1st street mh alnas road', '255870');
insert into Branch values('102', '3', '2nd street hilite road', '244870');
insert into Branch values('103', '4', '32 street bypass road', '212870');
insert into Branch values('104', '5', '22 street kannur road', '200870');
insert into Branch values('105', '6', '123 street nadakav area', '299870');
insert into Branch values('106', '7', ' east hill street west hill road', '288870');
insert into Branch values('107', '8', '2nd street kunduparamb', '277870');
insert into Branch values('108', '9', '45 street karaparamb', '266870');
insert into Branch values('109', '10', ' 34 street ballussery road', '245870');

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
insert into Employee values('000', 'Arundhathi', 'Manager', '35000','100');
insert into Employee values('001', 'Sooraj', 'Assistant Manager', '35000','101');
insert into Employee values('002', 'Arun', 'Manager', '40000','102');
insert into Employee values('003', 'Sarath', 'Manager', '36000','103');
insert into Employee values('004', 'Shan', 'Manager', '25000','104');
insert into Employee values('005', 'Bijin', 'Assistant Manager', '25000','105');
insert into Employee values('006', 'Amal', 'Manager', '30000','106');
insert into Employee values('007', 'Nipun', 'Manager', '38000','107');
insert into Employee values('008', 'Visamaya', 'Manager', '40000','108');
insert into Employee values('009', 'Sangeeth', 'Manager', '35000','109');

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(6, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
insert into Books values('998877', 'Road Rage', 'Travel', '40','Yes','Athmaja','Soorya');
insert into Books values('889966', 'Game Of Thrones', 'Fantasy', '30','Yes','Adhithya','Pheonix');
insert into Books values('887755', 'Naruto','Manga','60','Yes','Toji','Tommy');
insert into Books values('008899', 'Demon slayer','Manga', '25','No','Kaiju','Toriyama');
insert into Books values('113344', 'Jujutsu Kaisen', 'Sci-Fi', '50','No','Shameer','Jose');
insert into Books values('225588', 'Kaiju', 'Sci-Fi', '25','Yes','Jake','Kabeer');
insert into Books values('223344', 'Harry Potter', 'Fantsy', '45','No','Sunaina','Kim');
insert into Books values('110099', 'Wind Breaker', 'Documentry', '30','Yes','Kene','JP');
insert into Books values('001177', 'Marshel','Horror','30','Yes','Hugh','Lotus');
insert into Books values('770044', 'The untold story', 'Biopic', '35','No','David','Gus');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
insert into Customer values('201', 'Pranav','3rd street palakad','22-01-22');
insert into Customer values('202', 'Rishi','2nd street madhinath alnas road','25-09-23');
insert into Customer values('203', 'Anagha','24 street westhill road','24-10-23');
insert into Customer values('205', 'Swetha','33 street Kozhikode','20-12-22');
insert into Customer values('206', 'Kakashi','120 street St.jospeh area','29-07-24');
insert into Customer values('207', 'Itachi','35 street hill road','28-09-20');
insert into Customer values('208', 'Sasuke','9th street','27-08-22');
insert into Customer values('209', 'Itadori','40 street','26-07-24');
insert into Customer values('210', 'Gojo','43 street Palakad road','10-07-24');

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

insert into IssueStatus values('50', '201', 'Naruto', '10-01-24','887755');
insert into IssueStatus values('51', '202', 'Road Rage', '11-03-24','998877');
insert into IssueStatus values('52', '203', 'Game Of Thrones', '08-02-24','889966');
insert into IssueStatus values('53', '205', 'Jujutsu Kaisen', '07-10-23','113344');
insert into IssueStatus values('54', '206', 'The untold story', '12-02-24','770044');
insert into IssueStatus values('55', '207', 'Harry Potter', '25-01-24','223344');
insert into IssueStatus values('56', '208', 'Wind Breker', '30-02-24','110099');
insert into IssueStatus values('57', '209', 'Marshel','10-04-24','001177');
insert into IssueStatus values('58', '210', 'Demon Slayer', '04-07-24','008899');

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
insert into ReturnStatus values('60', '201', 'Naruto', '10-04-24','887755');
insert into ReturnStatus values('61', '202', 'Road Rage', '30-03-24','998877');
insert into ReturnStatus values('62', '203', 'Game Of Thrones', '08-04-24','889966');
insert into ReturnStatus values('63', '205', 'Jujutsu Kaisen', '07-01-24','113344');
insert into ReturnStatus values('64', '206', 'The untold story', '12-04-24','770044');
insert into ReturnStatus values('65', '207', 'Harry Potter', '25-03-24','223344');
insert into ReturnStatus values('66', '208', 'Wind Breker', '30-04-24','110099');
insert into ReturnStatus values('67', '209', 'Marshel','31-04-24','001177');
insert into ReturnStatus values('68', '210', 'Demon Slayer', '30-07-24','008899');

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

SELECT Book_title, Customer_name FROM Books JOIN IssueStatus iss ON ISBN = iss.Isbn_book
JOIN Customer ON iss.Issued_cust = Customer_Id;

SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

SELECT DISTINCT Customer_name FROM Customer JOIN IssueStatus iss ON Customer_Id = iss.Issued_cust WHERE MONTH(iss.Issue_date) = 6 AND YEAR(iss.Issue_date) = 2023;

SELECT book_title FROM Books WHERE Category LIKE 'history';
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

SELECT Emp_name AS Manager_Name, Branch_address FROM Employee JOIN Branch ON Emp_Id = Manager_Id;
SELECT DISTINCT Customer_name
FROM Customer JOIN IssueStatus ON Customer_Id = Issued_cust JOIN Books ON Isbn_book = ISBN WHERE Rental_Price > 25;