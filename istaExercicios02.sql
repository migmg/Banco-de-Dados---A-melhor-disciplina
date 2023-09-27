exerc 1 CREATE PROCEDURE sp_ListarAutores()
BEGIN
SELECT * FROM autor;
END

excerc 2 CREATE PROCEDURE sp_LivrosPorCategoria(IN nomes_das_categorias varchar(200))
BEGIN
select *
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nomes_das_categorias = Categoria.Nome;
END;

exerc 3 CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN nomes_das_categorias varchar(200))
BEGIN
select count(Livro.Titulo) as numero_de_livros, Categoria.Nome as categoria
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nome_categoria = Categoria.Nome
group by Categoria.Nome;
END;


exerc 4 CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nomes_das_categorias varchar(200), OUT res varchar(50))
BEGIN
DECLARE quantidade INT DEFAULT 0;
	select count(Livro.Titulo) as number_de_livros
    INTO quantidade
	from Livro
	inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
	where nome_categoria = Categoria.Nome
	group by Categoria.Nome
	;
IF quant > 0 THEN SET res = 'tem livros';
ELSE 
SET res = 'não tem livros';
END IF;
select res;
END;

exerc 5 CREATE PROCEDURE sp_LivrosAteAno(IN anos INT)
BEGIN
SELECT Titulo, Ano_Publicacao from Livro
where Ano_Publicacao <= ano
ORDER BY Ano_Publicacao desc;
END;

exerc 6 CREATE PROCEDURE sp_TitulosPorCategoria(IN nomes_das_categorias varchar(400))
BEGIN
select Livro.Titulo, Categoria.Nome as categoria
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nomes_das_categorias = Categoria.Nome;
END;

exerc 7 CREATE PROCEDURE sp_AdicionarLivro(
    in titulo_dos_livro varchar(250),
    in editora_id int,
    in ano_de_publicaca int,
    in numero_das_paginas int,
    in categoria_id int,
    out re varchar(150)
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
        values (titulo_dos_livro, editora_id,ano_de_publicaca, numero_das_paginas, categoria_id);

        set res = "O livro foi adicionado";
    end if;
    select res;
end;

exerc 8 CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
SELECT Nome from Autor
ORDER BY Data_Nascimento
LIMIT 1;
END


exerc 9 CREATE PROCEDURE sp_ListarAutores(): Esta linha define o início da criação da stored procedure chamada sp_ListarAutores. A procedure é projetada para listar todos os autores, e não recebe nenhum parâmetro.

BEGIN: O bloco BEGIN marca o início do corpo da stored procedure. A partir deste ponto, começamos a definir a lógica da procedure.

SELECT * FROM autor;: Esta é a consulta SQL que seleciona todos os registros da tabela autor. O asterisco (*) indica que estamos selecionando todas as colunas da tabela.

END;: Isso marca o fim do corpo da stored procedure.


exerc 10 CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
select Livro.Titulo, Autor.Nome, Autor.Sobrenome
from Livros
inner join Autor_Livro on Autor_Livro.Livro_ID = Livros.Livro_ID
inner join Autores on Autor_Livro.Autor_ID = Autor.Autor_ID;
END
