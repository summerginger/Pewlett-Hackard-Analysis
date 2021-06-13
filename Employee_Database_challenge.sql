-- Deliverable 1 The Number of Retiring Employees by Title

-- 1.1
SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM  employees AS e
INNER JOIN titles AS t
ON (e.emp_no = CAST(t.emp_no AS INT))
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no DESC;

SELECT * FROM retirement_titles

-- 1.2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
		first_name, 
		last_name, 
		title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- 1.3
SELECT COUNT (emp_no) emp_no, 
			title
INTO retiring_titles 
FROM unique_titles 
GROUP BY title
ORDER BY emp_no DESC;

-- Deliverable 2 The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no)e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title

-- INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE de.to_date IN ('9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;
