1) create trigger clientes_nome
after insert on Clientes
for each row
insert into Auditoria(mensagem, data_hora)
values ('qualquer coisa', NOW()); 
2)create trigger delete_clientes
before delete on Clientes
for each row
insert into Auditoria(mensagem)
values ('informando')
