

## **Oficina – Banco de Dados**

O banco de dados foi criado para sedimentar os conhecimentos de modelagem conceitual, lógica e física de banco de dados, aplicados ao cenário de uma oficina mecânica.
##

## **1. Descrição Geral**

O banco de dados foi criado para sedimentar os conhecimentos de modelagem conceitual, lógica e física de banco de dados:

* Replicação e refinamento da modelagem lógica a partir de um modelo conceitual (EER);
* Mapeamento de relacionamentos do modelo Enhanced Entity-Relationship para o modelo relacional;
* Desenvolvimento do script SQL completo para criação do esquema do banco de dados;
* Inserção de dados fictícios para testes e validação;
* Elaboração de consultas SQL mais complexas, utilizando diferentes cláusulas para explorar os dados e responder perguntas relevantes do contexto de negócio.
* O sistema modelado contempla as seguintes regras:
* Clientes levam veículos à oficina para consertos ou revisões periódicas;
* Cada veículo é designado a uma equipe de mecânicos;
* A equipe identifica os serviços a serem executados e emite uma Ordem de Serviço (OS);
* O valor dos serviços é calculado com base em uma tabela de referência de mão de obra;
* O valor das peças também compõe o valor total da OS;
* O cliente autoriza a execução dos serviços;
* A equipe designada executa e finaliza a OS;
* Cada OS possui número, data de emissão, data prevista para conclusão, status e valor total.


O projeto foi desenvolvido para fins educacionais, com foco no fortalecimento do portfólio em SQL e modelagem de dados.



##

## **2. Objetivo**



1. Criar o script SQL de criação das tabelas;
2.Desenvolver queries SQL que utilizem:

SELECT

WHERE

Atributos derivados (expressões)

ORDER BY

HAVING

JOIN entre tabelas

3. Elaborar perguntas de negócio que possam ser respondidas pelas consultas


Quantas Ordens de Serviço cada cliente possui?

Qual o valor total gasto por cliente?

Quais serviços são mais executados?

Quais mecânicos participaram de mais Ordens de Serviço?

Qual o valor médio das OS por período?

Quais peças são mais utilizadas?

Existem OS pendentes ou atrasadas?

##


