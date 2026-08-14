--Testando se o trigger esta funcionando 
Select * from Faturamento_Diario;

--Inserindo novos dados para ver se ele atualiza automaticamente
INSERT INTO Pedidos (ID, ID_Cliente, DataHoraPedido, Status)
VALUES(453,29,'2023-10-08 14:30:00','Em Andamento');

--lembrando que ele só ativa quando modificar a ITENS_PEDIDO
INSERT INTO Itens_Pedido (ID_Pedido, ID_Produto,Quantidade, PrecoUnitario)
VALUES (453,10,1,5.0),
		(453,31,1,12.50);
        
        
SELECT * from Pedidos;

SELECT * from Itens_Pedido;

SELECT * FROM Clientes