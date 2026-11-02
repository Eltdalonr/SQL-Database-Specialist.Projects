# Projeto SQL: Índices (Company) e Procedures (E-commerce)

Desafio de banco de dados com duas partes: **otimização de consultas com índices** no schema `Company` e **procedure CRUD** com variável de controle no schema `ecommerce`. Serve como referência para quem estuda índices e procedures em MySQL.

## Parte 1: Índices (Company)

### Consultas

**1. Departamento com maior número de pessoas**
```sql
SELECT D.Dname, COUNT(E.Ssn) AS Total_Funcionarios
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E USE INDEX (idx_employee_dno)
    ON D.Dnumber = E.Dno
GROUP BY D.Dnumber, D.Dname
ORDER BY Total_Funcionarios DESC
LIMIT 1;
```

**2. Departamentos por cidade**
```sql
SELECT D.Dname, DL.Dlocation AS Cidade
FROM DEPARTMENT D
INNER JOIN DEPT_LOCATIONS DL USE INDEX (idx_dept_locations_dnumber)
    ON D.Dnumber = DL.Dnumber
ORDER BY DL.Dlocation;
```

**3. Empregados por departamento**
```sql
SELECT D.Dname, E.Ssn, E.Fname, E.Minit, E.Lname, E.Salary
FROM EMPLOYEE E USE INDEX (idx_employee_dno)
INNER JOIN DEPARTMENT D ON E.Dno = D.Dnumber
ORDER BY D.Dname, E.Fname;
```

### Índices criados
```sql
CREATE INDEX idx_employee_dno ON EMPLOYEE(Dno);
CREATE INDEX idx_dept_locations_dnumber ON DEPT_LOCATIONS(Dnumber);
```

| Índice | Coluna | Tipo | Motivo |
|---|---|---|---|
| `idx_employee_dno` | `EMPLOYEE.Dno` | B-TREE | Acelera o JOIN funcionário × departamento (consultas 1 e 3) |
| `idx_dept_locations_dnumber` | `DEPT_LOCATIONS.Dnumber` | B-TREE | Acelera o JOIN departamento × cidade (consulta 2) |

**Por que B-TREE?** É o padrão do MySQL/InnoDB e atende bem a junções e buscas por igualdade e intervalo.

**Critério:** só foram criados índices nas colunas mais usadas em `JOIN`. Índices extras deixariam `INSERT`/`UPDATE`/`DELETE` mais lentos e ocupariam espaço sem necessidade.

> `USE INDEX` sugere ao otimizador quais índices considerar. Use `EXPLAIN` antes da consulta para conferir o plano de execução.

## Parte 2: Procedure CRUD (E-commerce)

### Estrutura
```sql
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clients (
    idClient INT PRIMARY KEY,
    Fname VARCHAR(100),
    Minit VARCHAR(20),
    Lname VARCHAR(100),
    CPF CHAR(11),
    Address VARCHAR(100)
);
```

### Procedure
A variável de controle `p_opcao` define a ação: **1** insert, **2** select, **3** update, **4** delete.

```sql
DELIMITER //

CREATE PROCEDURE gerenciarClient (
    IN p_opcao INT,
    IN p_idClient INT,
    IN p_Fname VARCHAR(100),
    IN p_Minit VARCHAR(20),
    IN p_Lname VARCHAR(100),
    IN p_CPF CHAR(11),
    IN p_Address VARCHAR(100)
)
BEGIN
    IF p_opcao = 1 THEN
        INSERT INTO clients (idClient, Fname, Minit, Lname, CPF, Address)
        VALUES (p_idClient, p_Fname, p_Minit, p_Lname, p_CPF, p_Address);

    ELSEIF p_opcao = 2 THEN
        SELECT * FROM clients;

    ELSEIF p_opcao = 3 THEN
        UPDATE clients
        SET Fname = p_Fname, Minit = p_Minit, Lname = p_Lname,
            CPF = p_CPF, Address = p_Address
        WHERE idClient = p_idClient;

    ELSEIF p_opcao = 4 THEN
        DELETE FROM clients WHERE idClient = p_idClient;

    ELSE
        SELECT 'Opção inválida!' AS mensagem;
    END IF;
END //

DELIMITER ;
```

### Chamadas
```sql
CALL gerenciarClient(1, 1, 'Maria', 'S', 'Oliveira', '12345678901', 'Rua Central'); -- inserir
CALL gerenciarClient(2, NULL, NULL, NULL, NULL, NULL, NULL);                        -- consultar
CALL gerenciarClient(3, 1, 'Maria', 'S', 'Santos', '12345678901', 'Rua Nova');      -- atualizar
CALL gerenciarClient(4, 1, NULL, NULL, NULL, NULL, NULL);                           -- excluir
```

## Como executar
1. Execute o script do schema `Company` e depois os `CREATE INDEX`.
2. Rode as consultas, com `EXPLAIN` se quiser comparar os planos.
3. Execute o script do `ecommerce` (selecione o banco com `USE ecommerce;` antes da procedure) e faça as chamadas `CALL`.

## Tecnologias
MySQL 8 · InnoDB · SQL