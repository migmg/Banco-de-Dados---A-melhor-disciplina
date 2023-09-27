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


exerc 4 CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nome_categoria varchar(200), OUT resposta varchar(50))
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

exerc 5 CREATE PROCEDURE sp_LivrosAteAno(IN ano year)
BEGIN
SELECT Titulo, Ano_Publicacao from Livro
where Ano_Publicacao <= ano
ORDER BY Ano_Publicacao desc;
END;

exerc 6 CREATE PROCEDURE sp_TitulosPorCategoria(IN nome_categoria varchar(400))
BEGIN
select Livro.Titulo, Categoria.Nome as categoria
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nome_categoria = Categoria.Nome;
END;

exerc 7 CREATE PROCEDURE sp_AdicionarLivro(
    in livro_titulo varchar(250),
    in editora_id int,
    in ano_publicacao int,
    in numero_paginas int,
    in categoria_id int,
    out resposta varchar(150)
)
begin
    declare livro_existe int;
	select COUNT(*) into livro_existe
    from Livro
    where Titulo = livro_titulo;
    if livro_existe > 0 then
        set resposta = "Esse título exite";
    else
        insert into Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        values (livro_titulo, editora_id, ano_publicacao, numero_paginas, categoria_id);

        set resposta = "O livro foi adicionado";
    end if;
    select resposta;
end;
