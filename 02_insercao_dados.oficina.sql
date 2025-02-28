use oficina_mecanica;

-- inserção de dados nas tabelas

insert into clientes values
(1, 'Carlos', 'Silva', 'Rua das Palmeiras, 123, Vila Velha, Santo André, SP', '11987654321'),
(2, 'Mariana', 'Souza', 'Av. Brasil, 456, Vila Nova, São Caetano do Sul, SP ', '11998765432'),
(3, 'João', 'Pereira', 'Rua do Comércio, 789, bairro Verde, Rio de Janeiro/RJ', '11996547812'),
(4, 'Fernanda', 'Oliveira', 'Rua do Bosque, 101, bairro Eldorado, Santo André/SP', '11997456321'),
(5, 'Pedro', 'Santos', 'Av. Central, 202, Jardim das Flores, São Bernardo do Campo/SP', '11992345678');

insert into equipe_mecanica values
(1), (2), (3);

insert into mecanicos (id_mecanico, id_equipe, primeiro_nome, sobrenome, endereco, especialidade) values
(1, 3, 'Roberto', 'Lima', 'Rua das Oficinas, 300, São Bernardo do Campo/SP', 'Motor'),
(2, 1, 'Paulo', 'Mendes', 'Rua das Garagens, 400, Santo André/SP', 'Freios'),
(3, 2, 'Carlos', 'Ferreira', 'Rua das Ferramentas, 500, São Bernardo do Campo/SP', 'Suspensão'),
(4, 1, 'Lucas', 'Santos', 'Av. Automotiva, 600, São Bernardo do Campo/SP', 'Transmissão'),
(5, 2, 'André', 'Oliveira', 'Rua do Torno, 700, São Bernardo do Campo/SP', 'Eletricidade');

insert into pecas values 
(1, 'Filtro de Óleo', 50.00, 'Autopeças Silva'),
(2, 'Pastilhas de Freio', 300.00, 'Autopeças Brasil'),
(3, 'Óleo Lubrificante', 200.00, 'Lubrificantes XPTO'),
(4, 'Embreagem Completa', 1000.00, 'Autopeças Central'),
(5, 'Velas de Ignição', 150.00, 'Autopeças Top');

insert into servicos values
(1, 'Troca de Óleo', 'Substituição do óleo do motor', 'Revisão', 200.00),
(2, 'Alinhamento', 'Alinhamento de direção', 'Revisão', 150.00),
(3, 'Revisão Completa', 'Verificação de todos os sistemas do veículo', 'Revisão', 800.00),
(4, 'Troca de Pastilhas', 'Substituição de pastilhas de freio', 'Conserto', 400.00),
(5, 'Troca de Embreagem', 'Substituição do conjunto de embreagem', 'Conserto', 1200.00);

insert into veiculos (id_veiculo, id_cliente, placa, marca, modelo) values
(1, 4, 'ABC1234', 'Ford', 'Fiesta'),
(2, 5, 'DEF5678', 'Chevrolet', 'Onix'),
(3, 3, 'GHI9101', 'Volkswagen', 'Gol'),
(4, 2,'JKL2345', 'Toyota', 'Corolla'),
(5, 1, 'MNO6789', 'Renault', 'Sandero');

insert into ordens_servico (id_equipe, id_veiculo, id_cliente, id_ordens_servico, data_emissao, data_conclusao, status_servico, autorizacao_cliente, valor_total) values
(2, 1, 4, 301, '2025-02-20', '2025-02-22', 'Concluído', 'Autorizado', 1500.00),
(1, 2, 5, 302, '2025-02-21', NULL, 'Em execução', 'Autorizado', 800.00),
(2, 3, 3, 303, '2025-02-22', '2025-02-23', 'Concluído', 'Autorizado', 1200.00),
(3, 4, 2, 304, '2025-02-23', NULL, 'Em execução', 'Autorizado', 700.00),
(2, 5, 1, 305, '2025-02-24', NULL, 'Pendente', 'Autorizado', 2000.00);

insert into pecas_por_os (id_ordens_servico, id_veiculo, id_cliente, id_peca) values
(301, 1, 4, 2),
(302, 2, 5, 4),
(303, 3, 3, 5),
(304, 4, 2, 3),
(305, 5, 1, 1);

insert into servicos_por_os (id_ordens_servico, id_veiculo, id_cliente, id_servico) values
(301, 1, 4, 4),
(302, 2, 5, 5),
(303, 3, 3, 3),
(304, 4, 2, 1),
(305, 5, 1, 1),
(304, 4, 2, 2);

-- conferindo dados inseridos

select * from clientes;
select * from equipe_mecanica;
select * from mecanicos;
select * from ordens_servico;
select * from pecas;
select * from pecas_por_os;
select * from servicos;
select * from servicos_por_os;
select * from veiculos;
