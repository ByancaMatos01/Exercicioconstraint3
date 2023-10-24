USE master 
GO
DROP DATABASE MECANICA

CREATE DATABASE MECANICA
GO
USE MECANICA

CREATE TABLE CLIENTE(
ID			INT				NOT NULL IDENTITY (3401,15),
NOME		VARCHAR(100)	NOT NULL, 
LOUGRADOURO VARCHAR(200)	NOT NULL,
NUMERO		INT			    NOT NULL CHECK (NUMERO > 0),
CEP 		CHAR(8)			NOT NULL CHECK (LEN(CEP) = 8),
COMPLEMENTO VARCHAR(255)    NOT NULL
PRIMARY KEY (ID)
)
GO

CREATE TABLE TELEFONE (
Telefone	 CHAR(11)		NOT NULL CHECK (LEN(TELEFONE) = 11),
ID			 INT			NOT NULL
PRIMARY KEY (TELEFONE, ID)
FOREIGN KEY (ID) REFERENCES CLIENTE (ID)
)
GO

CREATE TABLE VEICULO (
PLACA			CHAR(7)			NOT NULL CHECK(LEN(PLACA) = 7),
MARCA			VARCHAR(30)		NOT NULL,
MODELO			VARCHAR(30)		NOT NULL,
COR				VARCHAR(15)		NOT NULL,
Ano_Fabricacao  INT			NOT NULL CHECK(Ano_Fabricacao > 1997),
Ano_Modelo		INT				NOT NULL CHECK(Ano_Modelo > 1997),
Data_Aquisicao	DATE			NOT NULL,
Id				INT				NOT NULL
PRIMARY KEY (Placa)
FOREIGN KEY (Id) REFERENCES cliente (Id),
CONSTRAINT chk_AnoModelo_AnoFabricacao CHECK(Ano_Modelo >= Ano_Fabricacao AND Ano_Modelo <= Ano_Fabricacao + 1)
)
GO

CREATE TABLE Categoria (
Id				INT				NOT NULL IDENTITY(1,1),
Categoria		VARCHAR(10)		NOT NULL,
Valor_Hora		DECIMAL(4,2)	NOT NULL CHECK (Valor_Hora > 0)
PRIMARY KEY (ID),
CONSTRAINT chk_Categoria_Valor_Hora 
CHECK   ((UPPER(Categoria) = 'Estagiario' AND Valor_Hora > 15.00) OR
        ((UPPER(Categoria) = 'Nivel 1'    AND Valor_Hora > 25.00) OR
        ((UPPER(Categoria) = 'Nivel 2'    AND Valor_Hora > 35.00) OR
        ((UPPER(Categoria) = 'Nivel 3'    AND Valor_Hora > 50.00)))))
)
GO

CREATE TABLE Funcionario (
Id					  INT			NOT NULL IDENTITY (101,1),
Nome				  VARCHAR(100)	NOT NULL,
Logradouro			  VARCHAR(200)	NOT NULL,
Numero				  INT			NOT NULL CHECK (Numero > 0),
Telefone			  CHAR(11)		NOT NULL CHECK (LEN(Telefone) = 11),
Categoria_Habilitacao CHAR(02)		NOT NULL CHECK ((UPPER(Categoria_Habilitacao) = 'A') OR (UPPER(Categoria_Habilitacao) = 'B')
 OR (UPPER(Categoria_Habilitacao) = 'C') OR (UPPER(Categoria_Habilitacao) = 'D') OR (UPPER(Categoria_Habilitacao) = 'E')),
Id_Categoria		  INT			NOT NULL	
PRIMARY KEY (Id)
FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id)
)
GO

CREATE TABLE Peca (
Id					INT			 NOT NULL IDENTITY(3411,7),
Nome				VARCHAR(30)  NOT NULL UNIQUE,
Preco				DECIMAL(4,2) NOT NULL CHECK(Preco >= 0),
Estoque				INT			 NOT NULL CHECK(Estoque>=10)
PRIMARY KEY (Id)
)
GO

CREATE TABLE Reparo (
Placa				CHAR(07)			NOT NULL,
Funcionario			INT					NOT NULL,
Peca				INT					NOT NULL,
Data_Reparo			DATE				NOT NULL DEFAULT(GETDATE()),
Custo_Total			DECIMAL(4,2)		NOT NULL CHECK(Custo_Total >= 0), 
Tempo				INT					NOT NULL
PRIMARY KEY (Placa, Funcionario, Peca, Data_Reparo)
FOREIGN KEY (Placa) REFERENCES Veiculo (Placa),
FOREIGN KEY (Funcionario) REFERENCES Funcionario (Id),
FOREIGN KEY (Peca) REFERENCES Peca (ID)
)

