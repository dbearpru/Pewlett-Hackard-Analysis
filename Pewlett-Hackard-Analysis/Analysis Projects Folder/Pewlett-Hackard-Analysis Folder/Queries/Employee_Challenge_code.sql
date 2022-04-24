SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date

INTO retirees_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;



select distinct on (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

into unique_titles
from retirees_titles as rt
order by emp_no, to_date DESC;

Select Count(ut.emp_no),ut.title
into retiring_titles
from unique_titles as ut
group by title
order by Count(title) Desc;

Select Distinct on (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
Into mentorship_table
From employees as e
	Inner Join dept_emp as de
	 	on (e.emp_no = de.emp_no)
			Inner Join titles as t
				on (e.emp_no = t.emp_no)
Where (e.birth_date Between '1962-01-01' and '1965-12-31')
and (de.to_date = '9999-01-01')
order by emp_no;
