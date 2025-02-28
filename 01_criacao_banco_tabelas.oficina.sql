-- criando e acessando o banco de dados
create database oficina_mecanica;
use oficina_mecanica;

-- criando a tabela clientes
create table clientes (
	id_cliente int not null auto_increment primary key,
    primeiro_nome varchar(45) not null,
    sobrenome varchar(45) not null,
    endereço varchar(200) not null,
    telefone char(11) not null
);


-- criando a tabela veiculos
create table veiculos (
	id_veiculo int not null primary key,
    id_cliente int,
    placa varchar(8) not null,
    marca varchar(20),
    modelo varchar(45),
    constraint fk_veiculos_clientes foreign key (id_cliente) references clientes(id_cliente)
);


-- criando a tabela serviços
create table servicos (
	id_servico int not null auto_increment primary key,
	nome_servico varchar(45) not null,
    descricao varchar(100) not null,
    tipo enum('Conserto', 'Revisão'),
    valor_servico float not null
);


-- criando a tabela peças
create table pecas (
 id_peca int not null auto_increment primary key,
 nome_peca varchar(45) not null,
 valor_peca float not null,
 fornecedor varchar(100)
);


-- criando a tabela equipe mecanica
create table equipe_mecanica (
	id_equipe int not null primary key
);


-- criando a tabela mecanicos
create table mecanicos (
	id_mecanico int not null auto_increment primary key,
    id_equipe int,
    primeiro_nome varchar(45) not null,
    sobrenome varchar(45) not null,
    endereco varchar(200),
    especialidade varchar(45),
    constraint fk_mecanicos_equipe_mecanica foreign key (id_equipe) references equipe_mecanica(id_equipe)
);


-- criando a tabela ordens_serviço
create table ordens_servico (
	id_ordens_servico int not null auto_increment primary key,
    id_veiculo int,
    id_cliente int,
    id_equipe int,
    data_emissao date,
    data_conclusao date,
    status_servico enum('Pendente', 'Em execução', 'Concluído') default 'Pendente',
    autorizacao_cliente enum('Autorizado','Não Autorizado') default 'Não Autorizado',
    valor_total float,
    constraint fk_ordens_servico_veiculo foreign key (id_veiculo) references veiculos(id_veiculo),
    constraint fk_ordens_servico_cliente foreign key (id_cliente) references clientes(id_cliente),
    constraint fk_ordens_servico_equipe foreign key (id_equipe) references equipe_mecanica(id_equipe)
);


-- criação da tabela relacionamento servicos_por_os
create table servicos_por_os (
	id_ordens_servico int,
    id_veiculo int,
    id_cliente int,
    id_servico int,
    primary key(id_ordens_servico, id_veiculo, id_cliente, id_servico),
    constraint fk_servicos_por_os_ordens_servico foreign key (id_ordens_servico) references ordens_servico(id_ordens_servico),
    constraint fk_servicos_por_os_veiculos foreign key (id_veiculo) references veiculos(id_veiculo),
    constraint fk_servicos_por_os_clientes foreign key (id_cliente) references clientes(id_cliente),
    constraint fk_servicos_por_os_servico foreign key (id_servico) references servicos(id_servico)
);


-- criação da tabela relacionamento pecas_por_os
create table pecas_por_os (
	id_ordens_servico int,
    id_veiculo int,
    id_cliente int,
    id_peca int,
    primary key(id_ordens_servico, id_veiculo, id_cliente, id_peca),
    constraint fk_pecas_por_os_ordens_servico foreign key (id_ordens_servico) references ordens_servico(id_ordens_servico),
    constraint fk_pecas_por_os_veiculos foreign key (id_veiculo) references veiculos(id_veiculo),
    constraint fk_pecas_por_os_clientes foreign key (id_cliente) references clientes(id_cliente),
    constraint fk_pecas_por_os_pecas foreign key (id_peca) references pecas(id_peca)
);


-- checando as tabelas criadas
desc clientes;
desc equipe_mecanica;
desc mecanicos;
desc ordens_servico;
desc pecas;
desc pecas_por_os;
desc servicos;
desc servicos_por_os;
desc veiculos;
