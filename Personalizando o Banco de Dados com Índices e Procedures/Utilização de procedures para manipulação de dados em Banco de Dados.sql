### Procedure
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


### Chamadas

CALL gerenciarClient(1, 1, 'Maria', 'S', 'Oliveira', '12345678901', 'Rua Central'); -- inserir
CALL gerenciarClient(2, NULL, NULL, NULL, NULL, NULL, NULL);                        -- consultar
CALL gerenciarClient(3, 1, 'Maria', 'S', 'Santos', '12345678901', 'Rua Nova');      -- atualizar
CALL gerenciarClient(4, 1, NULL, NULL, NULL, NULL, NULL);                           -- excluir