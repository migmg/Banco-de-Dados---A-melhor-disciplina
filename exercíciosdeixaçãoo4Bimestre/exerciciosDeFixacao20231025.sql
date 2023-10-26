1) create trigger clientes_nome
after insert on Clientes
for each row
insert into Auditoria(mensagem, data_hora)
values ('qualquer coisa', NOW()); 
insert into(nome)
values('joazinho')
2)create trigger delete_clientes
before delete on Clientes
for each row
insert into Auditoria(mensagem)
values ('informando nome excluido')
delete from clientes
3)create trigger update_nome
after update on Clientes
for each row
insert into Auditoria(mensagem)
values (concat('antigo nome', old.nome, 'nome novo' , new.nome));

