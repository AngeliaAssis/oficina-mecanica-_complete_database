-- realizando queries de consultas

-- 1. Quais são os nomes e placas dos veículos atendidos na oficina até agora?

select * from veiculos;
select placa, modelo, marca from veiculos;


-- 2. Liste o nome completo dos clientes que possuem veículos com ordens de serviço em andamento.

select concat(c.primeiro_nome, ' ', c.sobrenome) as nome_completo, concat(v.modelo, ' ', v.marca) as veiculo, os.status_servico 
from clientes c inner join veiculos v
on c.id_cliente = v.id_cliente
inner join ordens_servico os
on v.id_cliente = os.id_cliente
where os.status_servico = 'Em execução';

-- 3. Quais mecânicos trabalharam na ordem de serviço de maior valor total?
select * from ordens_servico;

-- verificando mecanicos da maior OS sem considerar status
select primeiro_nome, sobrenome, os.id_ordens_servico, valor_total
from ordens_servico os inner join equipe_mecanica em
on os.id_equipe = em.id_equipe
inner join mecanicos m
on em.id_equipe = m.id_equipe
where os.valor_total =
	(select max(valor_total) from ordens_servico);
    
    
-- 4. Liste todas as ordens de serviço finalizadas, exibindo o nome do cliente, modelo do veículo, data de emissão e valor total.

select distinct os.id_ordens_servico, concat(c.primeiro_nome, ' ', c.sobrenome) as nome_completo, modelo, data_emissao, valor_total, status_servico
from ordens_servico os inner join clientes c 
on os.id_cliente = c.id_cliente
inner join veiculos v
on c.id_cliente = v.id_cliente
where status_servico = 'Concluído';


-- 5. Quais serviços foram realizados no veículo de placa 'ABC1234'?

select placa, nome_servico, descricao 
from veiculos v inner join servicos_por_os spo
on v.id_veiculo = spo.id_veiculo
inner join servicos s
on spo.id_servico = s.id_servico
where v.placa = 'ABC1234';


-- 6. Quantos serviços do tipo 'Revisão' foram realizados na oficina até agora?

select spo.id_ordens_servico, s.nome_servico, s.tipo from servicos_por_os spo, servicos s
where spo.id_servico = s.id_servico
and s.tipo = 'Revisão';

-- or
select count(spo.id_servico) as total_revisões 
from servicos_por_os spo 
inner join servicos s
on spo.id_servico = s.id_servico
where s.tipo = 'Revisão';

