Conhecendo o projeto  
Durante os nossos estudos, vamos conhecer o projeto da empresa Serenatto café e bistrô. Atualmente, a empresa armazena as suas informações em diversas fontes de dados, e nosso trabalho é centralizar todos esses dados em um só lugar e extrair informações essenciais para os gestores da empresa. Então, vamos utilizar o SQLite Online, para criar as nossas tabelas e executar as nossas consultas utilizando a linguagem SQL.

Então, para desenvolver o projeto, vamos iniciar conhecendo as informações necessárias para criar as nossas tabelas:

Produtos:  
ID: Chave primária.  
Nome: Nome do produto (café, bebidas, pratos, sobremesas, etc.).  
Descrição: Descrição do produto.  
Preço: Preço do produto.  
Categoria: Categoria do produto (café, chá, almoço, jantar, sobremesa, etc.).

Clientes:  
ID: Chave primária.  
Nome: Nome completo do cliente.  
Telefone: Número de telefone do cliente.  
Email: Endereço de e-mail do cliente.  
Endereco: Endereço do cliente.

Pedidos:  
ID: Chave primária.  
IDCliente: Chave estrangeira relacionando ao cliente.  
DataHoraPedido: Data e hora do pedido.  
Status: Status do pedido (em andamento, concluído, entregue, etc.).

Itens de Pedido:  
IDPedido: Chave estrangeira relacionando ao pedido.  
IDProduto: Chave estrangeira relacionando ao produto.  
Quantidade: Quantidade do produto no pedido.  
PrecoUnitario: Preço unitário do produto no momento do pedido.

Colaboradores:  
ID: Chave primária.  
Nome: Nome completo do colaborador.  
Cargo: Cargo ou posição do colaborador.  
DataContratacao: Data de contratação.  
Telefone: Número de telefone do colaborador.  
Email: Endereço de e-mail do colaborador.

Fornecedores:  
ID: Chave primária.  
Nome: Nome da empresa do fornecedor.  
Contato: Nome do contato no fornecedor.  
Telefone: Número de telefone do fornecedor.  
Email: Endereço de e-mail do fornecedor.

Manipulação de valores default em bancos de dados  

Quando você está aprendendo sobre bancos de dados, um dos conceitos importantes que você encontrará é o uso de valores padrão, ou "default values". Valores padrão são aqueles que o banco de dados automaticamente atribui a um campo quando um novo registro é criado, caso nenhum outro valor seja fornecido. Agora, vamos explorar por que isso é útil e como pode influenciar a consistência dos seus dados.

Por que utilizar valores padrão?  
Imagine que você tem um formulário de inscrição para um evento online. Algumas informações são cruciais, como nome e e-mail, mas outras, como o telefone de contato, podem ser opcionais. Se o usuário não preencher o campo do telefone, o que acontece quando essa informação é enviada para o banco de dados? É aí que o valor padrão entra.

Se você definir um valor padrão para o campo do telefone, como "Não fornecido", sempre que um registro for criado sem um número de telefone, o banco de dados irá automaticamente preencher esse campo com "Não fornecido". Isso ajuda a manter a consistência dos dados, evitando campos completamente vazios, que podem causar confusão ou erros em relatórios e análises futuras.

Como definir valores padrão?  
A definição de valores padrão geralmente é feita durante a criação da tabela no banco de dados. Vamos ver um exemplo de código SQL que cria uma tabela com um valor padrão:

'Copiar'  
CREATE TABLE inscricoes\_evento (  
    id INT AUTOINCREMENT PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL,  
    telefone VARCHAR(20) DEFAULT 'Não fornecido'  
);

Neste exemplo, estamos criando uma tabela chamada inscricoes\_evento, com campos para id, nome, email e telefone. O campo telefone tem um valor padrão definido como 'Não fornecido'. Isso significa que, se uma nova inscrição for inserida sem um número de telefone, o banco de dados irá automaticamente salvar 'Não fornecido' naquele campo.

