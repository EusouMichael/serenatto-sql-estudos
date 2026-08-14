/*crie uma consulta que busque o total dos pedidos feitos por cada cliente. 
A tabela "Clientes" contém informações sobre os clientes, enquanto a tabela "Pedidos" registra
informações sobre os pedidos feitos por esses clientes. Em ItensPedidos, você encontra as informações
de quantidade vendida de cada produto e o preço unitário.
*/

Select * from Pedidos;
Select * from Itens_Pedido;
--==============

Select p.ID, ip.Quantidade,  pr.Preco, ip.PrecoUnitario
From Pedidos p
JOIN Itens_Pedido ip
	on p.ID = ip.ID_Pedido
JOIN Produtos pr
	ON pr.ID = ip.ID_Produto;
--===============    

Select p.ID, c.Nome, Sum(ip.PrecoUnitario) as ValorTotal 
from Clientes c
join Pedidos p 
	on c.ID = p.ID_Cliente
join Itens_Pedido ip
	on p.ID = ip.ID_Pedido
Group by p.ID, c.Nome



