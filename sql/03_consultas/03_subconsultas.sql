--Utilizando subconsultas para unir dados e aninhar consultas
--Buscar um unico valor usando sinal de igualdade '='
Select nome, telefone from Clientes
where ID = (Select id_cliente From Pedidos
WHERE datahorapedido = '2023-01-02 08:15:00');


--Extrair consulta por uma Data
-- Buscando mais de um valor usando a sintax 'IN'
Select id_cliente From Pedidos
WHERE strftime ('%m', datahorapedido)='01';

SELECT nome from Clientes
WHERE id IN (Select ID_Cliente From Pedidos
WHERE strftime ('%m', datahorapedido)='01'
);
--================================================================

SELECT avg(preco) from Produtos;

Select nome, preco
From Produtos
Group BY nome, preco
HAVING preco > (SELECT avg(preco) from Produtos);			--Usando Having para valores agregados juntos ou Group By