Consequências para a consistência de dados  
Usar valores padrão ajuda a manter a integridade e a consistência dos dados. Sem eles, você poderia acabar com muitos campos nulos (vazios), o que pode complicar a análise de dados. Por exemplo, se você tentar contar quantas pessoas não forneceram um número de telefone e o campo é nulo, você terá que tratar esses casos especiais em suas consultas e relatórios.

Por outro lado, valores padrão inadequados podem levar a informações enganosas. Se você definir um valor padrão que não faz sentido para o contexto, como um número de telefone padrão '123456789', isso pode distorcer sua compreensão dos dados. As pessoas podem assumir que é um número real, quando, na verdade, é apenas um substituto para um campo vazio.

Motivação  
A teoria por trás dos valores padrão é baseada na ideia de que a informação completa e consistente é fundamental para a integridade dos dados. Dados consistentes são mais fáceis de analisar, entender e manter. A motivação para usar valores padrão está em garantir que todas as entradas no banco de dados tenham valores significativos e previsíveis.

Em resumo, valores padrão são uma ferramenta poderosa para manter a consistência dos dados em um banco de dados. Eles são úteis não apenas para preencher informações que podem não ser fornecidas pelo usuário, mas também para garantir que os dados permaneçam limpos e confiáveis. Ao projetar suas tabelas de banco de dados, considere cuidadosamente quais campos podem se beneficiar de valores padrão e quais valores fazem sentido para o contexto dos seus dados.

Recuperando o banco de dados  
  
Após finalizar a importação dos nossos dados para as tabelas do nosso banco de dados no SQLite online, é importante que seja realizado o salvamento do arquivo do nosso banco de dados. Ao fechar o nosso navegador, podemos perder os dados salvos no SQLite online, já que ele não possui um servidor, como outros SGBDs.

Salvando arquivo do banco de dados  
Na lateral esquerda no SQLite online, clique em SQLite com o botão direito do mouse e selecione a opção Save SQLite DB:

![][image1]  
Dessa forma, o arquivo será salvo no diretório de download do seu computador.

Abrindo arquivo do banco de dados  
Para abrir um arquivo, acesse o menu superior no SQLite online, clique no ícone de "discos empilhados" e selecione a opção Open SQLite DB:

![][image2]

Pronto, dessa forma, você sempre terá uma cópia do seu banco de dados para acessar sempre que necessário.

Conhecendo o EXCEPT e INTERSECT  
  
Além do UNION e UNION ALL, em alguns SGBDs podemos ter também os operadores EXCEPT e INTERSECT, que são dois operadores relacionais que são usados em consultas SQL para realizar operações de conjunto em tabelas ou resultados de consultas. Eles permitem que você compare conjuntos de dados entre duas consultas e extraia informações específicas com base nas diferenças ou semelhanças entre esses conjuntos.

1 \- EXCEPT:

O operador EXCEPT é usado para retornar todas as linhas que estão presentes na primeira consulta (conjunto A) e não estão presentes na segunda consulta (conjunto B). Em outras palavras, ele subtrai o conjunto B do conjunto A. A sintaxe geral é a seguinte:

Copiar  
SELECT colunas FROM tabelaA  
EXCEPT  
SELECT colunas FROM tabelaB;

Exemplo:

Suponha que você tenha duas tabelas, TabelaA e TabelaB, e deseje encontrar todas as linhas de TabelaA que não estão em TabelaB. Você pode usar o EXCEPT da seguinte forma:

Copiar  
SELECT \* FROM TabelaA  
EXCEPT  
SELECT \* FROM TabelaB;

2 \- INTERSECT:

O operador INTERSECT é usado para retornar todas as linhas que estão presentes tanto na primeira consulta (conjunto A) quanto na segunda consulta (conjunto B). Em outras palavras, ele retorna a interseção dos dois conjuntos. A sintaxe geral é a seguinte:

Copiar  
SELECT colunas FROM tabelaA  
INTERSECT  
SELECT colunas FROM tabelaB;

Exemplo:

