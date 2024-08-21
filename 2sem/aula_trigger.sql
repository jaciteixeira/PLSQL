drop table produto cascade constraints;
create table produto(
codigo number(4),
valor number(7,2));

insert into produto values (1001, 2.55);
insert into produto values (1002, 3.25);
insert into produto values (1003, 2.85);

drop table valor_produto cascade constraints;
create table valor_produto(
codigo number(4),
valor_anterior number(7,2),
valor_novo number(7,2));

CREATE OR REPLACE TRIGGER verifica_valor
    BEFORE UPDATE
    OF valor
    ON PRODUTO
    FOR EACH ROW
BEGIN
    INSERT INTO VALOR_PRODUTO VALUES (:OLD.CODIGO, :OLD.VALOR, :NEW.VALOR);
END;

SELECT * FROM PRODUTO;
SELECT * FROM VALOR_PRODUTO; 

UPDATE PRODUTO SET VALOR = 1.45 WHERE CODIGO = 1003;


/*
Suponha que você tenha uma tabela chamada funcionario e deseje que garantir que 
o salario de um novo funcionario não seja inserido como um valor negativo

Tabela funcionario : 
mat_func - N - 3 - PK
nm_func A - 30 - Nn
salario N - 10,2
*/

create table funcFiap(mat_fun number(3) primary key, nm_fun varchar(30) not null, salario number(10,2));

CREATE OR REPLACE TRIGGER validar_salario
BEFORE INSERT ON funcFiap
for each row
begin
    IF :new.salario < 0 then
        raise_application_error(-20001, 'O salario não pode ser um valor negativo');
    END IF;
END;

insert into funcFiap values (1, 'Fulano', 2000.55);
select * from funcFiap;
insert into funcFiap values (1, 'Fulano', -2000.55);


/*
Criar um gatilho que monitore as alterações realizadas na coluna senha
Tabela: altere  a tabela FuncFiap, inserindo a coluna senha 
As senhas alteradas devem ser gravadas na tabela:

*/

ALTER TABLE funcFiap ADD senha VARCHAR2(6);

drop table nova_senha cascade constraints;
CREATE TABLE nova_senha (
    senha_antiga VARCHAR2(6),
    senha_atual VARCHAR2(6),
    dt_alterada DATE
);

CREATE OR REPLACE TRIGGER validar_senha
AFTER UPDATE OF senha
ON funcFiap
FOR EACH ROW
BEGIN
    IF :new.senha = :old.senha THEN
        RAISE_APPLICATION_ERROR(-20001, 'Senha deve ser diferente da anterior');
    ELSE
        INSERT INTO nova_senha (senha_antiga, senha_atual, dt_alterada)
        VALUES (:old.senha, :new.senha, SYSDATE);
    END IF;
END;
/

UPDATE funcFiap
SET senha = '123456'
WHERE mat_fun = 1;

SELECT * FROM funcFiap;
SELECT * FROM nova_senha;