-- Queries

-- Recuperações simples com SELECT Statement
select * from clients;

-- Filtros com WHERE Statement
select Fname,orderStatus  
from clients, orders 
where idClient = idOrderClient;

-- Crie expressões para gerar atributos derivados
select idClient, concat(Fname,' ',Minit,' ',Lname) 
as NameFull, Address 
from Clients; 

-- Defina ordenações dos dados com ORDER BY
select * from product 
order by avaliação;

-- Condições de filtros aos grupos – HAVING Statement
SELECT category,
    AVG(avaliação) AS media_avaliacao
FROM product
GROUP BY category
HAVING AVG(avaliação) >= 4;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados,
select idOrder, orderStatus as status,Pname as Products, typePayment
from ((orders o
inner join payments p on o.idOrderPayment = p.idPayment)
inner join product on o.idOrder = idProduct);


-- Quantos pedidos foram feitos por cada cliente?
select idOrder, concat(Fname,' ',Minit,' ',Lname) as nameFull, count(idOrderClient) Produtos_Comprados 
from orders, clients where idorderClient=idClient 
group by idOrder;

-- Algum vendedor também é fornecedor?
select s.idSupplier, s.socialName 
from supplier s, seller se 
where s.CNPJ = se.CPF; 

-- Relação de produtos, fornecedores e estoques;
select p.idProduct, p.Pname as Products, s.socialName as Seller, ps.storageLocation
from ((product p
inner join seller s on p.idProduct = s.idSeller)
inner join productstorage ps on ps.idProdStorage = idProduct);

-- Relação de nomes dos fornecedores e nomes dos produtos;
select p.idProduct, s.socialName as Seller, p.Pname as Products
from product p
inner join seller s on p.idProduct = s.idSeller;


