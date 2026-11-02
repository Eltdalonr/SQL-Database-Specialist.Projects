**1. Departamento com maior número de pessoas**

SELECT D.Dname, COUNT(E.Ssn) AS Total_Funcionarios
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E USE INDEX (idx_employee_dno)
    ON D.Dnumber = E.Dno
GROUP BY D.Dnumber, D.Dname
ORDER BY Total_Funcionarios DESC
LIMIT 1;


**2. Departamentos por cidade**

SELECT D.Dname, DL.Dlocation AS Cidade
FROM DEPARTMENT D
INNER JOIN DEPT_LOCATIONS DL USE INDEX (idx_dept_locations_dnumber)
    ON D.Dnumber = DL.Dnumber
ORDER BY DL.Dlocation;


**3. Empregados por departamento**

SELECT D.Dname, E.Ssn, E.Fname, E.Minit, E.Lname, E.Salary
FROM EMPLOYEE E USE INDEX (idx_employee_dno)
INNER JOIN DEPARTMENT D ON E.Dno = D.Dnumber
ORDER BY D.Dname, E.Fname;


### Índices criados

CREATE INDEX idx_employee_dno ON EMPLOYEE(Dno);
CREATE INDEX idx_dept_locations_dnumber ON DEPT_LOCATIONS(Dnumber);
