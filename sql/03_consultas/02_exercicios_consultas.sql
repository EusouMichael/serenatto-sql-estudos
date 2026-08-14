/*
Traga todos os dados da cliente Maria Silva.
Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como entregue.
Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.
Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-30.
Recupere o nome do cliente que fez o primeiro pedido.
Liste os produtos que nunca foram pedidos.
Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.
Recupere os nomes dos produtos que estão em menos de 15 pedidos.
Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues".
Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.
*/


Select * From Clientes Where nome = 'Maria Silva';

Select * from Pedidos where status = 'Entregue';

Select * from Produtos where preco > 10 and preco < 15;

SELECT * from Colaboradores where BETWEEN '2022-01-01', '2022-06-30'
















