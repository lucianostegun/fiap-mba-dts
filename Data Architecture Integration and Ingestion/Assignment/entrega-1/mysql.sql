CREATE TABLE produtos (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(128) NOT NULL,
	modelo VARCHAR(64) NOT NULL,
	fabricante VARCHAR(24) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE tamanhos (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(16) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE cores (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(16) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE produto_tamanho_cor (
	codigo_produto INTEGER NOT NULL,
	codigo_tamanho INTEGER NOT NULL,
	codigo_cor INTEGER NOT NULL,
	PRIMARY KEY (codigo_produto, codigo_tamanho, codigo_cor),
	CONSTRAINT produto_tamanho_cor_fk_codigo_produto FOREIGN KEY (codigo_produto) REFERENCES produtos (codigo), 
	CONSTRAINT produto_tamanho_cor_fk_codigo_tamanho FOREIGN KEY (codigo_tamanho) REFERENCES tamanhos (codigo),
	CONSTRAINT produto_tamanho_cor_fk_codigo_cor FOREIGN KEY (codigo_cor) REFERENCES cores (codigo)
);

CREATE TABLE clientes (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	cpf CHAR(11) NOT NULL,
	nome VARCHAR(48) NOT NULL,
	endereco VARCHAR(128) NOT NULL,
	cep CHAR(8) NOT NULL,
	email VARCHAR(80) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE telefones (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	codigo_cliente INTEGER NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT telefones_fk_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo)
);

CREATE TABLE pedidos (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	codigo_cliente INTEGER NOT NULL,
	endereco VARCHAR(128) NOT NULL,
	cep CHAR(8) NOT NULL,
	valor DECIMAL(10, 2) NOT NULL DEFAULT 0,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT pedidos_fk_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo)
);

CREATE TABLE pedido_itens (
	codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
	codigo_pedido INTEGER NOT NULL,
	codigo_produto INTEGER NOT NULL,
	codigo_tamanho INTEGER NOT NULL,
	codigo_cor INTEGER NOT NULL,
	quantidade INTEGER NOT NULL DEFAULT 1,
	valor DECIMAL(10, 2) NOT NULL DEFAULT 0,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT pedido_itens_fk_codigo_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedidos (codigo),
	CONSTRAINT pedido_itens_fk_codigo_produto FOREIGN KEY (codigo_produto) REFERENCES produtos (codigo),
	CONSTRAINT pedido_itens_fk_codigo_tamanho FOREIGN KEY (codigo_tamanho) REFERENCES tamanhos (codigo),
	CONSTRAINT pedido_itens_fk_codigo_cor FOREIGN KEY (codigo_cor) REFERENCES cores (codigo)
);