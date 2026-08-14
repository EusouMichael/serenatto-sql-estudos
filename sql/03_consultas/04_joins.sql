--Juntando dados por chaves na busca
Select * from Clientes;

Select * from Pedidos;

--fazer referencias de campos no select para saber de quais tabelas irão vir as buscas
Select c.nome, p.ID,p.DataHoraPedido
from Clientes c
INNER JOIN Pedidos p														--Usando INNER JOIN
	on c.ID = p.ID_Cliente;
--=====================================================================================================

sELECT * FROM Produtos;

iNSERT INTO Produtos(ID,Nome,Descricao,Preco,Categoria)
VALUES (31,'Lasanha à Bolonhesa','Deliciosa lasanha caseira com molho bolonhesa',12.50,'Almoço');

--Quais produtos foram ou não vendidos. Usaremos consultas e subconsultas 
--Observar os alias dado as tabelas (siglas ou letras para diferenciar quem é quem mais facil)
Select pr.Nome, x.ID_Produto, x.ID_Pedido 
from (
  Select ip.ID_Pedido,ip.ID_Produto 
  from Pedidos p
  INNER JOIN Itens_Pedido ip												--INNER Join como subconsulta
	on p.id = ip.ID_Pedido
	WHERE strftime ('%m', datahorapedido)='10'  
) x
RIGHT JOIN Produtos pr														--Usando RIGHT JOIN
	ON pr.ID = x.ID_Produto;
--============================================================================================================

Select * from Clientes c;
Select * from Pedidos p;

Select c.nome, x.ID
From Clientes c
LEFT JOIN (																--Usando LEFT JOIN
  SELECT p.ID,p.ID_Cliente
from Pedidos p
WHERE strftime ('%m', datahorapedido)='10' 
) x															
	ON c.ID = x.ID_Cliente
WHERE x.ID_Cliente IS NULL;
--===============================================================================================================

Select * from Clientes;

Select c.ID, c.Nome, p.ID, p.Status 
From Clientes c
FULL JOIN Pedidos p														--FULL JOIN
	on c.ID = p.ID_Cliente
WHERE p.id IS NULL ;








