SELECT
	count(id),
	sum(loan_amount),
	sum(total_payment),
	avg(int_rate) * 100,
	avg(dti) * 100
FROM [Bank Data];


SELECT
	count(id),
	sum(loan_amount),
	sum(total_payment),
	avg(int_rate) * 100,
	avg(dti) * 100
FROM [Bank Data]
WHERE month(issue_date) = (select max(month(issue_date)) from [Bank Data]);


SELECT
((SELECT cast(sum(total_payment) as decimal(10,2))
FROM [Bank Data]
WHERE month(issue_date) = (select max(month(issue_date)) from [Bank Data]))
-
(SELECT cast(sum(total_payment) as decimal(10,2))
FROM [Bank Data]
WHERE month(issue_date) = (select max(month(issue_date) - 1) from [Bank Data])))
/
(SELECT cast(sum(total_payment) as decimal(10,2))
FROM [Bank Data]
WHERE month(issue_date) = (select max(month(issue_date) - 1) from [Bank Data])) * 100 as MoM;


SELECT
	count(id),
	sum(loan_amount),
	sum(total_payment)
FROM [Bank Data]
WHERE loan_status in ('Fully Paid','Current');


SELECT
	count(id),
	sum(loan_amount),
	sum(total_payment)
FROM [Bank Data]
WHERE loan_status = 'Charged Off';


SELECT
(SELECT
	cast(count(id) as decimal(10,2))
FROM [Bank Data]
WHERE loan_status in ('Fully Paid','Current'))
/ (select cast(count(id) as decimal(10,2)) from [Bank Data]) * 100;


SELECT
(SELECT
	cast(count(id) as decimal(10,2))
FROM [Bank Data]
WHERE loan_status = 'Charged Off')
/ (select cast(count(id) as decimal(10,2)) from [Bank Data]) * 100;


SELECT
	loan_status,
	count(id),
	sum(loan_amount),
	sum(total_payment),
	avg(int_rate) * 100,
	avg(dti) * 100
FROM [Bank Data]
GROUP BY loan_status;


SELECT
	loan_status,
	sum(loan_amount),
	sum(total_payment)
FROM [Bank Data]
WHERE month(issue_date) = (select max(month(issue_date)) from [Bank Data])
GROUP BY loan_status;


SELECT
	datename(month,issue_date),
	count(id)
FROM [Bank Data]
GROUP BY month(issue_date), datename(month,issue_date)
ORDER BY month(issue_date);


SELECT
	home_ownership,
	count(id)
FROM [Bank Data]
GROUP BY home_ownership
ORDER BY home_ownership;