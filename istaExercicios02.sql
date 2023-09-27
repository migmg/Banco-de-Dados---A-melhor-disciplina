exerc 1 CREATE PROCEDURE sp_ListarAutores()
BEGIN
SELECT * FROM autor;
END

CREATE PROCEDURE sp_LivrosPorCategoria(IN nome_categoria varchar(200))
BEGIN
select *
from Livro
inner join Categoria on Categoria.Categoria_ID = Livro.Categoria_ID
where nome_categoria = Categoria.Nome;
END;

