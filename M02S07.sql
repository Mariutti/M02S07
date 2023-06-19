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
