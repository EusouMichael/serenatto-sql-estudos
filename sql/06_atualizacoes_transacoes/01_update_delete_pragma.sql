/*Iremos atualizar a base de dados de Produtos.
Um ponto muito importante O SQLITE ONLINE "Ele não valida chaves estrangeiras"
isso é configuração padrão apenas do SQLITE ONLINE para isso usamos o "PRAGMA"
Observe que cada SGBD tem sua particularidade
*/

PRAGMA FOREIGN_key = ON;			--usando pragma para atualizar e validar as chaves estrangeiras

Select * from Produtos;

select * from Produtos WHERE id= 31;			--Vamos alterar o valor do produto de ID 31 de 12.50 para 13
												--Não esqueça de utilizar o WHERE para mudar apenas do produto selecionada
UPDATE Produtos SET preco = 13.0 where id = 31;	--Não utilizando a clausula WHERE o valor de TODOS os produtos irão modificar
--===============================================================================================================
--Iremos modificar descrição do produto 'Croissant'
--Usaremos a clausula LIKE para ver ID e quantos produtos tem e quais queremos modificar
SELECT * FROM Produtos WHERE nome LIKE 'Croissant%';	

UPDATE Produtos set descricao = 'Croissant recheado com amêndoas' where id = 28;	--
--================================================================================================================
--Exclusão de dados
SELECT * from Colaboradores where id = 3;

DELETE from Colaboradores WHERE id = 3;
--=================================================================================================================

--Fazendo exclusão de clientes que ja fez pedidos e existe ID em outras tabelas tambem como Pedidos e itens_pedidos
--Como usado o 'ON DELETE CASCADE' todos os dados serão excluidos de todas as tabelas
Select * from Clientes where id =27;
Select * from Pedidos where id_cliente=27;
Select * from Itens_Pedido where id_pedido = 451;

DELETE FROM Clientes where id = 27;
--Muita cautela ao usar o DELETE CASCADE (analise o contexto e criação da base)
--=================================================================================================================

--Blocos de Transações "BEGIN TRANSACTION", "ROLLBACK" e "COMMIT"

UPDATE Pedidos SET status = 'Concluído' where 


