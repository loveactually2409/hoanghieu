SELECT * FROM EMPLOYEES


#CâuF
SELECT A.*, B.Plocation
FROM EMPLOYEES A
LEFT JOIN PROJECT B ON A.Fname = B.Plocation
WHERE Plocation IN ('Houston');


#CâuH
select * from employees
where  Salary = (SELECT MAX(Salary) from employees);

#Câui