Suponha que você tenha duas tabelas, TabelaA e TabelaB, e deseje encontrar todas as linhas que estão presentes em ambas as tabelas. Você pode usar o INTERSECT da seguinte forma:

Copiar  
SELECT \* FROM TabelaA  
INTERSECT  
SELECT \* FROM TabelaB;

Observações importantes:

As duas consultas dentro de EXCEPT ou INTERSECT devem retornar o mesmo número de colunas e essas colunas devem ter tipos de dados compatíveis.  
EXCEPT e INTERSECT geralmente são usados em consultas SELECT, mas também podem ser usados em subconsultas ou em combinação com outros operadores SQL, como UNION.  
Esses operadores são úteis para encontrar diferenças ou semelhanças entre conjuntos de dados, o que pode ser valioso em situações como validação de dados, comparação de listas e muito mais. Eles são especialmente úteis quando você precisa realizar operações complexas de conjunto em dados de tabelas relacionadas.

Diferenças entre WHERE e HAVING em SQL  
  
Quando você está aprendendo a linguagem SQL, que é usada para comunicar e gerenciar dados em bancos de dados, você encontrará dois comandos muito importantes: WHERE e HAVING. À primeira vista, eles podem parecer fazer a mesma coisa, pois ambos filtram os dados que você obtém de uma consulta. No entanto, há diferenças cruciais entre eles, que afetam como você vai usar cada um em suas consultas SQL.

O comando WHERE  
O WHERE é usado para filtrar registros (linhas) com base em condições específicas que você define. Ele é aplicado antes que os dados sejam agrupados pela cláusula GROUP BY. Isso significa que você pode usar WHERE para filtrar as linhas individuais de dados antes de qualquer outra operação.

Exemplo com WHERE:

Copiar  
SELECT nome, idade  
FROM pessoas  
WHERE idade \>= 18;

Neste exemplo, estamos selecionando nomes e idades de uma tabela chamada pessoas, mas só queremos os registros onde a idade é maior ou igual a 18\. O WHERE está sendo usado para filtrar esses registros antes que sejam exibidos na resposta à consulta.

O comando HAVING  
Em contrapartida, o HAVING é usado para filtrar dados depois que eles foram agrupados com a cláusula GROUP BY. Isso é útil quando você quer aplicar uma condição de filtro não nas linhas individuais, mas nos grupos resultantes. HAVING é frequentemente usado com funções de agregação, como COUNT(), SUM(), AVG(), etc.

Exemplo com HAVING:

Copiar  
SELECT cidade, COUNT(\*)  
FROM pessoas  
GROUP BY cidade  
HAVING COUNT(\*) \> 5;

Neste exemplo, estamos contando o número de pessoas em cada cidade na tabela pessoas. Queremos apenas exibir as cidades que têm mais de 5 pessoas. A cláusula HAVING COUNT(\*) \> 5 é usada após a criação dos grupos para filtrar apenas aqueles grupos (cidades) que têm mais de 5 pessoas.

Motivação  
Quando você está trabalhando com grandes conjuntos de dados, muitas vezes é necessário organizar e filtrar esses dados para fazer análises significativas. Por exemplo, se você está gerenciando um negócio, pode querer saber quais produtos são mais populares ou quais cidades têm o maior número de clientes. Usar WHERE e HAVING corretamente permite que você obtenha essas informações de maneira eficiente.

Use WHERE quando precisar de uma condição para filtrar linhas antes de qualquer agrupamento.  
Use HAVING quando precisar aplicar um filtro depois de agrupar as linhas, especialmente quando estiver usando funções de agregação.  
Conclusão  
Entender a diferença entre WHERE e HAVING é fundamental para fazer consultas SQL eficientes e precisas. Lembre-se de que WHERE é para filtrar antes do agrupamento e HAVING é para filtrar depois do agrupamento. Ao dominar essas duas cláusulas, você será capaz de manipular e analisar dados de bancos de dados com muito mais confiança e habilidade.

Entendendo o JOIN em bancos de dados  
 
