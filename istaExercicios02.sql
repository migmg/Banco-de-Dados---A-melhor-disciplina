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

exerc 8 CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
SELECT Nome from Autor
ORDER BY Data_Nascimento
LIMIT 1;
END


exerc 9 CREATE PROCEDURE sp_LivrosAteAno(IN ano YEAR): Esta linha define o início da criação da stored procedure chamada sp_LivrosAteAno. A procedure é projetada para listar os livros publicados até um ano específico, e recebe um parâmetro chamado ano do tipo YEAR.

BEGIN: O bloco BEGIN marca o início do corpo da stored procedure. A partir deste ponto, começamos a definir a lógica da procedure.

SELECT Titulo, Ano_Publicacao: Esta é a consulta SQL que seleciona os títulos e anos de publicação dos livros.

FROM Livro: Indica a tabela da qual estamos selecionando os dados, que é a tabela Livro.

WHERE Ano_Publicacao <= ano: Esta parte da consulta filtra os resultados para encontrar os livros onde o ano de publicação é menor ou igual ao valor fornecido no parâmetro ano.

ORDER BY Ano_Publicacao DESC;: Isso ordena os resultados por ano de publicação em ordem decrescente, o que significa que os livros mais recentes aparecerão no topo da lista.

END;: Isso marca o fim do corpo da stored procedure.


exerc 10 CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
select Livro.Titulo, Autor.Nome, Autor.Sobrenome
from Livros
inner join Autor_Livro on Autor_Livro.Livro_ID = Livros.Livro_ID
inner join Autores on Autor_Livro.Autor_ID = Autor.Autor_ID;
END
