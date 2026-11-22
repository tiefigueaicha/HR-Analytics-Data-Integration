CREATE TABLE hr_employees_integrated (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department VARCHAR(100),
    email VARCHAR(150),
    absence_days INTEGER
);


SELECT *
FROM hr_employees_integrated;

SELECT COUNT(*) AS nombre_collaborateurs
FROM hr_employees_integrated;