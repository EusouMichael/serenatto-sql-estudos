-- Descobrir faturamento diário
Select * From Pedidos;

Select * from Itens_Pedido;

Select Date(datahorapedido) as Dia, sum(ip.PrecoUnitario) as FatDiário			--Faz a soma diária
From Pedidos p 
JOIN Itens_Pedido ip															--Um JOIN de PEDIDOS E ITENS_PEDIDOS
	on p.ID = ip.ID_Pedido
GROUP by Dia																	--Agrupando e ordenando pelo DIA
ORDER BY Dia;

--TRIGGER (GATILHO)
CREATE TABLE Faturamento_Diario(												--Fizemos a criação de mais uma tabela chamada FATURAMENTO_DIARIO
  Dia Date,																		--Campos de dia e faturamento
  FaturamentoTotal decimal (10,2)
);

INSERT into Faturamento_Diario(dia, faturamentototal)							--Inserimos dados de pesquisa na tabela FATURAMENTO_DIARIO
Select Date(datahorapedido) as Dia, sum(ip.PrecoUnitario) as FatDiário
From Pedidos p 
JOIN Itens_Pedido ip
	on p.ID = ip.ID_Pedido
GROUP by Dia
ORDER BY Dia

SELECT * from Faturamento_Diario												--Conferencia se deu bom a inserção



Create TRIGGER CalculaFaturamentoDiario											--Criação da trigger
AFTER INSERT on Itens_Pedido													--A trigger só sera acionada quando houver mudança 
for EACH ROW 																	--nos dados da tabela Itens_Pedido			
BEGIN
DELETE from Faturamento_Diario;
INSERT into Faturamento_Diario(dia, faturamentototal)
Select Date(datahorapedido) as Dia, sum(ip.PrecoUnitario) as FatDiário
From Pedidos p 
JOIN Itens_Pedido ip
	on p.ID = ip.ID_Pedido
GROUP by Dia
ORDER BY Dia;
end; 







