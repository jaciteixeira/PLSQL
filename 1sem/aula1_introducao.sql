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
    DBMS_OUTPUT.PUT_LINE('A somatória é :'||total);
END;
/

--EXERCIO 3
DECLARE 
    vlr NUMBER :=5;
    ant NUMBER ;
    suc NUMBER ;
BEGIN
    suc := vlr+1;
    ant := vlr-1;
    DBMS_OUTPUT.PUT_LINE('valor: '||vlr);
    DBMS_OUTPUT.PUT_LINE('sucessor: '||suc);
    DBMS_OUTPUT.PUT_LINE('antecessor: '||ant);
END;
/

--EXERCIO 4
DECLARE 
    meu_salario NUMBER := 5789.00;
    qtd NUMBER;
BEGIN
    qtd := meu_salario/1412;
    DBMS_OUTPUT.PUT_LINE('qtd da salario dentro de '||meu_salario||' é '||qtd);
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
    DBMS_OUTPUT.PUT_LINE('Media é: '||media);
END;
/

--EXERCICIO 6
DECLARE 
    meu_salario NUMBER := 4500;
    reajuste NUMBER ; 
    taxa_reaj NUMBER := 1.05;
BEGIN
    reajuste := meu_salario * taxa_reaj;
    DBMS_OUTPUT.PUT_LINE(reajuste);
END;
/