Imagine que você tem um quebra-cabeça: cada peça representa uma informação que está guardada em uma tabela diferente no seu banco de dados. Para ver a imagem completa, você precisa encaixar essas peças. No mundo dos bancos de dados, esse "encaixe" é feito através de uma operação chamada JOIN.

O que é JOIN?  
JOIN é um comando usado em SQL (a linguagem de consulta de bancos de dados) para combinar linhas de duas ou mais tabelas, baseado em uma coluna relacionada entre elas. Isso é muito útil quando você quer ver informações que estão distribuídas em diferentes tabelas.

Tipos de JOIN  
Há vários tipos de JOIN, mas vamos focar nos mais comuns:

INNER JOIN: Combina linhas de duas tabelas quando há uma correspondência entre as colunas especificadas. Se não houver correspondência, a linha não aparece no resultado.

LEFT JOIN (ou LEFT OUTER JOIN): Retorna todas as linhas da tabela da esquerda (a primeira mencionada) e as linhas correspondentes da tabela da direita. Se não houver correspondência, os resultados da tabela da direita terão valores NULL.

RIGHT JOIN (ou RIGHT OUTER JOIN): É o oposto do LEFT JOIN. Retorna todas as linhas da tabela da direita e as correspondentes da esquerda. Novamente, se não houver correspondência, os resultados da tabela da esquerda terão valores NULL.

FULL JOIN (ou FULL OUTER JOIN): Combina as linhas de ambas as tabelas. Se não houver correspondência, ainda assim as linhas serão mostradas, com NULL no lado sem correspondência.

Motivação para Usar JOIN  
A principal razão para usar JOIN é que, em muitos casos, os dados que precisamos estão espalhados em várias tabelas. JOINs nos permitem combinar esses dados de maneira significativa para relatórios, análises e tomada de decisão.

Conclusão  
JOIN é uma ferramenta poderosa em SQL que nos ajuda a conectar as peças do quebra-cabeça dos nossos dados. Se você está aprendendo sobre bancos de dados, entender como os JOINs funcionam é essencial para manipular e compreender as informações de forma eficaz. Experimente os diferentes tipos de JOIN e veja como eles podem resolver problemas complexos de junção de dados\!

Conhecendo o CROSS JOIN  

O CROSS JOIN no SQL é um tipo de junção que combina todas as linhas de uma tabela com todas as linhas de outra tabela, criando um produto cartesiano. Em outras palavras, ele forma todas as combinações possíveis de registros entre as duas tabelas envolvidas na junção. O resultado é uma tabela resultante que contém o número de linhas igual ao produto do número de linhas das duas tabelas originais.

Aqui está uma sintaxe simplificada do CROSS JOIN:

Copiar  
SELECT colunas  
FROM tabela1  
CROSS JOIN tabela2;

Pontos importantes sobre o CROSS JOIN:  
Combinação Completa: O CROSS JOIN não utiliza uma condição de correspondência específica, ele simplesmente combina todas as linhas da primeira tabela com todas as linhas da segunda tabela. Isso significa que ele gera todas as combinações possíveis, mesmo que não haja relação lógica entre os dados.

Grande Número de Linhas: O uso imprudente do CROSS JOIN pode resultar em um grande número de linhas na tabela resultante, o que pode afetar o desempenho e a eficiência das consultas.

Uso Limitado: O CROSS JOIN é usado com menos frequência do que outros tipos de junções, como INNER JOIN, LEFT JOIN e RIGHT JOIN, porque geralmente não é necessário combinar todas as linhas de duas tabelas. No entanto, pode ser útil em casos específicos, como ao gerar combinações de valores para análises estatísticas.

Exemplo Prático  
Um exemplo prático de CROSS JOIN seria gerar todas as combinações possíveis de produtos em um catálogo com todas as categorias disponíveis. Cada produto seria combinado com cada categoria, independentemente de qualquer relação de categoria real.

Copiar  
SELECT Produto.Nome, Categoria.Nome  
FROM Produto  
CROSS JOIN Categoria;

