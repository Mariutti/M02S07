CREATE DATABASE exercicio_sem07;

--1 Crie uma tabela chamada clientes, com os seguintes atributos:
--  Id
--  Nome
--  Telefone
--  Endereco
CREATE TABLE Clientes (
	id iNT,
  	Nome VARCHAR(30),
  	Telefone VARCHAR(11),
  	Endereco VARCHAR(150)
);

--2 Crie um script para inserir os seguintes clientes:
--  Id: 1, Nome: Vinicius Silva , Telefone: 987654, Endereco: Rua Girassol
--  Id: 2, Nome: Maria Antonia , Telefone: 123456 , Endereco: Rua Rosas
--  Id: 3, Nome: Marcus Vinicius , Telefone: 654123, Endereco: Rua Itajai
INSERT INTO Clientes  (ID, Nome, Telefone, Endereco)
	VALUES
    	(1, 'Vinicius Silva' , '987654', 'Rua Girassol'),
        (2, 'Maria Antonia' , '123456' , 'Rua Rosas'),
        (3, 'Marcus Vinicius' , '654123', 'Rua Itajai');

--3 Crie um script que selecione todos os clientes.        
SELECT * FROM Clientes;

--4 Crie um Script que selecione os clientes filtrando pelo campo Id
Select * FROM Clientes
WHERE id = 1;

--5 Crie um Script, que filtre os clientes utilizando o like '%%'
Select * FROM Clientes
WHERE Nome LIKE '%ari%';

--6 Crie um Script para atualizar o endereço do Marcus Vinicius para : Rua do Limão,
--  Atenção para não rodar um update sem where!
UPDATE Clientes
SET Endereco = 'Rua do Limão'
WHERE Nome = 'Marcus Vinicius';

--7 Crie o Script para Excluir o cliente Id 2
--  Atenção: Para não rodar um delete sem WHERE
DELETE FROM Clientes
WHERE id = 2;

--8 Com base na seguinte tabela de funcionarios realize a normalização dela  até sua terceira forma normal e crie todos os scripts de criação das tabelas e inclusão dos registros
CREATE TABLE Funcionarios (
  Id INT,
  Nome VARCHAR(15),
  Cargo VARCHAR(20),
  tel1 VARCHAR(11),
  tel2 VARCHAR(11)
);

INSERT INTO Funcionarios
	VAlUES
    	(1, 'Marcos', 'Atendente', '3654589', '36545987'),
        (2, 'Maria', 'Gerente', '3654689', '36524570'),
        (3, 'Julia', 'Atendente', '3654962', '12365458');
SELECT * FROM Funcionarios;

--1FN
--Selecionar Chave Primária da Tabela Principal;
--Retirar da tabela colunas de valores múltiplos
--Subdividir colunas com valores compostosdemo
ALTER TABLE funcionarios
	DROP tel1,
    DROP tel2,
    ADD PRIMARY KEY (Id);
    
CREATE TABLE Telefones (
	Id_Funcionario INT,
	tel VARCHAR (11),
 	PRIMARY KEY(Id_Funcionario, tel),
  	CONSTRAINT fk_id_funcionario
  		FOREIGN KEY(Id_Funcionario) 
		REFERENCES Funcionarios(Id)  
);

INSERT INTO telefones
	VAlUES
    	(1, '3654589'),
        (1, '36545987'),
        (2, '3654689'), 
        (2, '36524570'),
        (3, '3654962'), 
        (3, '12365458');

SELECT * FROM Telefones;


--2FN
--Estar na 1FN
--No caso de chaves primárias compostas, verificar dependências funcionais parciais de atributos não chave e separá-las em outras tabelas
  
--A tabela Funcionario não apresenta chave primária composta, então, automaticamente, já pode ser considerada dentro da 2FN.
--A tabela Telefones, embora possua chave primária composta, não possui atributos não chave, não havendo como ocorrer dependência funcional parcial.

  
--3FN
--Estar nas 1FN e 2FN
--Não apresentar dependência funcional transitiva.
ALTER TABLE funcionarios
	DROP Cargo;

CREATE TABLE Cargos (
	Id Int PRIMARY KEY,
	Descricao VARCHAR(20)
);

INSERT INTO Cargos
	VALUES
		(1, 'Gerente'),
		(2, 'Atendente');

ALTER TABLE funcionarios
	ADD COLUMN Id_Cargo INT REFERENCES Cargos(id)
	
UPDATE Funcionarios
	SET id_cargo = 2
	WHERE id = 1;
UPDATE Funcionarios	
	SET id_cargo = 1
	WHERE id = 2;
UPDATE Funcionarios	
	SET id_cargo = 2
	WHERE id = 3;	

SELECT * FROM Funcionarios;
SELECT * FROM Cargos;


