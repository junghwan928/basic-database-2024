SELECT FIRST_NAME +' ' + LAST_NAME AS 'name', employee_id, hire_date FROM employees
where hire_date BETWEEN '2006-05-20' AND '2007-05-20'
ORDER by hire_date ASC;

