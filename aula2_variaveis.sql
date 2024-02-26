DROP TABLE alunos;
CREATE TABLE Alunos(
    id_aluno int primary key,
    nome_aluno VARCHAR2(255),
    nota_aluno NUMBER
);
INSERT INTO alunos VALUES (1,'João', 8.9);
INSERT INTO alunos VALUES (2,'Maria', 9.0);
INSERT INTO alunos VALUES (3,'Francisco', 5.3);
INSERT INTO alunos VALUES (4,'Pedro', 8.1);
INSERT INTO alunos VALUES (5,'Rosa', 10.0);

select * from alunos;

DECLARE
    nota Alunos.nota_aluno%type := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(nota);
END;
/
------------------------

VARIABLE teste_bind VARCHAR2(255);
BEGIN
     :teste_bind := 'Teste Variavel Bind';
     DBMS_OUTPUT.PUT_LINE(:teste_bind);
END;
/
-----------------------------

VARIABLE media NUMBER;
--alterar/incluir valor na variavel
EXEC :media:=8;
SELECT :media FROM dual;

----------------------------------

PRINT teste_bind;
PRINT media;

---------------------------------
DEFINE id_;
SELECT * FROM Aluno where id_aluno=&_id;

------------------------------------
-- Exercio 1
DECLARE
    nome VARCHAR2(250):= 'Nome';
BEGIN
     DBMS_OUTPUT.PUT_LINE(nome);
END;

