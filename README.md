# Prática em SQL | Análise de Dados — VittaLar

Projeto de estudo desenvolvido para praticar consultas SQL a partir de uma base de dados fictícia de uma empresa varejista chamada **VittaLar**.

O desafio simula demandas simples de uma área comercial, envolvendo informações de clientes, produtos, pedidos, itens vendidos e pagamentos.

## Objetivo

Consolidar fundamentos de SQL e exercitar a transformação de perguntas de negócio em consultas capazes de recuperar e organizar informações.

## Ferramentas

- **SQLite** — banco de dados utilizado na prática
- **SQL** — linguagem de consulta
- **DB Browser for SQLite** (ou ferramenta equivalente) — ambiente para executar e visualizar as consultas

## Estrutura do repositório

```text
SQL-Pratica-VittaLar/
├── banco_vittalar.sql
├── consultas_revisadas.sql
├── desafio.md
├── README.md
└── imagens/
    └── pratica-sql-vittalar.jpg
```

## Modelo de dados

A base possui cinco tabelas:

| Tabela | Conteúdo |
|---|---|
| `clientes` | Cadastro e localização dos clientes |
| `produtos` | Nome, categoria e preço dos produtos |
| `pedidos` | Data, canal de venda, status e desconto |
| `itens_pedido` | Produtos, quantidades e preços praticados em cada pedido |
| `pagamentos` | Forma, valor e status dos pagamentos |

Relacionamentos principais:

- `clientes` → `pedidos`
- `pedidos` → `itens_pedido`
- `produtos` → `itens_pedido`
- `pedidos` → `pagamentos`

## Conteúdos praticados

- `SELECT` e `FROM`
- `WHERE` e operadores lógicos
- Filtros por período
- `ORDER BY` e `LIMIT`
- Funções de agregação, como `COUNT` e `AVG`
- `GROUP BY`

## Como executar

1. Baixe ou clone este repositório.
2. Abra o DB Browser for SQLite (ou outro cliente SQLite).
3. Crie um banco de dados SQLite vazio.
4. Abra e execute o arquivo `banco_vittalar.sql` na área de execução SQL.
5. Abra `consultas_revisadas.sql` para executar as consultas de prática.

> Observação: o script de criação e carga utiliza comandos SQL básicos compatíveis com SQLite. O arquivo foi preparado para este exercício e deve ser executado em um banco vazio.

## Sobre o processo de aprendizagem

Este repositório registra uma etapa de prática e consolidação dos fundamentos de SQL. O desafio original foi organizado em 15 questões, distribuídas entre níveis básico e intermediário.

Na primeira etapa, foram trabalhadas as dez primeiras questões. A resolução foi revisada posteriormente para identificar ajustes necessários, especialmente em funções de agregação, agrupamentos e relacionamentos entre tabelas.

As consultas presentes em `consultas_revisadas.sql` representam uma versão de estudo revisada — não necessariamente a primeira tentativa realizada durante o desafio.

O objetivo é documentar a evolução do aprendizado, reconhecer pontos de melhoria e ampliar gradualmente a complexidade das análises.

---

**Projeto fictício, desenvolvido para fins educacionais e de portfólio.**
