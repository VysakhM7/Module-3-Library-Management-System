-- Step 1: Create the database
CREATE DATABASE library;
USE library;

-- Step 2: Create the tables
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), -- 'Yes' or 'No'
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Step 3: Insert sample data
-- Branches
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'Trivandrum Central Library, MG Road', '0471-2334567'),
(2, 102, 'Kochi Public Library, Marine Drive', '0484-2387654'),
(3, 103, 'Kozhikode City Library, SM Street', '0495-2723456');

-- Employees
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'Arjun Nair', 'Manager', 75000, 1),
(102, 'Lakshmi Menon', 'Manager', 68000, 2),
(103, 'Ravi Kumar', 'Manager', 62000, 3),
(104, 'Meera Das', 'Assistant', 45000, 1),
(105, 'Rajesh Varma', 'Assistant', 47000, 2);

-- Books
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(1111, 'The God of Small Things', 'Fiction', 30.00, 'Yes', 'Arundhati Roy', 'IndiaInk'),
(2222, 'Wings of Fire', 'Biography', 25.00, 'Yes', 'APJ Abdul Kalam', 'Universities Press'),
(3333, 'India After Gandhi', 'History', 35.00, 'No', 'Ramachandra Guha', 'HarperCollins'),
(4444, 'Ignited Minds', 'Motivational', 20.00, 'Yes', 'APJ Abdul Kalam', 'Penguin Books'),
(5555, 'Sapiens: A Brief History of Humankind', 'History', 40.00, 'Yes', 'Yuval Noah Harari', 'Harvill Secker'),
(6666, 'Educated', 'Biography', 32.50, 'Yes', 'Tara Westover', 'Random House'),
(7777, 'Becoming', 'Biography', 28.00, 'No', 'Michelle Obama', 'Crown Publishing'),
(8888, '1984', 'Fiction', 15.00, 'Yes', 'George Orwell', 'Secker & Warburg'),
(9999, 'The Alchemist', 'Fiction', 20.00, 'Yes', 'Paulo Coelho', 'HarperCollins'),
(10000, 'Thinking, Fast and Slow', 'Psychology', 35.00, 'Yes', 'Daniel Kahneman', 'Farrar, Straus and Giroux'),
(10001, 'The Power of Habit', 'Self-Help', 25.00, 'No', 'Charles Duhigg', 'Random House'),
(10002, 'Atomic Habits', 'Self-Help', 30.00, 'Yes', 'James Clear', 'Avery'),
(10003, 'The Catcher in the Rye', 'Fiction', 18.00, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
(10004, 'Pride and Prejudice', 'Fiction', 22.00, 'No', 'Jane Austen', 'T. Egerton'),
(10005, 'To Kill a Mockingbird', 'Fiction', 25.00, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(10006, 'Moby Dick', 'Fiction', 28.00, 'Yes', 'Herman Melville', 'Harper & Brothers'),
(10007, 'War and Peace', 'History', 50.00, 'No', 'Leo Tolstoy', 'The Russian Messenger'),
(10008, 'Crime and Punishment', 'Fiction', 33.00, 'Yes', 'Fyodor Dostoevsky', 'The Russian Messenger'),
(10009, 'A Brief History of Time', 'Science', 40.00, 'Yes', 'Stephen Hawking', 'Bantam Books'),
(10010, 'The Selfish Gene', 'Science', 35.00, 'No', 'Richard Dawkins', 'Oxford University Press'),
(10011, 'Silent Spring', 'Environment', 30.00, 'Yes', 'Rachel Carson', 'Houghton Mifflin'),
(10012, 'Guns, Germs, and Steel', 'History', 38.00, 'Yes', 'Jared Diamond', 'W.W. Norton & Company'),
(10013, 'The Origin of Species', 'Science', 45.00, 'No', 'Charles Darwin', 'John Murray'),
(10014, 'Man Search for Meaning', 'Psychology', 25.00, 'Yes', 'Viktor E. Frankl', 'Beacon Press'),
(10015, 'The Road Less Traveled', 'Self-Help', 27.00, 'Yes', 'M. Scott Peck', 'Simon & Schuster'),
(10016, 'Meditations', 'Philosophy', 18.00, 'Yes', 'Marcus Aurelius', 'Penguin Classics'),
(10017, 'The Art of War', 'Philosophy', 20.00, 'Yes', 'Sun Tzu', 'Oxford University Press'),
(10018, 'Rich Dad Poor Dad', 'Finance', 30.00, 'No', 'Robert T. Kiyosaki', 'Warner Books'),
(10019, 'The Intelligent Investor', 'Finance', 45.00, 'Yes', 'Benjamin Graham', 'Harper Business'),
(10020, 'The Great Gatsby', 'Fiction', 15.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
(10021, 'The Kite Runner', 'Fiction', 22.00, 'Yes', 'Khaled Hosseini', 'Riverhead Books'),
(10022, 'Harry Potter and the Sorcerers Stone', 'Fiction', 35.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10023, 'Harry Potter and the Chamber of Secrets', 'Fiction', 35.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10024, 'Harry Potter and the Prisoner of Azkaban', 'Fiction', 35.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10025, 'Harry Potter and the Goblet of Fire', 'Fiction', 40.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10026, 'Harry Potter and the Order of the Phoenix', 'Fiction', 42.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10027, 'Harry Potter and the Half-Blood Prince', 'Fiction', 42.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(10028, 'Harry Potter and the Deathly Hallows', 'Fiction', 45.00, 'Yes', 'J.K. Rowling', 'Bloomsbury');

-- Customers
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(201, 'Anjali Pillai', '25, Green Garden, Trivandrum', '2021-05-12'),
(202, 'Kiran Mohan', '45, Hill View, Kochi', '2022-01-20'),
(203, 'Sneha Thomas', '18, Beach Road, Kozhikode', '2020-10-18'),
(204, 'Ramesh Iyer', '50, Lakeside, Alappuzha', '2023-03-15'),
(205, 'Divya Nair', '22, Sunrise Apartments, Thrissur', '2021-09-08'),
(206, 'Nitin George', '10, Maple Street, Kollam', '2022-06-19'),
(207, 'Priya Menon', '35, Jasmine Gardens, Kannur', '2020-11-24'),
(208, 'Vivek Das', '78, Coral Heights, Ernakulam', '2023-02-10'),
(209, 'Megha R.', '12, Horizon Villa, Pathanamthitta', '2021-07-25');

-- IssueStatus
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(301, 201, 'The God of Small Things', '2023-06-08', 1111),
(302, 202, 'Wings of Fire', '2023-06-15', 2222),
(303, 203, 'To Kill a Mockingbird', '2023-06-20', 3333),
(304, 204, '1984', '2023-07-01', 4444),
(305, 205, 'Pride and Prejudice', '2023-07-10', 5555);

-- ReturnStatus
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(401, 201, 'The God of Small Things', '2023-06-25', 1111),
(402, 202, 'Wings of Fire', '2023-06-30', 2222),
(403, 203, 'To Kill a Mockingbird', '2023-07-05', 3333),
(404, 204, '1984', '2023-07-12', 4444),
(405, 205, 'Pride and Prejudice', '2023-07-15', 5555),
(406, 206, 'The Catcher in the Rye', '2023-07-20', 6666);


-- Step 4: Queries
-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books
WHERE Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books 
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position 
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name 
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer.Customer_name 
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title 
FROM Books
WHERE Category LIKE '%History%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Employee.Emp_name, Branch.Branch_address 
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;