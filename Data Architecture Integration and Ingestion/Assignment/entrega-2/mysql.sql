INSERT INTO produtos (nome, modelo, fabricante) VALUES
('Produto A', 'Modelo X', 'Fabricante XA1'),
('Produto B', 'Modelo Y', 'Fabricante YB2'),
('Produto C', 'Modelo Z', 'Fabricante ZC3'),
('Produto D', 'Modelo X', 'Fabricante XD1'),
('Produto E', 'Modelo Y', 'Fabricante YE2'),
('Produto F', 'Modelo Z', 'Fabricante ZF3'),
('Produto G', 'Modelo X', 'Fabricante XG1'),
('Produto H', 'Modelo Y', 'Fabricante YH2'),
('Produto I', 'Modelo Z', 'Fabricante ZI3'),
('Produto J', 'Modelo X', 'Fabricante XJ1');

INSERT INTO tamanhos (nome) VALUES
('Pequeno'),
('Médio'),
('Grande'),
('Extra Grande'),
('2'),
('4'),
('6'),
('8'),
('10'),
('12');

INSERT INTO cores (nome) VALUES
('Vermelho'),
('Azul'),
('Verde'),
('Amarelo'),
('Preto'),
('Branco'),
('Prata'),
('Dourado'),
('Roxo'),
('Rosa');

INSERT INTO produto_tamanho_cor (codigo_produto, codigo_tamanho, codigo_cor) VALUES
(1, 1, 10),
(2, 4, 9),
(3, 5, 8),
(4, 8, 7),
(5, 9, 6),
(6, 10, 5),
(7, 7, 4),
(8, 6, 3),
(9, 3, 2),
(10, 2, 1);

INSERT INTO clientes (cpf, nome, endereco, cep, email) VALUES
('12345678901', 'João Silva', 'Rua das Flores, 123', '12345678', 'joao.silva@email.com'),
('23456789012', 'Ana Santos', 'Avenida Principal, 456', '23456789', 'ana.santos@email.com'),
('34567890123', 'Luiz Ferreira', 'Travessa da Praia, 789', '34567890', 'luiz.ferreira@email.com'),
('45678901234', 'Marina Oliveira', 'Alameda dos Sonhos, 101', '45678901', 'marina.oliveira@email.com'),
('56789012345', 'Carlos Souza', 'Rua do Comércio, 55', '56789012', 'carlos.souza@email.com'),
('67890123456', 'Lucia Pereira', 'Avenida Central, 234', '67890123', 'lucia.pereira@email.com'),
('78901234567', 'Eduardo Rodrigues', 'Travessa da Montanha, 12', '78901234', 'eduardo.rodrigues@email.com'),
('89012345678', 'Isabela Almeida', 'Alameda das Flores, 34', '89012345', 'isabela.almeida@email.com'),
('90123456789', 'Gustavo Martins', 'Rua dos Bosques, 78', '90123456', 'gustavo.martins@email.com'),
('12334567890', 'Amanda Lima', 'Travessa da Cidade, 56', '12334567', 'amanda.lima@email.com');

INSERT INTO telefones (codigo_cliente, telefone) VALUES
(1, '11928374651'),
(2, '11929363947'),
(3, '11999283664'),
(4, '11928837640'),
(5, '11989475610'),
(6, '11974912203'),
(7, '11999887765'),
(8, '11980304858'),
(9, '11952431099'),
(10, '11922884627');


INSERT INTO pedidos (codigo_cliente, endereco, cep, valor) VALUES
(1, 'Rua das Flores, 123', '12345678', 100),
(2, 'Avenida Principal, 456', '23456789', 200),
(3, 'Travessa da Praia, 789', '34567890', 300),
(4, 'Alameda dos Sonhos, 101', '45678901', 400),
(5, 'Rua do Comércio, 55', '56789012', 500),
(6, 'Avenida Central, 234', '67890123', 600),
(7, 'Travessa da Montanha, 12', '78901234', 700),
(8, 'Alameda das Flores, 34', '89012345', 800),
(9, 'Rua dos Bosques, 78', '90123456', 900),
(10, 'Travessa da Cidade, 56', '12334567', 1000);

INSERT INTO pedido_itens (codigo_pedido, codigo_produto, codigo_tamanho, codigo_cor, quantidade, valor) VALUES
(1, 10, 1, 2, 10, 10),
(2, 9, 3, 4, 20, 10),
(3, 8, 5, 6, 10, 30),
(4, 7, 7, 8, 40, 10),
(5, 6, 9, 10, 10, 50),
(6, 5, 10, 9, 60, 10),
(7, 4, 8, 7, 10, 70),
(8, 3, 6, 5, 80, 10),
(9, 2, 4, 3, 10, 90),
(10, 1, 2, 1, 10, 100);