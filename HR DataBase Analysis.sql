/* 1. Select From */
SELECT * FROM employees
LIMIT 10;

/* 2. ORDER BY */
SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC;

/* 3. DISTINCT */
SELECT DISTINCT first_name FROM employees
ORDER BY first_name;

/* 4. COUNT */
/* Find The Count Of Employees*/
SELECT COUNT(employee_id) FROM employees;

/* 5. WHERE */
/* Display Employee ID With Salary More Than 10000*/
SELECT employee_id, salary FROM employees
WHERE salary > 10000
ORDER BY employee_id ASC
LIMIT 20;

/* Display Employee ID With Salary More Than 15000*/
SELECT employee_id, salary FROM employees
WHERE salary > 15000
ORDER BY employee_id ASC
LIMIT 20;

/* Display Department ID Whose Department Name Sales */
SELECT department_id,  department_name FROM departments 
WHERE department_name = 'Sales';

/* 6. BETWEEN */
/* Display The Salary Between 1987-06-17 AND 1999-01-01 And Salary More Than 10000*/
SELECT * FROM employees
WHERE hire_date BETWEEN '1987-06-17' AND '1999-01-01'
AND salary > 10000;

/* 7. LIKE */
/* Display Employees Whose First Name Start With G, Or Last Name Start With F*/
SELECT * FROM employees 
WHERE first_name LIKE 'G%' OR last_name LIKE 'F%';

/* Display Employees Whose First Name Contain d, Last Name Contain t*/
SELECT * FROM employees 
WHERE first_name LIKE '%d%' AND last_name LIKE '%t%' ;

/* 8. ILIKE */
/* Display Employees Whose First Name Contain u Or U, Last Name Contain b Or B*/
SELECT * FROM employees 
WHERE first_name ILIKE '%u%' OR first_name ILIKE '%U%'
OR
last_name LIKE '%b%'  OR first_name ILIKE '%B%'
;

/* 9. NOT LIKE */
/* Display Employees Whose First Name Does Not Contain c, Last Name Does Not Contain m*/
SELECT * FROM employees 
WHERE first_name NOT LIKE '%c%' AND last_name NOT LIKE '%m%';

/* 10. AS */
SELECT employee_id, email AS mail
FROM employees;

/* 11. Aggregation */
/* Display Sum, Maximum, Minumum, And Average Of Salary*/
SELECT ROUND(SUM(salary)) AS sum_of_salary, ROUND(AVG(salary)) AS average_of_salary,
MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary
FROM employees;

/* Display Maximum And Minumum Of Salary For Each Position*/
SELECT job_title, max_salary, min_salary FROM jobs;

/* 12. SUBSTRING */
/* Display 3 Letter From First Name Start From Position 3*/
SELECT first_name, SUBSTRING(first_name FROM 3 FOR 3) FROM employees
LIMIT 20;

/* 13. EXTRACT */
/* Extarct Year From Date*/
SELECT EXTRACT(YEAR FROM TIMESTAMP '2016-12-31 13:30:15');

/* 14. TO_CHAR */
/* Convert BirthDate From Date To Text Type*/
SELECT first_name, last_name, hire_date,
TO_CHAR(hire_date, 'DD-MON-YYYY') AS hire
FROM employees
ORDER BY hire_date DESC;

/* 15. CASE */
/* Split The Salary Into 3 Categories*/
SELECT 
COUNT(CASE WHEN salary > 10000 THEN 'High Salary' END) AS high_salary,
COUNT(CASE WHEN salary <= 1000  OR  salary >= 5000  THEN  'Medium Salary' END) AS medium_salary,
COUNT(CASE WHEN salary < 5000 THEN 'Low Salary' END) AS low_salary
FROM employees


/* 16. REPLACE */
/* Cahnge Empoloyee Position From Human Resources  To HR */
SELECT department_name,
REPLACE (department_name, 'Human Resources', 'HR') AS department_name
FROM departments
WHERE department_name = 'Human Resources';

/* 17. INNER JOIN */
/* Disply The Department Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
;

/* Disply The Job Title Of Each Empoylee*/
SELECT first_name, last_name, salary, jobs.job_title FROM employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id
;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary, dependents.first_name, dependents.last_name, dependents.relationship  FROM employees
INNER JOIN dependents
ON employees.employee_id = dependents.employee_id;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary, dependents.first_name, dependents.last_name, dependents.relationship  FROM employees
INNER JOIN  dependents
ON employees.employee_id = dependents.employee_id;

/* 18. FULL OUTER JOIN */
/* Disply The Department Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id
;

/* Disply The Job Title Of Each Empoylee*/
SELECT first_name, last_name, salary, jobs.job_title FROM employees
FULL OUTER JOIN jobs
ON employees.job_id = jobs.job_id
;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary AS employees_salary, dependents.first_name AS dependents_first_name, dependents.last_name AS dependents_last_name, dependents.relationship AS dependents_realtionship  FROM employees
FULL OUTER JOIN dependents
ON employees.employee_id = dependents.employee_id;

