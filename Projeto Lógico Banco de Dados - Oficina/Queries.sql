-- Queries
use oficina;
-- Recuperações simples com SELECT Statement
select * from vehicle;

-- Filtros com WHERE Statement

SELECT 
    c.Fname AS Dono,
    v.vname AS Carro,
    w.wStatus,
    w.valortotal AS valor_do_servico
FROM workorder w
INNER JOIN clients c ON w.idWclient = c.idClient
INNER JOIN vehicle v ON w.idWvehicle = v.idVehicle;

-- Crie expressões para gerar atributos derivados
select idVehicle, concat(vname,' ',mark,' - ',category) 
as NameofCar
from vehicle;

 

-- Defina ordenações dos dados com ORDER BY
SELECT *
FROM workorder
ORDER BY valortotal DESC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT 
    wStatus,
    AVG(valortotal) AS media_valor
FROM workorder
GROUP BY wStatus
HAVING AVG(valortotal) >= 400;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados,
SELECT 
    w.idWorkorder,
    w.wStatus,
    c.Fname,
    t.nameTeam,
    w.valortotal
FROM workorder w
INNER JOIN clients c ON w.idWclient = c.idClient
INNER JOIN team t ON w.idWmecanicaTeam = t.idTeam;

-- Quantas ordens cada cliente fez?;
SELECT 
    c.idClient,
    CONCAT(c.Fname, ' ', c.Minit, ' ', c.Lname) AS NomeCompleto,
    COUNT(w.idWorkorder) AS Total_Ordens
FROM clients c
LEFT JOIN workorder w ON w.idWclient = c.idClient
GROUP BY c.idClient;

-- Relação de Ordens, Peças e Quantidade

SELECT 
    w.idWorkorder,
    p.Pname AS Peca,
    wp.amount,
    wp.Subtotal
FROM workorderParts wp
INNER JOIN parts p ON wp.idWparts = p.idParts
INNER JOIN workorder w ON wp.idWworkoderc = w.idWorkorder;




