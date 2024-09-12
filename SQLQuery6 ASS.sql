USE AdventureWorks


CREATE SCHEMA Work


CREATE TABLE Work.Employee (
    Empid INT, 
    Ename VARCHAR(10), 
    Eproject VARCHAR(15)
)

CREATE SCHEMA Student


CREATE TABLE Student.StudentDetail (
    Srollno INT, 
    Sname VARCHAR(15), 
    Class VARCHAR(10)
)

CREATE TABLE Student.StudentRecords (
    Srollno INT, 
    Sname VARCHAR(15), 
    Smarks INT
)



INSERT INTO Work.Employee (Empid, Ename, Eproject) VALUES
(1, 'Tom', 'Database'),
(2, 'Steve', 'Java'),
(3, 'John', '.net'),
(4, 'Micheal', 'Database');


INSERT INTO Student.StudentDetail (Srollno, Sname, Class) VALUES
(1, 'Tom', 'VIII'),
(2, 'Steve', 'IX'),
(3, 'Micheal', 'VIII'),
(4, 'Stella', 'IX'),
(5, 'Sherlin', 'VII');


INSERT INTO Student.StudentRecords (Srollno, Sname, Smarks) VALUES
(1, 'Tom', 39),
(2, 'Steve', 48),
(3, 'Micheal', 48),
(4, 'Stella', 50),
(5, 'Sherlin', 42);