/* 19. LEFT OUTER JOIN */
/* Disply The Department Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name FROM employees
LEFT OUTER JOIN departments
ON employees.department_id = departments.department_id
;
/* Disply The Job Title Of Each Empoylee*/
SELECT first_name, last_name, salary, jobs.job_title FROM employees
LEFT OUTER JOIN jobs
ON employees.job_id = jobs.job_id
;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary, dependents.first_name, dependents.last_name, dependents.relationship  FROM employees
LEFT OUTER JOIN dependents
ON employees.employee_id = dependents.employee_id;

/* 20. FULL OUTER JOIN */
/* Disply The Department Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id
;
/* Disply The Job Title Of Each Empoylee*/
SELECT first_name, last_name, salary, jobs.job_title FROM employees
FULL OUTER JOIN jobs
ON employees.job_id = jobs.job_id
;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary, dependents.first_name, dependents.last_name, dependents.relationship  FROM employees
FULL OUTER JOIN dependents
ON employees.employee_id = dependents.employee_id;

/* 21. RIGHT OUTER JOIN */
/* Disply The Department Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name FROM employees
RIGHT OUTER JOIN departments
ON employees.department_id = departments.department_id
;
/* Disply The Job Title Of Each Empoylee*/
SELECT first_name, last_name, salary, jobs.job_title FROM employees
RIGHT OUTER JOIN jobs
ON employees.job_id = jobs.job_id
;

/* Disply The Dependents Of Each Empoylee*/
SELECT employees.first_name AS employeee_first_name, employees.last_name AS employeee_last_name, employees.salary, dependents.first_name, dependents.last_name, dependents.relationship  FROM employees
RIGHT OUTER JOIN dependents
ON employees.employee_id = dependents.employee_id;

/* 22. Multiple INNER JOIN*/
/* Disply The Department  And Job Title Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name, jobs.job_title FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
INNER JOIN jobs
ON employees.job_id = jobs.job_id

/* Disply The Location Of Each Department*/
SELECT employees.first_name, employees.last_name, employees.salary,department_name, locations.city FROM departments
INNER JOIN employees
ON employees.department_id = departments.department_id
INNER JOIN locations
ON departments.location_id = locations.location_id

/* Disply The Country Of Each Department*/
SELECT countries.country_name, departments.department_name, city FROM locations
INNER JOIN countries
ON countries.country_id = locations.country_id
INNER JOIN departments
ON departments.location_id = locations.location_id

/* Disply The Region Of Each Country*/
SELECT country_name, locations.city, locations.street_address, regions.region_name FROM countries
INNER JOIN locations
ON countries.country_id = locations.country_id
INNER JOIN regions
ON regions.region_id = countries.region_id


/* 23. Multiple FULL OUTER JOIN*/
/* Disply The Department  And Job Title Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name, jobs.job_title FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id
FULL OUTER JOIN jobs
ON employees.job_id = jobs.job_id

/* Disply The Location Of Each Department*/
SELECT employees.first_name, employees.last_name, employees.hire_date, employees.salary,department_name, locations.street_address, locations.city FROM departments
FULL OUTER JOIN employees
ON employees.department_id = departments.department_id
FULL OUTER JOIN locations
ON departments.location_id = locations.location_id

/* Disply The Country Of Each Department*/
SELECT countries.country_name, departments.department_name, street_address, city FROM locations
FULL OUTER JOIN countries
ON countries.country_id = locations.country_id
FULL OUTER JOIN departments
ON departments.location_id = locations.location_id

/* Disply The Region Of Each Country*/
SELECT country_name, locations.city, locations.street_address, regions.region_name FROM countries
FULL OUTER JOIN locations
ON countries.country_id = locations.country_id
FULL OUTER JOIN regions
ON regions.region_id = countries.region_id

/* 24. Multiple RIGHT OUTER JOIN*/
/* Disply The Department  And Job Title Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name, jobs.job_title FROM employees
RIGHT OUTER JOIN departments
ON employees.department_id = departments.department_id
RIGHT OUTER JOIN jobs
ON employees.job_id = jobs.job_id

/* Disply The Location Of Each Department*/
SELECT employees.first_name, employees.last_name, employees.hire_date, employees.salary,department_name, locations.street_address, locations.city FROM departments
RIGHT OUTER JOIN employees
ON employees.department_id = departments.department_id
RIGHT OUTER JOIN locations
ON departments.location_id = locations.location_id

