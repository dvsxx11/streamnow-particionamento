select*from usuarios;
select*from reproducoes;

SELECT COUNT(*) AS total_usuarios
FROM usuarios
WHERE pais = 'Brasil';

select tableoid::regclass AS particao, *
from usuarios;

select tableoid::regclass AS particao, *
from reproducoes;]
