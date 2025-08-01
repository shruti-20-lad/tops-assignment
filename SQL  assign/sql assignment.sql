use shopping;

#1 
drop table if exists Contact;

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    ContactName VARCHAR(50),
    Title VARCHAR(50),
    CompanyID INT,
    Phone VARCHAR(20),
    Email VARCHAR(50)
);
#2
drop table if exists Employee;
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20)
);
#3
drop table if exists ContactEmployee;
CREATE TABLE ContactEmployee (
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    PRIMARY KEY (ContactID, EmployeeID),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
drop table if exists Company;
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Industry VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Phone VARCHAR(20),
    Website VARCHAR(100)
);

INSERT INTO Company (CompanyID, CompanyName, Industry, Address, City, State, ZipCode, Phone, Website) VALUES
(1, 'Toll Brothers', 'Construction', '100 Main St', 'Philadelphia', 'PA', '19103', '215-555-1000', 'www.tollbrothers.com'),
(2, 'Urban Outfitters, Inc.', 'Retail', '500 Fashion Ave', 'New York', 'NY', '10018', '212-555-2000', 'www.urbanoutfitters.com'),
(3, 'Apple Inc.', 'Technology', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '408-555-3000', 'www.apple.com'),
(4, 'Google LLC', 'Technology', '1600 Amphitheatre Pkwy', 'Mountain View', 'CA', '94043', '650-555-4000', 'www.google.com'),
(5, 'Amazon', 'E-commerce', '410 Terry Ave N', 'Seattle', 'WA', '98109', '206-555-5000', 'www.amazon.com'),
(6, 'Tesla', 'Automotive', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304', '650-555-6000', 'www.tesla.com'),
(7, 'Microsoft', 'Software', '1 Microsoft Way', 'Redmond', 'WA', '98052', '425-555-7000', 'www.microsoft.com'),
(8, 'Nike', 'Apparel', '1 Bowerman Dr', 'Beaverton', 'OR', '97005', '503-555-8000', 'www.nike.com');

INSERT INTO Contact (ContactID, ContactName, Title, CompanyID, Phone, Email) VALUES
(1, 'Dianne Connor', 'Manager', 1, '215-111-1111', 'dianne.connor@tollbrothers.com'),
(2, 'Rachel Adams', 'Director', 2, '212-222-2222', 'rachel.adams@urban.com'),
(3, 'Mark Stevens', 'VP Sales', 3, '408-333-3333', 'mark.stevens@apple.com'),
(4, 'Jennifer Lee', 'Marketing Head', 4, '650-444-4444', 'jennifer.lee@google.com'),
(5, 'Steven Clark', 'CTO', 5, '206-555-5555', 'steven.clark@amazon.com'),
(6, 'Natalie Gomez', 'Design Lead', 6, '650-666-6666', 'natalie.gomez@tesla.com'),
(7, 'Frank Moore', 'Product Manager', 7, '425-777-7777', 'frank.moore@microsoft.com'),
(8, 'Laura Hill', 'Brand Manager', 8, '503-888-8888', 'laura.hill@nike.com');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Title, Email, Phone) VALUES
(1, 'Jack', 'Lee', 'Sales Rep', 'jack.lee@marketco.com', '111-111-1111'),
(2, 'Lesley', 'Bland', 'Customer Service', 'lesley.bland@marketco.com', '215-555-8800'),
(3, 'Amy', 'Chen', 'Account Manager', 'amy.chen@marketco.com', '333-333-3333'),
(4, 'Brian', 'Wells', 'Tech Support', 'brian.wells@marketco.com', '444-444-4444'),
(5, 'Sophie', 'Turner', 'Sales Rep', 'sophie.turner@marketco.com', '555-555-5555'),
(6, 'Liam', 'Martin', 'Support Lead', 'liam.martin@marketco.com', '666-666-6666'),
(7, 'Emma', 'Jones', 'HR', 'emma.jones@marketco.com', '777-777-7777'),
(8, 'David', 'Clark', 'Sales Lead', 'david.clark@marketco.com', '888-888-8888');

 INSERT INTO ContactEmployee (ContactID, EmployeeID, ContactDate) VALUES
(1, 1, '2025-07-01'),
(2, 2, '2025-07-02'),
(3, 3, '2025-07-03'),
(4, 4, '2025-07-04'),
(5, 5, '2025-07-05'),
(6, 6, '2025-07-06'),
(7, 7, '2025-07-07'),
(1, 2, '2025-07-08');

select * from Contact;
select * from Company;
select * from Employee;
select * from ContactEmployee;

#4
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

select * from Employee;

#5
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

select * from Company;

#6
DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE ContactName = 'Dianne Connor')
  AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');
  
  select * from ContactEmployee;

#7
SELECT DISTINCT E.FirstName, E.LastName
FROM Employee E
JOIN ContactEmployee CE ON E.EmployeeID = CE.EmployeeID
JOIN Contact C ON C.ContactID = CE.ContactID
JOIN Company Co ON C.CompanyID = Co.CompanyID
WHERE Co.CompanyName = 'Toll Brothers';