/* Disply The Country Of Each Department*/
SELECT countries.country_name, departments.department_name, street_address, city FROM locations
RIGHT OUTER JOIN countries
ON countries.country_id = locations.country_id
RIGHT OUTER JOIN departments
ON departments.location_id = locations.location_id

/* Disply The Region Of Each Country*/
SELECT country_name, locations.city, locations.street_address, regions.region_name FROM countries
RIGHT OUTER JOIN locations
ON countries.country_id = locations.country_id
RIGHT OUTER JOIN regions
ON regions.region_id = countries.region_id
employees.emp_no = titles.emp_no;

/* 25. Multiple LEFT OUTER JOIN*/
/* Disply The Department  And Job Title Of Each Empoylee*/
SELECT first_name, last_name, hire_date, salary, departments.department_name, jobs.job_title FROM employees
LEFT OUTER JOIN departments
ON employees.department_id = departments.department_id
LEFT OUTER JOIN jobs
ON employees.job_id = jobs.job_id

/* Disply The Location Of Each Department*/
SELECT employees.first_name, employees.last_name, employees.hire_date, employees.salary,department_name, locations.street_address, locations.city FROM departments
LEFT OUTER JOIN employees
ON employees.department_id = departments.department_id
LEFT OUTER JOIN locations
ON departments.location_id = locations.location_id

/* Disply The Country Of Each Department*/
SELECT countries.country_name, departments.department_name, street_address, city FROM locations
LEFT OUTER JOIN countries
ON countries.country_id = locations.country_id
LEFT OUTER JOIN departments
ON departments.location_id = locations.location_id

/* Disply The Region Of Each Country*/
SELECT country_name, locations.city, locations.street_address, regions.region_name FROM countries
LEFT OUTER JOIN locations
ON countries.country_id = locations.country_id
LEFT OUTER JOIN regions
ON regions.region_id = countries.region_id
employees.emp_no = titles.emp_no;

/* 26. SUBQUERIES */
/* Disply The Employees Whose Thier Salary More Than Average Salary And Thier Position And Thier Department*/
SELECT first_name, last_name, salary, jobs.job_title, departments.department_name FROM employees
INNER JOIN jobs 
ON employees.job_id = jobs.job_id
INNER JOIN departments
ON departments.department_id = employees.department_id
WHERE salary > (SELECT AVG(salary) FROM employees);

/* 27.Correlated Subqueries*/
/* Disply The Employees Whose Thier Salary More Than Average Salary And Thier Position And Thier Department Whose Thier Hire After 01-01-1995*/
SELECT first_name, last_name, salary, jobs.job_title, departments.department_name FROM employees
INNER JOIN jobs 
ON employees.job_id = jobs.job_id
INNER JOIN departments
ON departments.department_id = employees.department_id
WHERE salary > (SELECT AVG(salary) FROM employees WHERE hire_date > '1995-01-01');

/* 28.View*/
CREATE VIEW salaries_less_than_average
AS
SELECT employees.first_name AS employee_first_name, employees.last_name AS employee_last_name, employees.salary, jobs.job_title, departments.department_name, dependents.first_name AS dependents_fisrt_name, dependents.last_name AS dependents_last_name FROM employees
INNER JOIN jobs 
ON employees.job_id = jobs.job_id
INNER JOIN departments
ON departments.department_id = employees.department_id
INNER JOIN dependents
ON dependents.employee_id = employees.employee_id
WHERE salary > (SELECT AVG(salary) FROM employees);
;
SELECT * FROM salaries_less_than_average;

/* 29.GROUP BY*/
/* Find Total Salary Of Each Department*/
SELECT ROUND(SUM(salary)) AS sum_of_salary, departments.department_name FROM employees
INNER JOIN departments
ON departments.department_id = employees.department_id
GROUP BY departments.department_name
ORDER BY sum_of_salary DESC;

/* Find Total Salary Of Each Position*/
SELECT ROUND(SUM(salary)) AS sum_of_salary, jobs.job_title FROM employees
INNER JOIN jobs
ON jobs.job_id = employees.job_id
GROUP BY jobs.job_title
ORDER BY sum_of_salary DESC;


/* Find Average Salary OF Each Department*/
SELECT ROUND(AVG(salary)) AS average_of_salary, departments.department_name FROM employees
INNER JOIN departments
ON departments.department_id = employees.department_id
GROUP BY departments.department_name
ORDER BY sum_of_salary DESC;

/* Find Average Salary OF Each Position*/
SELECT  jobs.job_title, ROUND(AVG(salary)) AS average_of_salary FROM employees
INNER JOIN jobs
ON jobs.job_id = employees.job_id
GROUP BY jobs.job_title
ORDER BY average_of_salary DESC;

/* 30.CONCAT*/
/* Merge First Name And Last Into One Column*/
SELECT CONCAT (first_name, ' ', last_name) AS employe_full_name FROM employees;