Em resumo, o CROSS JOIN é uma junção que combina todas as linhas de duas tabelas sem considerar uma condição de correspondência específica. Deve ser usado com cautela, pois pode criar resultados volumosos e não relacionados, geralmente sendo mais apropriado em situações específicas em que todas as combinações possíveis são necessárias.

Segurança em Views \- Proteção e controle de dados  
  
Quando estamos lidando com bancos de dados, muitas vezes queremos mostrar informações para os usuários, mas sem expor dados sensíveis ou permitir que eles façam alterações que não deveriam. Aqui entra o conceito de "views", que são como janelas através das quais podemos ver os dados do banco de forma segura e controlada.

O que são Views?  
Imagine que o banco de dados é uma casa cheia de cômodos (tabelas) com vários objetos (dados). Uma view é como uma janela específica que foi desenhada para permitir que as pessoas de fora vejam apenas uma parte da casa ou apenas alguns objetos específicos, sem poder entrar ou mexer em nada.

No mundo dos bancos de dados, uma view é uma tabela virtual que mostra dados de uma ou mais tabelas. Ela é criada através de uma consulta SQL e pode ser usada para:

Simplificar consultas complexas;  
Limitar o acesso a dados sensíveis;  
Apresentar uma estrutura de dados personalizada para diferentes usuários.  
Uso de Views para Dados Sensíveis  
As views podem ser configuradas para proteger dados sensíveis. Por exemplo, se tivermos dados como salários ou informações médicas, podemos criar uma view que não inclui essas colunas:

Copiar  
CREATE VIEW view\_funcionario\_seguro AS  
SELECT id, nome, departamento FROM funcionarios;

Isso significa que mesmo que alguém tenha acesso à view view\_funcionario\_seguro, essa pessoa não verá os salários dos funcionários.

Motivação para Uso de Views  
A motivação para usar views em questões de segurança é simples: proteger informações e garantir que cada usuário acesse apenas o que precisa para suas tarefas. Isso ajuda a prevenir vazamentos de dados, acessos não autorizados e possíveis fraudes.

Teoria e Boas Práticas  
Princípio do Menor Privilégio: Sempre dê aos usuários o mínimo de acesso necessário.  
Segregação de Dados: Use views para separar dados sensíveis dos demais e limitar quem pode vê-los.  
Views de Auditoria: Crie views que facilitam o rastreamento de atividades para auditorias de segurança.  
Cuidados ao trabalhar com Views  
Use nomes claros: Dê nomes que façam sentido para a "view", assim como você faz com pastas no seu computador.  
Não abuse das views: Criar muitas "views" pode tornar o sistema confuso e lento.  
Documente as views: Mantenha uma documentação de quais "views" existem e o que elas mostram, para que as pessoas saibam como usá-las.  
Teste o desempenho: Como "views" são baseadas em consultas, elas podem ser lentas se a consulta for complexa. Teste e otimize as consultas quando necessário.  
Atualize quando necessário: Às vezes, a estrutura do banco de dados muda. Quando isso acontecer, lembre-se de atualizar as "views" para refletir essas mudanças.  
Lembre-se: a segurança dos dados é crucial, e as views são ferramentas poderosas para ajudar a manter essa segurança. Use-as com sabedoria e sempre mantenha-se atualizado sobre as melhores práticas de segurança em bancos de dados.

TRIGGER com DELETE e UPDATE  

Uma trigger em um banco de dados é um tipo de procedimento armazenado que é automaticamente executado em resposta a um evento específico, como uma instrução DELETE ou UPDATE sendo executada em uma tabela. As triggers são usadas para automatizar tarefas, impor regras de integridade, auditar ações e realizar outras ações automaticamente em um banco de dados.

Existem dois tipos principais de triggers relacionadas a instruções DELETE e UPDATE:

Trigger com DELETE:  
Uma trigger com DELETE é uma trigger que é acionada automaticamente quando uma instrução DELETE é executada em uma tabela específica.

Ela pode ser usada para realizar ações antes ou após a exclusão de dados da tabela. Por exemplo, você pode criar uma trigger DELETE para registrar informações sobre os registros excluídos em uma tabela de log antes de excluí-los.

