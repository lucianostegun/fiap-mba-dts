INSERT INTO produtos(nome, modelo, fabricante) VALUES('iPhone 13 Pro', 'Pro Max', 'Apple');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Prata'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Samsung Galaxy S21', '5G', 'Samsung');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Azul'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Google Pixel 6', 'Pro', 'Google');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Preto'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('MacBook Air', 'M1', 'Apple');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Roxo'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Sony PlayStation 5', 'Padrão', 'Sony');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Preto'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Microsoft Surface', 'Laptop 4', 'Microsoft');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Rosa'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Bose QuietComfort 45', 'Fones de Ouvido sem Fio', 'Bose');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Preto'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Dell XPS 13', 'Edição 2021', 'Dell');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Branco'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Nikon Z6', 'Câmera Mirrorless Full Frame', 'Nikon');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Azul'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Canon EOS R6', 'Câmera Mirrorless Full Frame', 'Canon');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Roxo'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Lenovo ThinkPad X1', 'Carbon', 'Lenovo');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Amarelo'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('LG OLED Série C1', 'TV OLED 4K', 'LG');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Verde'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Samsung Galaxy Watch 4', 'Clássico', 'Samsung');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Vermelho'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Fitbit', 'Charge 5', 'Fitbit');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Verde'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('GoPro Hero 10', 'Câmera de Ação', 'GoPro');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Preto'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Bosch Série 800', 'Lava-Louças em Aço Inoxidável', 'Bosch');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Dourado'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Batedeira KitchenAid', 'Artisan', 'KitchenAid');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Vermelho'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Weber Genesis II E-335', 'Grelha a Gás Propano de 3 Queimadores', 'Weber');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Grande'), (SELECT codigo FROM cores WHERE nome = 'Preto'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Kit de Furadeira sem Fio', 'DeWalt 20V MAX', 'DeWalt');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Pequeno'), (SELECT codigo FROM cores WHERE nome = 'Amarelo'));

INSERT INTO produtos(nome, modelo, fabricante) VALUES('Cadeira Herman', 'Miller Aeron', 'Herman Miller');
INSERT INTO produto_tamanho_cor(codigo_produto, codigo_tamanho, codigo_cor) VALUES(LAST_INSERT_ID(), (SELECT codigo FROM tamanhos WHERE nome = 'Médio'), (SELECT codigo FROM cores WHERE nome = 'Prata'));
