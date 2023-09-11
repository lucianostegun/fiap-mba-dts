CREATE TABLE "Clientes" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(100) NOT NULL,
  "data_nascimento" DATE NOT NULL,
  "cpf" VARCHAR(11) NOT NULL,
  "rg" VARCHAR(20) NOT NULL,
  "telefone" VARCHAR(20) NOT NULL,
  "email" VARCHAR(100) NOT NULL
);

CREATE TABLE "Enderecos" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT,
  "logradouro" VARCHAR(100),
  "numero" VARCHAR(10),
  "complemento" VARCHAR(100),
  "cidade" VARCHAR(100),
  "estado" VARCHAR(50),
  "cep" VARCHAR(8)
);

CREATE TABLE "Depositos" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT,
  "data" DATE,
  "valor" "NUMERIC(10, 2)"
);

CREATE TABLE "Aquisicoes_Credito" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente" INT,
  "tipo_produto" VARCHAR(100),
  "data" DATE,
  "valor" "NUMERIC(10, 2)"
);

CREATE TABLE "Transferencias" (
  "id" SERIAL PRIMARY KEY,
  "id_cliente_origem" INT,
  "id_cliente_destino" INT,
  "data" DATE,
  "valor" "NUMERIC(10, 2)"
);

ALTER TABLE "Enderecos" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Depositos" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Aquisicoes_Credito" ADD FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id");

ALTER TABLE "Transferencias" ADD FOREIGN KEY ("id_cliente_origem") REFERENCES "Clientes" ("id");

ALTER TABLE "Transferencias" ADD FOREIGN KEY ("id_cliente_destino") REFERENCES "Clientes" ("id");
