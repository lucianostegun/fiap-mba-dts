CREATE TABLE "Categorias_Cliente" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(100) NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Clientes" (
  "id" SERIAL PRIMARY KEY,
  "id_categoria" INT NOT NULL,
  "nome" VARCHAR(100) NOT NULL,
  "data_nascimento" DATE NOT NULL,
  "cpf" VARCHAR(11) NOT NULL,
  "rg" VARCHAR(20) NOT NULL,
  "telefone" VARCHAR(20) NOT NULL,
  "email" VARCHAR(100) NOT NULL,
  "profissao" VARCHAR(100) NOT NULL,
  "renda" "NUMERIC(10, 2)" NOT NULL,
  "score" INT NOT NULL,
  "inadimplente" BOOLEAN,
  "criacao" TIMESTAMP,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Enderecos" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "logradouro" VARCHAR(100) NOT NULL,
  "numero" VARCHAR(10) NOT NULL,
  "complemento" VARCHAR(100),
  "cidade" VARCHAR(100) NOT NULL,
  "estado" VARCHAR(50) NOT NULL,
  "cep" VARCHAR(8) NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Depositos" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "data" DATE NOT NULL,
  "valor" "NUMERIC(10, 2)" NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Produtos" (
  "id" SERIAL PRIMARY KEY,
  "tipo" VARCHAR(100) NOT NULL,
  "nome" VARCHAR(100) NOT NULL,
  "descricao" VARCHAR(500),
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Aquisicoes_Credito" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "id_produto" INT NOT NULL,
  "data" DATE NOT NULL,
  "valor" "NUMERIC(10, 2)" NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Contratos" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "data_inicio" DATE NOT NULL,
  "data_termino" DATE NOT NULL,
  "valor_prestacao" "NUMERIC(10, 2)" NOT NULL,
  "valor_total" "NUMERIC(10, 2)" NOT NULL,
  "juros_mensal" "NUMERIC(10, 5)" NOT NULL,
  "juros_total" "NUMERIC(10, 5)" NOT NULL,
  "situacao" VARCHAR(15) NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Prestacoes" (
  "id" SERIAL PRIMARY KEY,
  "id_contrato" INT NOT NULL,
  "data_emissao" DATE NOT NULL,
  "data_vencimento" DATE NOT NULL,
  "data_pagamento" DATE NOT NULL,
  "valor_prestacao" "NUMERIC(10, 2)" NOT NULL,
  "valor_juros" "NUMERIC(10, 2)" NOT NULL,
  "valor_multa" "NUMERIC(10, 2)" NOT NULL,
  "valor_pago" "NUMERIC(10, 2)" NOT NULL,
  "pago" BOOLEAN NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

CREATE TABLE "Contratos_Produtos" (
  "id" SERIAL PRIMARY KEY,
  "id_contrato" INT NOT NULL,
  "id_produto" INT NOT NULL,
  "valor_total" "NUMERIC(10, 2)" NOT NULL,
  "criacao" TIMESTAMP NOT NULL
);

CREATE TABLE "Transferencias" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente_origem" INT NOT NULL,
  "id_cliente_destino" INT NOT NULL,
  "data" DATE NOT NULL,
  "valor" "NUMERIC(10, 2)" NOT NULL,
  "criacao" TIMESTAMP NOT NULL,
  "atualizacao" TIMESTAMP
);

ALTER TABLE "Clientes" ADD FOREIGN KEY ("id_categoria") REFERENCES "Categorias_Cliente" ("id");

ALTER TABLE "Enderecos" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Depositos" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Aquisicoes_Credito" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Aquisicoes_Credito" ADD FOREIGN KEY ("id_produto") REFERENCES "Produtos" ("id");

ALTER TABLE "Transferencias" ADD FOREIGN KEY ("id_cliente_origem") REFERENCES "Clientes" ("id");

ALTER TABLE "Transferencias" ADD FOREIGN KEY ("id_cliente_destino") REFERENCES "Clientes" ("id");

ALTER TABLE "Contratos" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Contratos_Produtos" ADD FOREIGN KEY ("id_contrato") REFERENCES "Contratos" ("id");

ALTER TABLE "Contratos_Produtos" ADD FOREIGN KEY ("id_produto") REFERENCES "Produtos" ("id");

ALTER TABLE "Prestacoes" ADD FOREIGN KEY ("id_contrato") REFERENCES "Contratos" ("id");