A trigger com DELETE pode ser usada para impor regras de integridade referencial, como impedir a exclusão de registros em uma tabela pai que têm filhos relacionados em uma tabela filho.

Exemplo: Suponha que você tenha uma tabela de "Pedidos" e uma tabela de "ItensPedidos". Você pode criar uma trigger DELETE para garantir que os itens de pedido correspondentes sejam excluídos automaticamente quando um pedido for excluído.

Trigger UPDATE:  
Uma trigger com UPDATE é uma trigger que é acionada automaticamente quando uma instrução UPDATE é executada em uma tabela específica.

Ela pode ser usada para realizar ações antes ou após a atualização de dados na tabela. Por exemplo, você pode criar uma trigger UPDATE para registrar as alterações feitas em determinados campos de registro antes de atualizá-los.

A trigger com UPDATE pode ser usada para impor regras de validação ou de negócios, como impedir que um valor específico seja atualizado em uma coluna.

Exemplo: Em uma tabela de "Colaboradores", você pode criar uma trigger UPDATE para rastrear a data da última atualização do registro de funcionário e impedir que o salário de um funcionário seja reduzido em mais de 10%.

Em ambas as situações, as triggers DELETE e UPDATE são usadas para automatizar ações relacionadas às instruções DELETE e UPDATE no banco de dados. Elas podem ser poderosas, mas devem ser usadas com cuidado, pois podem afetar o desempenho e a integridade dos dados do banco de dados. É importante projetá-las e testá-las com atenção para garantir que elas atendam aos requisitos específicos do sistema.  

CASCADE vs. RESTRICT em bancos de dados relacionais  
  
Quando você está aprendendo sobre bancos de dados, especialmente os do tipo relacional, você descobre que eles são como um grande quebra-cabeça onde cada peça é uma informação que precisa se encaixar perfeitamente com as outras. Para manter esse quebra-cabeça organizado, existem regras que nos ajudam a entender o que acontece quando queremos alterar ou remover uma dessas peças. Duas dessas regras são chamadas de CASCADE e RESTRICT, e elas são aplicadas quando temos operações que afetam várias partes do quebra-cabeça ao mesmo tempo, ou seja, quando queremos deletar ou atualizar dados que estão ligados por uma relação chamada de chave estrangeira. Vamos entender um pouco sobre cada uma delas.

CASCADE  
Imagine que temos um banco de dados de uma escola e uma tabela chamada "Turmas" que está relacionada com outra tabela chamada "Alunos". Se a turma A for deletada, o que acontece com os alunos que estão nessa turma? CASCADE é como uma onda que leva tudo que está conectado com ela. Se deletarmos a turma A e tivermos configurado CASCADE para a relação entre as tabelas, todos os alunos relacionados à turma A também serão deletados automaticamente.

Exemplo de código com CASCADE:

Copiar  
ALTER TABLE Alunos  
ADD CONSTRAINT fk\_turma  
FOREIGN KEY (turma\_id) REFERENCES Turmas(turma\_id)  
ON DELETE CASCADE;

RESTRICT  
Por outro lado, RESTRICT age como um guarda de trânsito que diz "Você não pode passar\!". Usando o mesmo exemplo da escola, se tentarmos deletar a turma A e houver alunos relacionados a ela com a regra RESTRICT aplicada, o banco de dados vai impedir essa ação e mostrará um erro. Isso garante que não vamos perder informações importantes acidentalmente.

Exemplo de código com RESTRICT:

Copiar  
ALTER TABLE Alunos  
ADD CONSTRAINT fk\_turma  
FOREIGN KEY (turma\_id) REFERENCES Turmas(turma\_id)  
ON DELETE RESTRICT;

Operações de Grande Escala  
Quando trabalhamos com muitos dados, como em bancos de dados de grandes empresas, é crucial escolher entre CASCADE e RESTRICT com cuidado. CASCADE pode ser útil, mas também perigoso se deletarmos dados que não deveríamos. RESTRICT é mais seguro, mas pode dificultar a atualização e a exclusão de dados em massa.

