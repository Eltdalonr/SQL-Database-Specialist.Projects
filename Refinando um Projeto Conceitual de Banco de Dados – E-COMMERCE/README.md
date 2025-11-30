

## **E-Commerce – Banco de Dados**

Este projeto apresenta o modelo de banco de dados de um sistema de e-commerce, incluindo clientes PF/PJ, produtos, pedidos, pagamentos e entregas.

##

## **1. Descrição Geral**

O banco de dados foi criado para atender funcionalidades essenciais de um sistema de comércio eletrônico, como:

* Cadastro de clientes (Pessoa Física ou Pessoa Jurídica)
* Produtos e controle de estoque
* Vendedores terceirizados e fornecedores
* Pedidos com itens associados
* Entrega com status e código de rastreio
* Múltiplas formas de pagamento por cliente

##

## **2. Objetivo**

Foi realizado as seguintes modificações:

1. Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
1.1 Criado campo Tipo Cliente e CNPJ/CPF na Tabela Cliente; 
2. Pagamento – Pode ter cadastrado mais de uma forma de pagamento; 
2.1 Criado Tabela pagamento e relacionamenot 1:1 com a Tabela Cliente;
3. Entrega – Possui status e código de rastreio;
3.1 Criado Tabela entrega e relacionamento 1:1 com a Tabela Pedido; 

##


