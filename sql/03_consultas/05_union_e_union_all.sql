--Fazendo união entre Tabelas, mas somente quando estiverem mesmo campo de consulta

SELECT rua, bairro, cidade, estado, cep 
From Colaboradores
UNION												-- Para fazer união entre Tabelas, mas apenas 'UNION' exclue duplicidade
SELECT rua, bairro, cidade, estado, cep 
From Fornecedores;
--=================================================================================

SELECT nome, rua, bairro, cidade, estado, cep 
From Colaboradores
UNION all												-- Para fazer união entre Tabelas, mas 'UNION ALL' traz valores repetidos
SELECT nome, rua, bairro, cidade, estado, cep 
From Fornecedores;