Praticar é a melhor maneira de aprender, então experimente criar suas próprias tabelas e consultas, aplique CASCADE e RESTRICT, e veja o que acontece. Lembre-se de que entender como as coisas funcionam por baixo dos panos pode fazer uma grande diferença na sua habilidade de trabalhar com bancos de dados eficientemente.

Transações \- COMMIT e ROLLBACK  

As transações são uma parte fundamental da gestão de bancos de dados, permitindo que um conjunto de operações seja tratado como uma única unidade lógica e atômica. Isso significa que ou todas as operações de uma transação são concluídas com sucesso e confirmadas, ou nenhuma delas é realizada (rollback), para manter a consistência dos dados. Aqui estão os conceitos essenciais sobre transações:

Iniciando uma Transação:  
Em SQL, você pode iniciar uma transação usando a instrução BEGIN TRANSACTION, BEGIN, ou simplesmente START TRANSACTION, dependendo do sistema de gerenciamento de banco de dados (DBMS) que você está usando. Por exemplo:

Copiar  
BEGIN TRANSACTION;  
\-- ou  
BEGIN;  
\-- ou  
START TRANSACTION;

Funcionamento do COMMIT:  
O comando COMMIT é usado para confirmar todas as operações realizadas dentro de uma transação. Quando você emite o comando COMMIT, as alterações feitas nas tabelas durante a transação se tornam permanentes no banco de dados.

Copiar  
COMMIT;

Funcionamento do ROLLBACK:  
O comando ROLLBACK é usado para desfazer todas as operações realizadas dentro de uma transação. Isso significa que todas as alterações feitas durante a transação são revertidas e o estado do banco de dados volta ao que estava antes do início da transação.

Copiar  
ROLLBACK;

Vantagens de Usar Transações:  
Atomicidade: As transações garantem que todas as operações sejam concluídas com sucesso ou que nenhuma delas seja executada. Isso ajuda a manter a integridade dos dados, evitando estados inconsistentes no banco de dados.

Consistência: As transações garantem que o banco de dados permaneça em um estado consistente antes e depois da execução de uma sequência de operações. Se algo der errado, a transação pode ser revertida (rollback) para evitar inconsistências.

Isolamento: O isolamento permite que várias transações ocorram simultaneamente sem interferir umas nas outras. Os DBMSs geralmente oferecem níveis de isolamento para controlar o grau de concorrência e proteger a consistência dos dados.

Durabilidade: O comando COMMIT garante que as alterações em uma transação sejam permanentes, mesmo em caso de falha do sistema ou reinicialização do banco de dados.

Gerenciamento de Erros: As transações permitem que os erros sejam gerenciados de forma controlada. Se algo der errado, você pode optar por reverter a transação e manter o banco de dados em um estado consistente.

Trabalho em Equipe: Em ambientes multiusuário, as transações ajudam a coordenar o trabalho de várias sessões de usuários, garantindo que as operações sejam executadas de maneira ordenada e consistente.

Desvantagens de Usar Transações:  
Bloqueio: Em sistemas com alto volume de transações concorrentes, o uso indevido de transações pode levar a bloqueios, onde uma transação aguarda a conclusão de outra, afetando o desempenho.

Complexidade: O uso de transações pode aumentar a complexidade do código e do design do banco de dados.

Uso de Recursos: Transações podem consumir recursos significativos do sistema, especialmente se não forem gerenciadas adequadamente.

Em resumo, as transações desempenham um papel fundamental na manutenção da consistência e da integridade dos dados em um banco de dados. Elas fornecem controle e segurança ao gerenciar operações complexas, evitando estados inconsistentes e permitindo o gerenciamento adequado de erros e conflitos em ambientes de banco de dados. No entanto, é importante usá-las com sabedoria e considerar as implicações de desempenho ao projetar sistemas que dependem fortemente delas.

[image1]: <data:image/png;base64,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>

[image2]: <data:image/png;base64,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>