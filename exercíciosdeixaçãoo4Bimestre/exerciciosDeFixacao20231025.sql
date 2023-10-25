1) create trigger clientes_nome
after insert on Clientes
for each row
insert into Auditoria(mensagem, data_hora)
values ('qualquer coisa', NOW()); 
