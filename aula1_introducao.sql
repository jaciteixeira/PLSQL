SET SERVEROUTPUT ON;
------------
DECLARE
    ola VARCHAR2(50);
BEGIN
    ola:= 'Olá Mundo PL/SQL!';
    DBMS_OUTPUT.PUT_LINE(ola);
END;
/

--EXERCIO 1
DECLARE 
    nome VARCHAR2(50);
BEGIN
    nome  := 'Jaci';
    DBMS_OUTPUT.PUT_LINE(nome);
END;
/

--EXERCIO 2
DECLARE 
    total NUMBER;
    vl1 NUMBER := 1;
    vl2 NUMBER := 1;
    vl3 NUMBER := 1;
BEGIN
    total  := vl1 + vl2 + vl3;
    DBMS_OUTPUT.PUT_LINE(total);
END;
/

--EXERCIO 3
DECLARE 
    vlr NUMBER := 1;
    ant NUMBER ;
    suc NUMBER ;
BEGIN
    suc := vlr+1;
    ant := vlr-1;
    DBMS_OUTPUT.PUT_LINE(suc);
    DBMS_OUTPUT.PUT_LINE(ant);
END;
/

--EXERCIO 4
DECLARE 
    meu_salario NUMBER := 2000.00;
    qtd NUMBER ;
BEGIN
    qtd;
END;
/

--EXERCICIO 5
DECLARE 
    cp1 NUMERIC := 8;
    cp2 NUMERIC := 6;
    cp3 NUMERIC := 3;
    media NUMERIC;
BEGIN
    media := (cp1 + cp2 + cp3) / 3; 
    DBMS_OUTPUT.PUT_LINE(media);
END;
/

--EXERCICIO 6
DECLARE 
    meu_salario NUMBER := 5326.70;
    reajuste NUMBER ; 
BEGIN
    reajuste := (meu_salario * 0.05) + meu_salario;
    DBMS_OUTPUT.PUT_LINE(reajuste);
END;
/