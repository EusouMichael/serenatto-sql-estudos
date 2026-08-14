CREATE table Produtos(
  ID text primary KEY,
  Nome varchar(250) NOT NULL,
  Descricao varchar (250),
  Preco decimal (10,2),
  Categoria varchar (50)
  );
  
Create TABLE Clientes(
  ID text PRIMARY key,							-- Declaração de chave primária
  Nome varchar (250) NOT NULL,					-- Não aceitação de campo vazio
  Telefone varchar (20),
  Email varchar (250) DEFAULT 'Sem Email',		-- DEFAULT para caso estiver campo em branco, retornar 'Sem Email'
  Endereco varchar(250)
  );
  
CREATE TABLE Colaboradores(
  ID text PRIMARY KEY,
  Nome varchar (100) NOT NULL,
  Cargo varchar (100),
  Data_Contratacao date,
  Telefone varchar (20),
  Email varchar (100),
  Rua varchar (100) NOT NULL,
  Bairro varchar (100) NOT NULL,
  Cidade varchar (100) NOT NULL,
  Estado varchar (2) NOT NULL,
  Cep varchar (8) NOT NULL
  );

CREATE TABLE Pedidos(
ID text	PRIMARY KEY,	
ID_Cliente text,
DataHoraPedido datetime,
Status varchar (50),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID) on DELETE CASCADE
);

CREATE TABLE Itens_Pedido(
ID_Pedido text,
ID_Produto text,
Quantidade integer,
PrecoUnitario decimal (10,2),
PRIMARY KEY (ID_Pedido, ID_Produto),								--Declaração das chaves primárias
FOREIGN KEY(ID_Pedido) REFERENCES Pedidos(ID) on DELETE CASCADE,		--Declarando chave secundárias e fazendo referencias com as primárias
FOREIGN key (ID_Produto) REFERENCES Produto(ID) ON DELETE CASCADE	--Declaração de exclusão em cascada junto a chave primária
);																	--Exclui primária, automaticamente exclue secundária 
  
CREATE TABLE Fornecedores(
ID text	PRIMARY KEY,
Nome varchar (200),
Contato varchar (50) NOT NULL,
Telefone varchar (50),
Email varchar (100),
Rua varchar (100) NOT NULL,
Bairro varchar (100) NOT NULL,
Cidade varchar (100) NOT NULL,
Estado varchar (2) NOT NULL,
Cep varchar (8) NOT NULL
);
