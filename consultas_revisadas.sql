-- VittaLar | Consultas SQL revisadas
-- Dialeto: SQLite
-- Consultas 1 a 10 do desafio. Versão revisada para estudo.

-- 1. Todos os clientes cadastrados
SELECT *
FROM clientes;

-- 2. Nome, categoria e preço unitário dos produtos
SELECT nome_produto, categoria, preco_unitario
FROM produtos;

-- 3. Pedidos concluídos
SELECT *
FROM pedidos
WHERE status_pedido = 'Concluído';

-- 4. Pedidos entre 01/03/2026 e 30/04/2026
SELECT *
FROM pedidos
WHERE data_pedido >= '2026-03-01'
  AND data_pedido <= '2026-04-30';

-- 5. Cinco produtos mais caros
SELECT nome_produto, preco_unitario
FROM produtos
ORDER BY preco_unitario DESC
LIMIT 5;

-- 6. Quantidade de pedidos por status
SELECT
    status_pedido,
    COUNT(*) AS quantidade_pedidos
FROM pedidos
GROUP BY status_pedido;

-- 7. Preço médio dos produtos por categoria
SELECT
    categoria,
    ROUND(AVG(preco_unitario), 2) AS preco_medio
FROM produtos
GROUP BY categoria;

-- 8. Quantidade de pedidos por canal de venda
-- COUNT(*) conta os pedidos em cada canal; SUM(canal_venda) não se aplica
-- porque canal_venda é um campo textual.
SELECT
    canal_venda,
    COUNT(*) AS quantidade_pedidos
FROM pedidos
GROUP BY canal_venda;

-- 9. Total de unidades vendidas por produto em pedidos concluídos
SELECT
    pr.nome_produto,
    SUM(ip.quantidade) AS unidades_vendidas
FROM produtos AS pr
INNER JOIN itens_pedido AS ip
    ON pr.id_produto = ip.id_produto
INNER JOIN pedidos AS pe
    ON ip.id_pedido = pe.id_pedido
WHERE pe.status_pedido = 'Concluído'
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY unidades_vendidas DESC;

-- 10. Categorias com preço médio superior a R$ 100
-- HAVING filtra os grupos após o GROUP BY.
SELECT
    categoria,
    ROUND(AVG(preco_unitario), 2) AS preco_medio
FROM produtos
GROUP BY categoria
HAVING AVG(preco_unitario) > 100;
