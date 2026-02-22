-- Criação do Banco de Dados para o cenário de E-comerce
drop database oficina;
create database oficina;
use oficina;

-- criar tabela veiculo

create table vehicle(
 idVehicle int auto_increment primary key,
 vname varchar(45),
 mark varchar (15),
 model varchar (15),
 category varchar(15),
 constraint unique_mark_vehicle unique(mark)

);


-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key, 
    Fname varchar(20) not null,
    Minit varchar(20),
    Lname varchar(20),
    CPF_CNPJ char(11) not null,
    Address varchar(60),
    vehicle_client int, 
    constraint fk_vehicle_client foreign key(vehicle_client) references vehicle(idvehicle),
    constraint unique_cpf_client unique(CPF_CNPJ)
);

alter table clients auto_increment=1;

-- criar tabela Mecanic

create table mecanic(
	idMecanic int auto_increment primary key, 
    nameFull varchar(20) not null,
    Address varchar(60),
    especialidade varchar(15)
);

-- criar tabela team

create table team(
	idTeam int auto_increment primary key, 
    nameTeam varchar(20) not null
);

 -- TABELA N:M
 
create table mecanicTeam(
	idMteam int,
    idMmecanic int,
	primary key (idMteam,idMmecanic),
    constraint fk_mecaninc_team foreign key (idMteam) references team(idTeam),
    constraint fk_team_mecaninc foreign key (idMmecanic) references mecanic(idMecanic)

);
-- criar tabela Service

create table service(
	idWorkman int auto_increment primary key,
    typeService varchar(15),
    preco float
);


-- criar tabela parts 

create table parts(
	idParts int auto_increment primary key,
    Pname varchar(45),
    preco float
);



-- criar tabela work order 

create table workorder(
	idWorkoder int auto_increment primary key,
    Dateofemission date,
    dateofconclusion date,
    idWclient int,
    wStatus enum('finalizado','em andamento','aguardandopeça') default 'em andamento',
    autorizationClient tinyint,
    idWvehicle int,
    idWmecanicaTeam int,
    valortotal float,
    
    constraint fk_workorder_client foreign key (idWclient) references clients(idClient),
    constraint fk_workorder_vehicle foreign key (idWvehicle) references vehicle(idVehicle),
	constraint fk_workorder_mecaninc_team foreign key (idWmecanicaTeam) references mecanicTeam(idMteam)
);

 -- TABELA N:M
 
create table mecanicTeam(
	idMteam int,
    idMmecanic int,
	primary key (idMteam,idMmecanic),
    constraint fk_mecaninc_team foreign key (idMteam) references team(idTeam),
    constraint fk_team_mecaninc foreign key (idMmecanic) references mecanic(idMecanic)

);

 -- TABELA N:M
 
create table workorderParts(
	idWparts int,
    idWworkoderc int,
    amount int,
    priceUnity float,
    Subtotal float
    
	primary key (idWparts,idWworkoderc),
    constraint fk_workorder_parts foreign key (idWparts) references parts(idParts),
    constraint fk_parts_workorder foreign key (idWworkoderc) references workorder(idWorkorder)

);

create table workorderParts_service(
	idWorkman_service int,
    idSworkorder int,
    
	primary key (idWorkman_service,idSworkorder),
    constraint fk_workorder_service foreign key (idWorkman_service) references workorder(idWorkorder),
    constraint fk_service_workorder foreign key (idSworkorder) references service(idWorkman)

);





