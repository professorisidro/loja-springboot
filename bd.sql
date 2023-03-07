CREATE TABLE departamento(
cod_depto INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(50) NOT NULL
);

insert into departamento values (null, 'Informatica');
insert into departamento values (null, 'Cama/Mesa/Banho');
insert into departamento values (null, 'Vestuario');
insert into departamento values (null, 'Games');

/* alternativa para inserir dados
insert into departamento(nome) values ('Vestuario')
*/

CREATE TABLE produto(
    cod_produto INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    descricao TEXT, 
    qtd_estoque INTEGER, 
    preco DOUBLE DEFAULT 0.0,
    link_foto VARCHAR(255),     
    cod_depto INTEGER NOT NULL,
    CONSTRAINT fk_departamento FOREIGN KEY (cod_depto)
           REFERENCES departamento(cod_depto)
);


insert into produto values (null, 'Computador', 
                           'Computador cheio de luzinha',
                           5, 1500.0, 'computador.jpg', 1);
insert into produto values (null, 'Jogo de toalhas', 
                           'Toalhas que raspam e nao secam',
                           15, 25.0, 'toalha.jpg', 2);
insert into produto values (null, 'Camisa de Loja', 
                           'Camisa que fica transparente com o tempo',
                           50, 10.0, 'camisa.jpg', 3);

insert into produto values (null, 'Monitor', 
                           'Monitor que fica parecendo um circo',
                           5, 1000.0, 'monitor.jpg', 1);                           
insert into produto values (null, 'Mouse', 
                           'Mouse que acende luzinha de madrugada so pra encher o saco',
                           20, 100.0, 'mouse.jpg', 1);

insert into produto values (null, 'Travesseiro', 
                           'Travesseiro da nasa ruim pra bune',
                           50, 30.0, 'travesseiro.jpg', 2);
insert into produto values (null, 'God of JAR', 
                           'Jogo Massa!!!',
                           20, 200.0, 'godofjar.jpg', 4);
insert into produto values (null, 'Preisteits', 
                           'Clone do Pleisteichon do SBT',
                           50, 150.0, 'playstates.jpg', 4);                                                                                                            

/* recuperando todos os departamentos e seus respectivos produtos
mesmo que não haja produtos no departamento */
select departamento.nome as 'Departamento',
       produto.nome as 'Produto'
       from departamento left outer join produto 
       on departamento.codDepto = produto.codDepto;

/* recuperando a quantidade de produtos por departamento */
select departamento.nome as 'Departamento',
       produto.nome as 'Produto'
       from departamento left outer join produto 
       on departamento.codDepto = produto.codDepto;

/* recuperar quanto eu tenho de patrimonio em produtos na loja toda */
select sum(qtdEstoque * preco) as "patrimonio"
   from produto;

/* recuperar quanto tem de patrimônio em cada departamento */
select departamento.nome, sum(qtdEstoque * preco)
    from produto inner join departamento 
    on produto.codDepto = departamento.codDepto
    group by departamento.codDepto;

/* o mesmo de cima agora com ordenacao pelo departamento mais valioso */    select departamento.nome, sum(qtdEstoque * preco)
select departamento.nome, sum(qtdEstoque * preco) as 'patrimonio'
    from produto inner join departamento 
    on produto.codDepto = departamento.codDepto
    group by departamento.codDepto
    order by patrimonio desc;

/* o mesmo do anterior, agora dando "apelidos" tb para as tabelas */
select d.nome, sum(p.qtdEstoque * p.preco) as 'patrimonio'
    from produto p inner join departamento d
    on p.codDepto = d.codDepto
    group by d.codDepto
    order by patrimonio desc;

/* criando a tabela cliente */
create table cliente(
    codigo integer not null auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    whatsapp varchar(20) not null unique,
    endereco varchar(100),
    numero integer,
    complemento varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    cep varchar(10)
);


insert into cliente values (null, "Professor Isidro", "isidro@isidro.com",
                            "1198765-4321", "Rua dos Devs", 404, "Ap 200",
                            "Bairro do Cafe", "Java", "01010-011");

insert into cliente values (null, "Pedro Programador", "pedro@pedro.com",
                            "1191234-5678", "Alameda Programmer", 403, "Casa 1",
                            "Bairro Baixo Nivel", "Assembly", "11001-100");