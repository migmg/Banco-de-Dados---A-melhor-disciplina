exerc 1 CREATE PROCEDURE sp_ListarAutores()
BEGIN
SELECT * FROM autor;
END

excerc 2CREATE PROCEDURE sp_LivrosPorCategoria(IN nome_categoria varchar(200))
BEGIN
select *
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nome_categoria = Categoria.Nome;
END;

exerc 3 CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN nome_categoria varchar(200))
BEGIN
select count(Livro.Titulo) as numero_de_livros, Categoria.Nome as categoria
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nome_categoria = Categoria.Nome
group by Categoria.Nome;
END;

ex 4 
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nome_categoria varchar(200), OUT resposta varchar(50))
BEGIN
DECLARE quantidade INT DEFAULT 0;
	select count(Livro.Titulo) as number_de_livros
    INTO quant
	from Livro
	inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
	where nome_categoria = Categoria.Nome
	group by Categoria.Nome
	;
IF quant > 0 THEN SET resposta = 'tem livros';
ELSE 
SET respost = 'não tem livros';
END IF;
select respost;
END;
