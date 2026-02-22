-- inserção de dados e queries

use oficina;

-- =========================
-- VEHICLE
-- =========================
insert into vehicle (vname, mark, model, category) values
('Gol ', 'Volkswagen', 'Gol 1.0', 'Hatch'),
('Civic ', 'Honda', 'Civic 2.0 VETC', 'Sedan'),
('Hilux', 'Toyota', 'Hilux 3.0 4X4', 'Pickup'),
('Onix', 'Chevrolet', 'Onix 1.0 turbo', 'Hatch'),
('HB20a', 'Hyundai', 'HB20 1.6', 'Hatch');


-- =========================
-- CLIENTS
-- =========================
insert into clients (Fname, Minit, Lname, CPF_CNPJ, Address, vehicle_client) values
('João', 'A', 'Silva', '12345678901', 'Rua A, 100 - Centro', 1),
('Maria', 'B', 'Souza', '23456789012', 'Rua B, 200 - Centro', 2),
('Empresa', 'C', 'LTDA', '34567890123', 'Av Industrial, 300', 3),
('Pedro', 'D', 'Oliveira', '45678901234', 'Rua D, 400 - Bairro Novo', 4),
('Ana', 'E', 'Costa', '56789012345', 'Rua E, 500 - Centro', 5);


-- =========================
-- MECANIC
-- =========================
insert into mecanic (nameFull, Address, especialidade) values
('Carlos Lima', 'Rua Oficina, 10', 'Motor'),
('Rafael Souza', 'Rua Oficina, 20', 'Freio'),
('Marcos Paulo', 'Rua Oficina, 30', 'Suspensão'),
('Juliano Alves', 'Rua Oficina, 40', 'Eletrica');


-- =========================
-- TEAM
-- =========================
insert into team (nameTeam) values
('Equipe Alfa'),
('Equipe Beta');


-- =========================
-- MECANIC TEAM (N:M)
-- =========================
insert into mecanicTeam (idMteam, idMmecanic) values
(1,1),
(1,2),
(2,3),
(2,4);


-- =========================
-- SERVICE
-- =========================
insert into service (typeService, preco) values
('Troca Oleo', 150.00),
('Alinhamento', 100.00),
('Revisao', 300.00),
('Freio', 250.00);


-- =========================
-- PARTS
-- =========================
insert into parts (Pname, preco) values
('Filtro de Oleo', 40.00),
('Pastilha Freio', 120.00),
('Amortecedor', 350.00),
('Bateria', 450.00);


-- =========================
-- WORKORDER
-- =========================
insert into workorder 
(Dateofemission, dateofconclusion, idWclient, wStatus, autorizationClient, idWvehicle, idWmecanicaTeam, valortotal)
values
('2026-02-01', '2026-02-02', 1, 'finalizado', 1, 1, 1, 290.00),
('2026-02-05', null, 2, 'em andamento', 1, 2, 1, 400.00),
('2026-02-10', null, 3, 'aguardandopeça', 0, 3, 2, 700.00),
('2026-02-12', '2026-02-13', 4, 'finalizado', 1, 4, 2, 550.00);


-- =========================
-- WORKORDER PARTS (N:M)
-- =========================
insert into workorderParts 
(idWparts, idWworkoderc, amount, priceUnity, Subtotal) values
(1,1,1,40.00,40.00),
(2,1,1,120.00,120.00),
(3,3,2,350.00,700.00),
(4,4,1,450.00,450.00);


-- =========================
-- WORKORDER SERVICE (N:M)
-- =========================
insert into workorderParts_service 
(idWorkman_service, idSworkorder) values
(1,1),
(2,1),
(2,2),
(3,3),
(4,4);
