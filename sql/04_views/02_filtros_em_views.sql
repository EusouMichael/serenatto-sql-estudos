--Podemos usar filtro e tratar os dados normalmente em uma VIEW
Select * from ViewValorTotal;

Select nome from ViewValorTotal;

Select * from ViewValorTotal
WHERE ValorTotal = 10;

Select * from ViewValorTotal
WHERE ValorTotal > 10;


Select * from ViewValorTotal
WHERE ValorTotal > 10 AND ValorTotal < 14;

SELECT * From ViewValorTotal
WHERE strftime ('%m', datahorapedido)='10'