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

SET SERVEROUTPUT ON;
-- exercicio 2 (v1)
DECLARE 
    total number;
    vl_real number;
    qtd_dolar number;
    tx_cambio number := 4.99;
BEGIN
    qtd_dolar :=10;
    vl_real:= qtd_dolar * tx_cambio;
    dbms_output.put_line('O valor de ' || qtd_dolar || ' dolares em reais é ' || vl_real);
END;


-- exercicio 2 (v2)
ACCEPT qtd PROMPT 'Digite o valor em dolares:'; 
-- COM O ACCEPT PODEMOS PERSONALIZAR A MENSAGEM DO PROMPT
DECLARE 
    total number;
    vl_real number;
    qtd_dolar number;
    tx_cambio number := 4.99;
BEGIN
    qtd_dolar :=&qtd;
    vl_real:= qtd_dolar * tx_cambio;
    dbms_output.put_line('O valor de ' || qtd_dolar || ' dolares em reais é ' || vl_real);
END;

--exercicio 3
--ACCEPT parc PROMPT 'Digite a quantidade de parcelas:';
--ACCEPT vlr PROMPT 'Digite o valor da compra:';
DECLARE 
    parc number :=&parc;
    juros number:=0.01 * parc;
    vl_total number := &vlr * (1 + juros);
BEGIN
      -- Exibição dos resultados
      DBMS_OUTPUT.PUT_LINE('Valor da parcela: R$' || TO_CHAR(vl_total / parc, '999.99'));
      DBMS_OUTPUT.PUT_LINE('Quantidade de parcelas: ' || parc);
      DBMS_OUTPUT.PUT_LINE('Valor total da compra: R$' || TO_CHAR(vl_total, '999.99'));
END;

--exercicio 3 (V PROFESSOR)
ACCEPT parc PROMPT 'Digite a quantidade de parcelas:';
ACCEPT vlr PROMPT 'Digite o valor da compra:';
DECLARE 
    vl_total number := &vlr ;
    juros number:=1.01 ;
    vl_parc number;
    qtd_parc number :=&parc;
BEGIN
    vl_parc:=(vl_total/qtd_parc)*juros;
    -- Exibição dos resultados
    DBMS_OUTPUT.PUT_LINE('Valor da parcela: R$' || vl_parc);
    DBMS_OUTPUT.PUT_LINE('Quantidade de parcelas: ' || qtd_parc);
    DBMS_OUTPUT.PUT_LINE('Valor total da compra: R$' || vl_total+vl_parc);
END;

