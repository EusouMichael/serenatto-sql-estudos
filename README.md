# Serenatto Café & Bistrô — Estudos Práticos de SQL

Projeto de estudos em **SQL e banco de dados relacional**, baseado no cenário da Serenatto Café & Bistrô e desenvolvido com **SQLite**.

## 🎯 Objetivo

Praticar, de forma progressiva, a criação, carga, consulta e manipulação de um banco de dados relacional, explorando recursos importantes da linguagem SQL.

O cenário proposto envolve a centralização de informações da empresa em um único banco de dados, utilizando SQLite para criar tabelas e executar consultas.

## 🗂️ Estrutura do projeto

```text
serenatto-sql-estudos/
├── database/
│   ├── SQLite_base.db
│   └── SQLite_2_final_estudo.db
├── docs/
│   └── anotacoes-do-estudo.md
├── sql/
│   ├── 01_modelagem/
│   ├── 02_carga_dados/
│   ├── 03_consultas/
│   ├── 04_views/
│   ├── 05_triggers/
│   └── 06_atualizacoes_transacoes/
├── .gitignore
└── README.md
```

## 📚 Conteúdos praticados

### 1. Modelagem

- `CREATE TABLE`
- Chaves primárias
- Chaves estrangeiras
- `NOT NULL`
- `DEFAULT`
- `ON DELETE CASCADE`
- Chave composta em `Itens_Pedido`

### 2. Carga de dados

- `INSERT INTO`
- Inserção de produtos, clientes, colaboradores, fornecedores, pedidos e itens de pedidos

### 3. Consultas SQL

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- Funções de agregação
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL JOIN`
- Subconsultas
- `IN`
- `UNION`
- `UNION ALL`

### 4. Views

- Criação de `VIEW`
- Consultas sobre views
- Aplicação de filtros em views
- Uso de views para simplificar consultas e controlar a exposição de informações

### 5. Triggers

- Criação de trigger `AFTER INSERT`
- Atualização automática de uma tabela de faturamento diário
- Teste do comportamento da trigger após inserções em `Itens_Pedido`

### 6. Atualização e integridade

- `PRAGMA FOREIGN_KEY = ON`
- `UPDATE`
- `DELETE`
- `ON DELETE CASCADE`
- Conceitos de `COMMIT` e `ROLLBACK`

## 🗄️ Banco de dados

Foram mantidas duas versões do banco utilizadas durante os estudos:

- **`SQLite_base.db`** — estado inicial/base dos exercícios.
- **`SQLite_2_final_estudo.db`** — versão posterior utilizada durante os estudos, incluindo a tabela `Faturamento_Diario` usada no exercício de trigger.

## ⚠️ Observações

Este é um **repositório educacional**, criado para registrar a evolução prática nos estudos de SQL.

Alguns exercícios permanecem em desenvolvimento. Antes de utilizar os scripts em um ambiente de produção, é necessário revisar sintaxe, nomes de tabelas e colunas, regras de integridade, consultas incompletas e cálculos específicos de cada exercício.

## 🚀 Próximos passos

- Revisar e corrigir exercícios em desenvolvimento
- Separar scripts de estudo e scripts finalizados
- Criar consultas analíticas mais completas
- Documentar o modelo relacional
- Adicionar exemplos práticos de transações com `COMMIT` e `ROLLBACK`
- Evoluir o projeto para análises de negócio

## 🛠️ Tecnologias

- **SQL**
- **SQLite**
- **Banco de Dados Relacional**

---

📌 **Objetivo do repositório:** registrar a evolução prática nos estudos de SQL e construir uma base de projetos para portfólio na área de Dados.
