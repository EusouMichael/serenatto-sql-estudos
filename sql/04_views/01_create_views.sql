--Criando Views para otimização de buscas e salvar resultados para buscas posteriormente 

CREATE VIEW ViewCliente as 
Select nome, endereco from Clientes

Select * from ViewCliente
--=========================

CREATE view ViewValorTotal AS
Select p.DataHoraPedido,p.ID, c.Nome, Sum(ip.PrecoUnitario) as ValorTotal 
from Clientes c
join Pedidos p 
	on c.ID = p.ID_Cliente
join Itens_Pedido ip
	on p.ID = ip.ID_Pedido
Group by p.ID, c.Nome;

Select * from ViewValorTotal
