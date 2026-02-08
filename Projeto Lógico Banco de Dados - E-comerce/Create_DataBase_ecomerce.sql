-- Criação do Banco de Dados para o cenário de E-comerce
drop database ecomerce;
create database ecomerce;
use ecomerce;


-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key, 
    Fname varchar(20) not null,
    Minit varchar(20),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(60),
    constraint unique_cpf_client unique(CPF)

);




alter table clients auto_increment=1;

-- criar tabela produto

create table product(
	idProduct int auto_increment primary key, 
    Pname varchar(30) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0, 
    size varchar(10)
);

-- criar tabela pagamentos
create table payments(
	idPayment int auto_increment primary key,
    typePayment enum('Boleto','CreditCard','Pix') default 'Boleto'
    
);

-- criar tabela pedido

create table orders(
	idOrder int auto_increment primary key, 
    idOrderClient int,
    idOrderPayment int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false, 
    constraint fk_orders_client foreign key(idOrderClient) references clients(idClient),
    constraint fk_orders_payment foreign key(idOrderPayment) references payments(idPayment)
    on delete cascade -- criar tabela novamente
);


-- criar tabela entrega

create table delivery(
	idDelivery int auto_increment primary key,
    statusDelivery enum('Processando','Em andamento','Entregue') default 'Processando',
    idordersDelivery int,
    constraint fk_delivery_orders foreign key(idordersDelivery) references orders(idOrder)

);

-- criar tabela estoque

create table productStorage(
	idProdStorage int auto_increment primary key, 
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key, 
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(10) not null,
    constraint unique_supplier unique(CNPJ)
);

-- criar tabela vendedor

create table seller(
	idSeller int auto_increment primary key, 
    socialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(10) not null,
    constraint unique_cnpj_supplier unique(CNPJ),
    constraint unique_cpf_supplier unique(CPF)
);

 -- TABELAS N:M


-- criar tabela ProdutoVendedor

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller,idPproduct),
    constraint fk_product_seller foreign key (idPseller) references Seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
    );

-- criar tabela ProdutoPedido


create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct,idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
	-- idPOproduct, idPOorder, poQuantity, poStatus
);

-- criar tabela produtoFornecedor

create table productSupplier(
	idPsSupplier int, 
	idPsProduct int, 
	quantity int, 
    constraint fk_product_supplier_product foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_supplier foreign key (idPsProduct) references product(idProduct)

);

-- criar tabela EstoqueLocalização

create table storageLocation(

	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage__location_storage foreign key (idLstorage) references productStorage(idProdStorage)
    
);
