

## **Sistema de Controle e Gerenciamento de execução de Ordens de Serviço**

Este projeto apresenta o modelo de um Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.

##

## **1. Descrição Geral**

O banco de dados foi criado para atender funcionalidades essenciais de um sistema de comércio eletrônico, como:

* Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas;
* Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;
* A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;
* O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços;
* A mesma equipe avalia e executa os serviços;
* Os mecânicos possuem código, nome, endereço e especialidade;
* Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos;

##

Aqui está o texto **reescrito no mesmo estilo, estrutura e formalidade** do exemplo que você forneceu.

---

## **2. Objetivo**

Foram realizadas as seguintes definições e modelagens com base na narrativa da oficina mecânica:

### 1. Cliente

* O cliente possui dados de identificação como **nome, endereço, telefone** e o **tipo de cliente** (Pessoa Física ou Pessoa Jurídica).
* Cada cliente pode possuir **um ou mais veículos** associados.

### 2. Veículo

* Cada veículo é registrado com informações como **marca, modelo e categoria**.
* Um mesmo cliente pode ter **múltiplos veículos cadastrados**, configurando uma relação **1:N (um cliente → vários veículos)**.

### 3. Mecânico

* Cada mecânico possui informações como **nome, endereço e especialidade**.
* Os mecânicos são organizados em equipes e podem participar de **mais de uma equipe**, quando necessário.

### 4. Equipe

* As equipes são responsáveis pela **avaliação e execução** das Ordens de Serviço.
* Foi criada a tabela associativa **Mecânico_Equipe**, que representa o relacionamento **N:N (vários mecânicos ↔ várias equipes)**.

### 5. Ordem de Serviço (OS)

* A Ordem de Serviço é o **elemento central do sistema** e armazena:

  * **datas** (emissão e previsão de conclusão)
  * **cliente responsável**
  * **veículo atendido**
  * **equipe designada**
  * **status da OS**
  * **autorização do cliente**
  * **valor total da OS**
* A OS é utilizada como base para calcular o custo total de mão de obra e peças.

### 6. Serviço (Mão de Obra)

* Foi criada a tabela **Serviço**, que funciona como uma tabela de referência contendo:

  * **tipo do serviço**
  * **preço unitário de mão de obra**
* Esta tabela armazena a precificação oficial utilizada na execução das OS.

### 7. OS_Serviço

* Criada a tabela associativa **OS_Serviço**, responsável por registrar:

  * Quais serviços foram aplicados em cada OS
  * O preço da mão de obra **vigente na data da execução**
* Representa a relação **N:N (uma OS ↔ vários serviços)**.

### 8. Peças

* A tabela **Peças** contém o catálogo de peças utilizadas nos veículos, com seus respectivos **nomes e valores**.

### 9. OS_Peça

* Criada a tabela associativa **OS_Peça**, que registra:

  * **quantidade utilizada**
  * **preço unitário no momento da OS**
  * **subtotal gerado**
* Representa o relacionamento **N:N entre OS e Peças**, permitindo que múltiplas peças sejam aplicadas em múltiplas OS, com rastreio de custo.

##
<img width="906" height="1030" alt="Oficina mecanica" src="https://github.com/user-attachments/assets/0100209b-edfb-43f7-bb31-b47ed79993ff" />





