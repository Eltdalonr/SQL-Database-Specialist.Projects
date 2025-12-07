

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


### 1. Cliente (PJ ou PF)

* Uma conta **pode ser Pessoa Jurídica (PJ) ou Pessoa Física (PF)**, mas **não pode possuir ambos os tipos** simultaneamente.
* Foi criado o campo **`tipo_cliente`** e **`cnpj_cpf`** na tabela **Cliente**.

### 2. Pagamento

* Um cliente pode ter **mais de uma forma de pagamento** cadastrada.
* Foi criada a tabela **Pagamento**, com **relacionamento 1:N (um cliente, vários pagamentos)** com a tabela **Cliente**
  *(observação: sua descrição dizia 1:1, mas isso contradiz “mais de uma forma de pagamento”; caso queira manter 1:1, posso corrigir).*

### 3. Entrega

* Uma entrega possui **status** e **código de rastreio**.
* Foi criada a tabela **Entrega**, com **relacionamento 1:1** com a tabela **Pedido**.


##

<img width="865" height="1034" alt="Modelo ER_E-commerce_Refinado" src="https://github.com/user-attachments/assets/c3e46018-b9d6-4318-8106-2d187922228b" />




