-- VittaLar | Banco de dados para desafio técnico SQL
-- Dialeto: PostgreSQL
-- Execute este arquivo em um banco de testes vazio.

DROP TABLE IF EXISTS pagamentos;
DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(80),
    estado CHAR(2),
    data_cadastro DATE
);

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(60),
    preco_unitario NUMERIC(10,2),
    ativo BOOLEAN
);

CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    data_pedido DATE NOT NULL,
    canal_venda VARCHAR(30),
    status_pedido VARCHAR(20),
    desconto NUMERIC(10,2)
);

CREATE TABLE itens_pedido (
    id_item INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedidos(id_pedido),
    id_produto INTEGER NOT NULL REFERENCES produtos(id_produto),
    quantidade INTEGER NOT NULL,
    preco_praticado NUMERIC(10,2) NOT NULL
);

CREATE TABLE pagamentos (
    id_pagamento INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedidos(id_pedido),
    forma_pagamento VARCHAR(30),
    valor_pago NUMERIC(10,2),
    status_pagamento VARCHAR(20)
);

INSERT INTO clientes VALUES
(1,'Ana Souza','Osasco','SP','2025-01-10'),
(2,'Bruno Lima','São Paulo','SP','2025-02-15'),
(3,'Carla Mendes','Guarulhos','SP','2025-03-20'),
(4,'Diego Alves','Recife','PE','2025-04-05'),
(5,'Elisa Rocha','Salvador','BA','2025-05-12'),
(6,'Felipe Costa','Campinas','SP','2025-06-18'),
(7,'Gabriela Nunes','Curitiba','PR','2025-07-22'),
(8,'Heitor Santos','Rio de Janeiro','RJ','2025-08-09'),
(9,'Isabela Martins','Fortaleza','CE','2025-09-14'),
(10,'João Pereira','Osasco','SP','2025-10-01'),
(11,'Karen Oliveira','Belo Horizonte','MG','2025-11-11'),
(12,'Lucas Ferreira','São Paulo','SP','2026-01-08');

INSERT INTO produtos VALUES
(101,'Luminária LED','Iluminação',89.90,TRUE),
(102,'Abajur Madeira','Iluminação',149.90,TRUE),
(103,'Cadeira Office','Móveis',499.00,TRUE),
(104,'Mesa Compacta','Móveis',699.00,TRUE),
(105,'Vaso Cerâmica','Decoração',59.90,TRUE),
(106,'Quadro Abstrato','Decoração',119.90,TRUE),
(107,'Organizador Multiuso','Organização',39.90,TRUE),
(108,'Tapete Sala','Decoração',229.00,FALSE);

INSERT INTO pedidos VALUES
(1001,1,'2026-01-05','Site','Concluído',10.00),
(1002,2,'2026-01-08','Aplicativo','Concluído',0.00),
(1003,3,'2026-01-12','Loja física','Cancelado',0.00),
(1004,4,'2026-01-18','Site','Concluído',15.00),
(1005,5,'2026-02-02','Aplicativo','Concluído',5.00),
(1006,1,'2026-02-10','Site','Concluído',0.00),
(1007,6,'2026-02-14','Loja física','Concluído',20.00),
(1008,7,'2026-02-20','Site','Cancelado',0.00),
(1009,8,'2026-03-01','Aplicativo','Concluído',12.00),
(1010,9,'2026-03-04','Site','Concluído',0.00),
(1011,10,'2026-03-09','Loja física','Concluído',8.00),
(1012,11,'2026-03-15','Site','Concluído',0.00),
(1013,2,'2026-03-21','Aplicativo','Concluído',25.00),
(1014,3,'2026-04-02','Site','Concluído',10.00),
(1015,4,'2026-04-08','Loja física','Concluído',0.00),
(1016,5,'2026-04-12','Aplicativo','Cancelado',0.00),
(1017,6,'2026-04-19','Site','Concluído',18.00),
(1018,7,'2026-04-25','Site','Concluído',0.00),
(1019,8,'2026-05-03','Aplicativo','Concluído',5.00),
(1020,9,'2026-05-11','Loja física','Concluído',0.00),
(1021,10,'2026-05-17','Site','Concluído',30.00),
(1022,11,'2026-05-22','Aplicativo','Concluído',0.00),
(1023,12,'2026-06-01','Site','Concluído',10.00),
(1024,12,'2026-06-07','Aplicativo','Em análise',0.00);

INSERT INTO itens_pedido VALUES
(1,1001,101,2,89.90),(2,1001,105,1,59.90),
(3,1002,103,1,499.00),(4,1002,107,2,39.90),
(5,1003,102,1,149.90),
(6,1004,104,1,699.00),(7,1004,106,1,119.90),
(8,1005,105,3,59.90),(9,1005,107,2,39.90),
(10,1006,102,1,149.90),(11,1006,101,1,89.90),
(12,1007,103,2,499.00),
(13,1008,108,1,229.00),
(14,1009,106,2,119.90),(15,1009,105,2,59.90),
(16,1010,101,3,89.90),
(17,1011,107,4,39.90),(18,1011,105,2,59.90),
(19,1012,104,1,699.00),
(20,1013,103,1,499.00),(21,1013,102,1,149.90),
(22,1014,101,2,89.90),(23,1014,106,1,119.90),
(24,1015,104,1,699.00),(25,1015,107,3,39.90),
(26,1016,105,2,59.90),
(27,1017,103,1,499.00),(28,1017,108,1,229.00),
(29,1018,102,2,149.90),
(30,1019,106,1,119.90),(31,1019,107,2,39.90),
(32,1020,105,5,59.90),
(33,1021,104,1,699.00),(34,1021,101,2,89.90),
(35,1022,103,1,499.00),
(36,1023,107,3,39.90),(37,1023,105,1,59.90),
(38,1024,102,1,149.90);

INSERT INTO pagamentos VALUES
(1,1001,'Cartão de crédito',319.60,'Aprovado'),
(2,1002,'PIX',578.80,'Aprovado'),
(3,1003,'Cartão de crédito',149.90,'Estornado'),
(4,1004,'Boleto',803.90,'Aprovado'),
(5,1005,'PIX',253.60,'Aprovado'),
(6,1006,'Cartão de débito',239.80,'Aprovado'),
(7,1007,'Cartão de crédito',978.00,'Aprovado'),
(8,1008,'PIX',229.00,'Estornado'),
(9,1009,'PIX',347.60,'Aprovado'),
(10,1010,'Cartão de crédito',269.70,'Aprovado'),
(11,1011,'Dinheiro',271.40,'Aprovado'),
(12,1012,'Boleto',699.00,'Aprovado'),
(13,1013,'Cartão de crédito',623.90,'Aprovado'),
(14,1014,'PIX',289.70,'Aprovado'),
(15,1015,'Cartão de débito',818.70,'Aprovado'),
(16,1016,'PIX',119.80,'Estornado'),
(17,1017,'Cartão de crédito',710.00,'Aprovado'),
(18,1018,'PIX',299.80,'Aprovado'),
(19,1019,'Boleto',194.80,'Aprovado'),
(20,1020,'Cartão de crédito',299.50,'Aprovado'),
(21,1021,'PIX',848.70,'Aprovado'),
(22,1022,'Cartão de crédito',499.00,'Aprovado'),
(23,1023,'PIX',166.60,'Aprovado'),
(24,1024,'Cartão de crédito',149.90,'Pendente');
